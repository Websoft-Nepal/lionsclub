import 'package:flutter/material.dart';

import '../../main.dart';

class FocusProgram_Details extends StatefulWidget {
  final String title;
  final String imageUrl;
  final String description;
  final String date;
  FocusProgram_Details({Key? key, required this.title, required this.imageUrl, required this.description, required String this.date}) : super(key: key);

  @override
  _FocusProgram_DetailsState createState() => _FocusProgram_DetailsState();
}

class _FocusProgram_DetailsState extends State<FocusProgram_Details> {
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
              'Focus Program ',
              style: TextStyle(color: Colors.white),
            ),
            Spacer(
              flex: 2,
            )
          ],
        ),
      ),
      body:  Padding(
        padding:  EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Image.network(widget.imageUrl,),
            SizedBox(height: 20,),
            Column(
              children: [
                ListTile(
                  title: Text(widget.title,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 20, color: sColor),
                  ),
                  subtitle: Text(widget.date,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontSize: 10, color: tColor),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    widget.description,
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: tColor),
                  ),
                ),


              ],
            )
          ],
        ),
      ),

    );
  }
}
