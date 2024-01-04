import 'package:flutter/material.dart';

import '../../main.dart';

class NewsDetails extends StatefulWidget {
  final String title;
  final String imageUrl;

  NewsDetails({Key? key, required this.title, required this.imageUrl}) : super(key: key);

  @override
  _NewsDetailsState createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
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
              'News Details',
              style: TextStyle(color: Colors.white),
            ),
            Spacer(
              flex: 2,
            )
          ],
        ),
      ),
      body:  Padding(
        padding:  EdgeInsets.all(8.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 150.0,
              backgroundImage: NetworkImage(widget.imageUrl),
            ),
            SizedBox(height: 20,),
            Column(
              children: [
                Text(widget.title,
                  style: TextStyle(
                      fontSize: 20, color: tColor),
                ),


              ],
            )
          ],
        ),
      ),

    );
  }
}
