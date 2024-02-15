import 'package:flutter/material.dart';

import '../../../../main.dart';

class NewsDetails extends StatefulWidget {
  final String title;
  final String imageUrl;
  final String details;
  final String date;

  NewsDetails({
    Key? key,
    required this.title,
    required this.imageUrl,
    required this.details,
    required this.date

  }) : super(key: key);

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
              'News Details',
              style: TextStyle(color: Colors.white),
            ),
            Spacer(
              flex: 2,
            ),
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
                  title:Text(widget.title,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontSize: 20, color: sColor),
                  ),
                  subtitle: Text(widget.date.substring(0,10),
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        fontSize: 12, color: ttColor),
                  ),

                ),
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(widget.details,
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
