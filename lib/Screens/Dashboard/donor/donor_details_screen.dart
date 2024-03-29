import 'package:flutter/material.dart';
import 'package:lionsclub/Custom_Widget/skeleton_member.dart';

import '../../../consts/app_consts.dart';
import '../../../data/Models/donor_details.dart';
import '../../../data/network/api_services.dart';
import '../../../main.dart';

class DonorDetails extends StatefulWidget {
  final dId, name;
  const DonorDetails({super.key, required this.dId, required this.name});

  @override
  State<DonorDetails> createState() => _DonorDetailsState();
}

class _DonorDetailsState extends State<DonorDetails> {
  List<DonorDetail>? donorDetails;
  bool isDonorDetailsLoading = true;
  bool isDonor = true;

  @override
  void initState() {
    super.initState();
    _fetchDonorDetails();
  }

  Future<void> _fetchDonorDetails() async {
    try {
      List<DonorDetail>? details = await ApiService.fetchData(
        "${AppConstants.baseURL}/donor/${widget.dId}", // Replace with the actual donor ID
        (data) => DonorDetail.fromJson(data),
      );
      setState(() {
        donorDetails = details;
        isDonorDetailsLoading = false;
      });
    } catch (e) {
      print('Error: $e');
      setState(() {
        isDonorDetailsLoading = false;
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: sColor,
        title: Row(
          children: [
            SizedBox(
              height: 60,
              width: 60,
              child: Image.asset('assets/logo_main.png'),
            ),
            Container(
                height: 50, width: 50, child: Image.asset('assets/logo.png')),
            SizedBox(
              width: 5,
            ),
            Text(
              widget.name,
              style: TextStyle(color: Colors.white),
            ),
            Spacer(
              flex: 2,
            )
          ],
        ),
      ),
      body: isDonorDetailsLoading
          ? SkeletonMember()
          : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0,
                childAspectRatio: 0.6,
              ),
              itemCount: donorDetails?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                return _buildGridItem(index);
              },
            ),
    );
  }

  Widget _buildGridItem(int index) {
    DonorDetail? detail = donorDetails![index];

    return Expanded(
      child: Card(
        elevation: 2.0,
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: CircleAvatar(
                  radius: 70.0,
                  foregroundImage: NetworkImage(detail.photo ?? ''),
                  backgroundImage: AssetImage('assets/logo.png'),
                ),
              ),
              Text(
                detail.memberName ?? 'No Name',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Donated at: ${detail.donatedAt!.substring(0, 11)}',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w700,
                    color: ttColor),
              ),
              Text(
                'Club : ${detail.club?.toLowerCase() ?? 'No Post'}',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 12.0, fontWeight: FontWeight.w700, color: sColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
