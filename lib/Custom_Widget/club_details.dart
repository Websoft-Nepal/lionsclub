import 'package:flutter/material.dart';
import 'package:lionsclub/Custom_Widget/Club_member_widget.dart';
import 'package:lionsclub/main.dart';

class ClubDetAILS extends StatelessWidget {
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
              SizedBox(width: 5,),
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
        body: ListView(
          children: [
            MyCustomClubMember(Name: 'Leo Ananda Raj Regmi', Post: 'CLub First Vice President', Image: Image.asset('assets/officer3.jpeg').image,),
            MyCustomClubMember(Name: 'Leo Santa Badhaur', Post: 'CLub Secretary', Image: Image.asset('assets/officer4.jpeg').image,),
            MyCustomClubMember(Name: 'Leo Birendra Shrestha', Post: 'CLub Treasure', Image: Image.asset('assets/officer5.jpeg').image,),
            MyCustomClubMember(Name: 'Leo Krishna Regmi', Post: 'CLub First Vice President', Image: Image.asset('assets/officer.jpeg').image,),
            MyCustomClubMember(Name: 'Leo Ananda Raj Regmi', Post: 'CLub First Vice President', Image: Image.asset('assets/officer4.jpeg').image,),
          ],
        )
    );
  }
}