import 'package:flutter/material.dart';
import 'package:lionsclub/Screens/Dashboard/club/Club_member_widget.dart';
import 'package:lionsclub/main.dart';
import 'package:lionsclub/data/Models/clubMember.dart';
import '../../../data/network/api_services.dart';

class ClubDetailsScreen extends StatefulWidget {
  final String clubId;

  ClubDetailsScreen({required this.clubId});

  @override
  State<ClubDetailsScreen> createState() => _ClubDetailsScreenState();
}

class _ClubDetailsScreenState extends State<ClubDetailsScreen> {
  List<ClubMember> ClubM = [];

  @override
  void initState() {
    super.initState();
    // Example usage with a different URL for clubs
    _fetchData('https://api.lionsclubsdistrict325jnepal.org.np/api/club/3/member');
  }

  Future<void> _fetchData(String apiUrl) async {
    try {
      List<ClubMember> data = await ApiService.fetchData(apiUrl, (data) => ClubMember.fromJson(data));
      setState(() {
        ClubM = data;
      });
    } catch (e) {
      // Handle error
      print('Error: $e');
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
              height: 50,
              width: 50,
              child: Image.asset('assets/logo.png'),
            ),
            SizedBox(width: 5,),
            Text(
              "what", // Display the club ID in the app bar
              style: TextStyle(color: Colors.white),
            ),
            Spacer(
              flex: 2,
            )
          ],
        ),
      ),
      body: ListView.builder(
          itemCount: ClubM.length,
          itemBuilder: (context, index) {
          return MyCustomClubMember(
            Name: ClubM[index].name!.substring(0, 20)?? 'Member Name',

            Post: ClubM[index].post ?? '',
            Image: Image.network(ClubM[index].photo ?? '').image,
          );
        }),
    );
  }
}
