import 'package:flutter/material.dart';
import 'package:lionsclub/Screens/Dashboard/district_advisor.dart';

import '../../main.dart';
import '../../main.dart';
class District_Directory extends StatefulWidget {
  const District_Directory({super.key});

  @override
  State<District_Directory> createState() => _District_DirectoryState();
}

class _District_DirectoryState extends State<District_Directory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xFF11468F),
        title: Row(
          children: [
            Container(
                height: 50, width: 50, child: Image.asset('assets/logo.png')),
            // Spacer(),
            Text(
              'District Directory',
              style: TextStyle(color: Colors.white),
            ),
            Spacer(
              flex: 2,
            )
          ],
        ),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          childAspectRatio: 1.9, // Width to height ratio of each item
        ),
        itemCount: 20, // Number of items
        itemBuilder: (BuildContext context, int index) {
          return _buildGridItem(index);
        },
      ),
    );
  }
  Widget _buildGridItem(int index) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ZonalD()));
      },
      child: Container(
        margin: EdgeInsets.all(15.0),
        // decoration: BoxDecoration(
        //   color: sColor,
        //   borderRadius: BorderRadius.circular(12.0), // Adjust the radius as needed
        // ),
        child: Card(
          color: sColor,
          elevation: 5,
          child: Center(
            child: Text('District Advisor$index',style: TextStyle(color: Colors.white),),
          ),
        ),
      ),
    );
  }
}
