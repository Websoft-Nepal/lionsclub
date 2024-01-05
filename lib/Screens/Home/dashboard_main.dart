import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:lionsclub/Custom_Widget/FocusProgramList.dart';
import 'package:lionsclub/Screens/Dashboard/district_advisor.dart';
import 'package:lionsclub/Screens/Dashboard/clubs.dart';
import 'package:lionsclub/Screens/Dashboard/dIstrict_directory.dart';
import 'package:lionsclub/Screens/Home/News%20_crausel/Crausel.dart';
import 'package:lionsclub/Screens/notification.dart';
import 'package:lionsclub/main.dart';

import '../../Custom_Widget/Focus_program_widget.dart';
import '../../Custom_Widget/icon.dart';
import '../message.dart';

class MainBoard extends StatefulWidget {
   MainBoard({super.key});

  @override
  State<MainBoard> createState() => _MainBoardState();
}

class _MainBoardState extends State<MainBoard> {
  final imageUrls = [
    "assets/c1.jpg",
    "https://www.gpo.gov.np/images/uploaded/imagepath/6e597028-8799-4e7f-b115-504eb18305f81f5e9d24-e40b-474e-9bb6-23e53679fbbe74603fbe-dd44-4c7a-9408-0fa1a9b8a027423394eb-53e0-44d3-9dbf-9522ad6067a8gpo.jpg"
    "https://oag.gov.np/uploads/OAG%2013.jpg"
  ];
  final List<Map<String, String>> programs = [
    {
      'title': 'Child and Women Support Program',
      'imageUrl': 'https://lionsclubsdistrict325jnepal.org.np/site/uploads/program/32e6463ba5ff88dc2bbaa026aeec1b62e1c83bdc.jpg',
    },
    {
      'title': 'Clean Water and Sanitation',
      'imageUrl': 'https://lionsclubsdistrict325jnepal.org.np/site/uploads/program/5ba2874d9fe9b5e8ffdeb6ac76fbc82c2f2c1509.jpg',
    },
    {
      'title': 'Child and Women Support Program',
      'imageUrl': 'https://lionsclubsdistrict325jnepal.org.np/site/uploads/program/32e6463ba5ff88dc2bbaa026aeec1b62e1c83bdc.jpg',
    }
    // Add more programs as needed
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(children: [


        // -->1st
        // ClipRRect(
        //     borderRadius: BorderRadius.circular(200),
        //     child: Image.asset('assets/officer.png',fit: BoxFit.fill,)),
     Padding(
       padding: const EdgeInsets.all(8.0),
       child: Text('Welcome to Lions District 325 m,Nepal',style: TextStyle(color: sColor,fontWeight: FontWeight.bold,fontSize: 21),),
     ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('"Lead With Empathy"',style: TextStyle(color: tColor,fontSize:18,fontWeight: FontWeight.bold),),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CarouselSlider.builder(
            itemCount: imageUrls.length,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              return Image.asset(
                'assets/c1.jpg',
                fit: BoxFit.cover,
              );
            },
            options: CarouselOptions(
              height: 200,
              aspectRatio: 16 / 9,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.scale,
              onPageChanged: (index, reason) {
                // Handle page change
              },
              scrollDirection: Axis.horizontal,
            ),
          ),
        ),


        const Padding(
          padding: EdgeInsets.only(left: 8.0,right: 8,top:8,bottom: 20),
          child: Text('Dashboard',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
        ),
         Padding(
          padding: EdgeInsets.only(left:18.0,right: 18),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyCustomIconButton(
                    icon: Icons.person,
                    color: zColor,
                    iconName: '     Hello\nChairman', // You can pass the icon name dynamically
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Message()));
                    },
                  ),

                  MyCustomIconButton(
                    icon:Icons.people,
                    color: sColor,
                    iconName: 'Clubs', // You can pass the icon name dynamically
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>  Club()));
                    },
                  ),
                  MyCustomIconButton(
                    icon:Icons.map,
                    color: pColor,
                    iconName: ' Zonal\nDirectory', // You can pass the icon name dynamically
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>  ZonalD()));
                    },
                  ),
                  MyCustomIconButton(
                    icon:Icons.newspaper,
                    color: ttColor,
                    iconName: 'News', // You can pass the icon name dynamically
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>  Notice()));
                    },
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  MyCustomIconButton(
                    icon:Icons.location_on,
                    color: pColor,
                    iconName: '  District\nDirectory', // You can pass the icon name dynamically
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>  District_Directory()));
                    },
                  ),

                ],
              ),
            ],
          ),
        ),

        const SizedBox(height: 15,),
        // -->2nd
        Padding(
          padding: const EdgeInsets.only(right:8.0,left: 8.0,top: 8.0,bottom: 0),
          child: Row(
            children: [
              const Text('Focus Program',style: TextStyle(fontSize: 18,fontWeight:FontWeight.bold),),
              const Spacer(),

              IconButton(onPressed: (){

                Navigator.push(context, MaterialPageRoute(builder: (context)=>FocusList()));
              }, icon: Icon(Icons.arrow_forward,color: zColor,))
              // TextButton(onPressed: () {  },
              // child: const Text('View more',style: TextStyle(fontSize: 14,color:zColor),))
            ],
          ),
        ),

        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child:Row(
            children: programs.map((program) {
              return ProgramCard(
                imageUrl: program['imageUrl']!,
                title: program['title']!,
              );
            }).toList(),
          ),
        ),

        const SizedBox(height: 15,),
        // -->2nd
        Padding(
          padding: const EdgeInsets.only(right:8.0,left: 8.0,top: 8.0,bottom: 0),
          child: Row(
            children: [
              const Text('Latest News ',style: TextStyle(fontSize: 18,fontWeight:FontWeight.bold),),
              const Spacer(),
              IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Notice()));
              }, icon:Icon(Icons.arrow_forward,color: zColor,))
            ],
          ),
        ),

        Crausel_news(),


            ],
          ),
        );
  }
}
