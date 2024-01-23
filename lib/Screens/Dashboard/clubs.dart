import 'package:flutter/material.dart';
import 'package:lionsclub/Custom_Widget/Club_member_widget.dart';
import 'package:lionsclub/Custom_Widget/club_widget.dart';
import 'package:lionsclub/Screens/Dashboard/club_member.dart';
import 'package:lionsclub/main.dart';

class Club extends StatelessWidget {
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
              'Clubs',
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

          // -->Search

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: SizedBox(
                width: 300,
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    hintStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
          ),



          // 1 section
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Total Clubs :200'),
          ),
         GestureDetector(
             onTap: (){
               Navigator.push(context, MaterialPageRoute(builder: (context)=>ClubDetAILS()));
             },
             child: MyCustomClub(Name: 'Baglung City')),
          GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ClubDetAILS()));
              },
              child: MyCustomClub(Name: 'Kusma City')),
          GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ClubDetAILS()));
              },
              child: MyCustomClub(Name: 'Pokhara City')),
          GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ClubDetAILS()));
              },
              child: MyCustomClub(Name: 'Tanahu City')),
          GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ClubDetAILS()));
              },
              child: MyCustomClub(Name: 'Kathamandu City')),
          GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ClubDetAILS()));
              },
              child: MyCustomClub(Name: 'Baglung City')),
          GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ClubDetAILS()));
              },
              child: MyCustomClub(Name: 'Baglung City')),
          GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ClubDetAILS()));
              },
              child: MyCustomClub(Name: 'Baglung City')),


        ],
      ),
    );
  }
}
