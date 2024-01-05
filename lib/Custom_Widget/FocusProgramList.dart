import 'package:flutter/material.dart';
import 'package:lionsclub/Custom_Widget/FocusProgram_widgetforlist.dart';
import 'package:lionsclub/Custom_Widget/Focus_Details.dart';
import 'package:lionsclub/Custom_Widget/notiication.dart';

import '../../main.dart';
import '../Custom_Widget/News_widget.dart';

class FocusList extends StatefulWidget {
  const FocusList({Key? key});

  @override
  State<FocusList> createState() => _FocusListState();
}

class _FocusListState extends State<FocusList> {
  final imageUrls = [
    "assets/c1.jpg",
    "https://www.gpo.gov.np/images/uploaded/imagepath/6e597028-8799-4e7f-b115-504eb18305f81f5e9d24-e40b-474e-9bb6-23e53679fbbe74603fbe-dd44-4c7a-9408-0fa1a9b8a027423394eb-53e0-44d3-9dbf-9522ad6067a8gpo.jpg",
    "https://oag.gov.np/uploads/OAG%2013.jpg"
  ];

  final List<Map<String, String>> programs = [
    {
      'title': 'Child and Women Support Program',
      'imageUrl':
      'https://lionsclubsdistrict325jnepal.org.np/site/uploads/program/32e6463ba5ff88dc2bbaa026aeec1b62e1c83bdc.jpg',
    },
    {
      'title': 'Clean Water and Sanitation',
      'imageUrl':
      'https://lionsclubsdistrict325jnepal.org.np/site/uploads/program/5ba2874d9fe9b5e8ffdeb6ac76fbc82c2f2c1509.jpg',
    },
    {
      'title': 'Child and Women Support Program',
      'imageUrl':
      'https://lionsclubsdistrict325jnepal.org.np/site/uploads/program/32e6463ba5ff88dc2bbaa026aeec1b62e1c83bdc.jpg',
    }
    // Add more programs as needed
  ];

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
              height: 50,
              width: 50,
              child: Image.asset('assets/logo.png'),
            ),
            Spacer(),
            const Text(
              'Focus Program',
              style: TextStyle(color: Colors.white),
            ),
            Spacer(
              flex: 2,
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: programs.map((program) {
            return FocusPrograms(
               Title: program['title']!, ImageURl:  program['imageUrl']!, onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>FocusProgram_Details(title:program['title']!, imageUrl: program['imageUrl']!)));
            },
            );
          }).toList(),
        ),
      ),
    );
  }
}
