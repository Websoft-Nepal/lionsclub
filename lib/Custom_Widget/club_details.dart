import 'package:flutter/material.dart';
import 'package:lionsclub/Custom_Widget/Club_member_widget.dart';
import 'package:lionsclub/main.dart';
import 'package:shimmer/shimmer.dart';
import '../Utils/Components/appurl.dart';
import '../data/Models/clubMember.dart';
import '../data/network/api_services.dart';

class ClubDetAILS extends StatefulWidget {
  final clubId;

  ClubDetAILS({required this.clubId});

  @override
  State<ClubDetAILS> createState() => _ClubDetAILSState();
}

class _ClubDetAILSState extends State<ClubDetAILS> {
  List<ClubMember>? clubMembers;
  bool isMembersLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchMembersData();
  }

  Future<void> _fetchMembersData() async {
    try {
      List<ClubMember>? members = await ApiService.fetchData(
        "https://api.lionsclubsdistrict325jnepal.org.np/api/club/${widget.clubId}/member",
            (data) => ClubMember.fromJson(data),
      );
      setState(() {
        clubMembers = members;
        isMembersLoading = false;
      });
    } catch (e) {
      print('Error: $e');
      setState(() {
        isMembersLoading = false;
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
            Container(
                height: 50, width: 50, child: Image.asset('assets/logo.png')),
            SizedBox(
              width: 5,
            ),
            Text(
              'Club Details',
              style: TextStyle(color: Colors.white),
            ),
            Spacer(
              flex: 2,
            )
          ],
        ),
      ),
      body: isMembersLoading
          ? _buildSkeleton()
          : (clubMembers != null && clubMembers!.isNotEmpty)
          ? _buildClubList()
          : _buildNoDataWidget(),
    );
  }

  Widget _buildSkeleton() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: ListTile(
        title: Container(
          width: 150,
          height: 16,
          color: Colors.grey[300]!,
        ),
        subtitle: Container(
          width: 100,
          height: 12,
          color: Colors.grey[300]!,
        ),
        leading: CircleAvatar(
          radius: 25,
          backgroundColor: Colors.grey[300]!,
        ),
      ),
    );
  }

  Widget _buildNoDataWidget() {
    return Center(
      child: Text('No data available'),
    );
  }

  Widget _buildClubList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: clubMembers!.length,
      itemBuilder: (context, index) {
        return MyCustomClubMember(
          Name: clubMembers![index]?.name ?? 'No Name',
          Post: clubMembers![index]?.post ?? 'No Post',
          Image: clubMembers![index]?.photo ?? '',
        );
      },
    );
  }
}
