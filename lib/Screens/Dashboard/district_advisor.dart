import 'package:flutter/material.dart';

import '../../main.dart';

class ZonalD extends StatefulWidget {
  const ZonalD({Key? key}) : super(key: key);

  @override
  _ZonalDState createState() => _ZonalDState();
}

class _ZonalDState extends State<ZonalD> {
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
            // Spacer(),
            Text(
              'District Advisor',
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
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
        ),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return _buildGridItem();
        },
      ),
    );
  }

  Widget _buildGridItem() {
    return Card(
        elevation: 2.0,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: CircleAvatar(
                  radius: 49.0,
                  backgroundImage: AssetImage('assets/officer.jpeg'),
                ),
              ),
              // SizedBox(height: 3.0),
              Text(
                'Ram Bahadhur',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // SizedBox(height: 3.0),
              Text(
                'Chief',
                style: TextStyle(fontSize: 14.0,fontWeight: FontWeight.w700,color:sColor),
              ),
              // SizedBox(height: 3.0),
              Text(
                'lions club international District    325 M, nepal',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 10.0),
              ),
            ],
          ),
        ),
      );
  }
}
