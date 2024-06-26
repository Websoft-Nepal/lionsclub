import 'package:flutter/material.dart';
import 'package:lionsclub/Custom_Widget/skeleton_member.dart';
import 'package:lionsclub/Screens/Dashboard/donor/donor_details_screen.dart';
import 'package:lionsclub/data/Models/donor.dart';

import '../../../consts/app_consts.dart';
import '../../../data/network/api_services.dart';
import '../../../main.dart';

class Donor_Screen extends StatefulWidget {
  const Donor_Screen({super.key});

  @override
  State<Donor_Screen> createState() => _Donor_ScreenState();
}

class _Donor_ScreenState extends State<Donor_Screen> {
  List<Donor> donors = [];
  bool isDonorLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchDonorData("${AppConstants.baseURL}/donor");
  }

  Future<void> _fetchDonorData(String apiUrl) async {
    try {
      List<Donor> donorData = await ApiService.fetchData(
        apiUrl,
        (data) => Donor.fromJson(data),
      );
      setState(() {
        donors = donorData;
        isDonorLoading = false;
      });
    } catch (e) {
      print('Error: $e');
      setState(() {
        isDonorLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFEEEEEE),
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
              SizedBox(
                height: 50,
                width: 50,
                child: Image.asset('assets/logo.png'),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'Clubs',
                style: TextStyle(color: Colors.white),
              ),
              Spacer(
                flex: 2,
              ),
            ],
          ),
        ),
        body: isDonorLoading
            ? const SkeletonMember()
            : ListView.builder(
                itemCount: donors.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    surfaceTintColor: pColor,
                    // color: zColor,
                    child: ListTile(
                      // tileColor: ,
                      leading: Text(donors[index].id.toString() + '.' ?? '',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                      title: Text(
                        donors[index].title ?? 'No Title',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ), // Provide a default value if title is null
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DonorDetails(
                                    dId: donors[index].id,
                                    name: donors[index].title ?? 'Title $index',
                                  )),
                        );
                      },
                    ),
                  );
                },
              ));
  }
}
