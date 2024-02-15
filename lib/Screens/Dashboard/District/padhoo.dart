import 'package:flutter/material.dart';
import 'package:lionsclub/Screens/Dashboard/District/department.dart';
import 'package:lionsclub/Screens/Dashboard/District/district_pdf.dart';


import '../../../main.dart';

class Padhoo extends StatelessWidget {
  const Padhoo({Key? key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
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
                'District Directory',
                style: TextStyle(color: Colors.white),
              ),
              Spacer(
                flex: 2,
              ),
            ],
          ),
          bottom: TabBar(
            isScrollable: false,
            tabs: [
              Tab(child: Text('Home',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),),
              Tab(child: Text('pdf',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: District_Directory()),
            Center(child: District_Pdf()),
          ],
        ),
      ),
    );
  }
}
