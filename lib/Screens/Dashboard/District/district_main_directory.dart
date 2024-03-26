import 'package:flutter/material.dart';
import 'package:lionsclub/Screens/Dashboard/District/department.dart';
import 'package:lionsclub/Screens/Dashboard/District/district_pdf.dart';
import '../../../main.dart';

class District_main_directory extends StatelessWidget {
  const District_main_directory({Key? key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
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
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
          bottom: TabBar(
            indicatorColor: Colors.white,
            indicatorWeight: 5,
            indicatorSize: TabBarIndicatorSize.tab,
            isScrollable: false,
            tabs: [
              Tab(child: Icon(Icons.home, color: Colors.white)),
              Tab(child: Icon(Icons.picture_as_pdf, color: Colors.white)),
            ],
          ),
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            Center(child: District_Directory()),
            Center(child: District_pdf()),
          ],
        ),
      ),
    );
  }
}
