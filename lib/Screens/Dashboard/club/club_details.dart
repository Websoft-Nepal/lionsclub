import 'package:flutter/material.dart';
import 'package:lionsclub/Screens/Dashboard/club/Club_member_widget.dart';
import 'package:lionsclub/Custom_Widget/skeleton_member.dart';
import 'package:lionsclub/main.dart';
import 'package:shimmer/shimmer.dart';
import '../../../Utils/Components/appurl.dart';
import '../../../data/Models/clubMember.dart';
import '../../../data/network/api_services.dart';

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
      appBar:AppBar(
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
              'Club Details',
              style: TextStyle(color: Colors.white),
            ),
            Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
      body: isMembersLoading
          ? SkeletonMember()
          : (clubMembers != null && clubMembers!.isNotEmpty)
          ? _buildClubList()
          : _buildNoDataWidget(),
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
      itemCount: clubMembers!.length,
      itemBuilder: (context, index) {
        // Extract name and post, trim to a maximum of 20 characters
        String name = (clubMembers![index]?.name ?? 'No Name').length > 20
            ? (clubMembers![index]?.name ?? 'No Name').substring(0, 18) + '..'
            : (clubMembers![index]?.name ?? 'No Name');

        String post = (clubMembers![index]?.post ?? 'No Post').length > 20
            ? (clubMembers![index]?.post ?? 'No Post').substring(0, 18) + '..'
            : (clubMembers![index]?.post ?? 'No Post');

        return MyCustomClubMember(
          Name: name,
          Post: post,
          Image: clubMembers![index]?.photo ?? '',
        );
      },
    );
  }

}
