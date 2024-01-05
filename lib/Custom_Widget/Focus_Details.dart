import 'package:flutter/material.dart';

import '../../main.dart';

class FocusProgram_Details extends StatefulWidget {
  final String title;
  final String imageUrl;

  FocusProgram_Details({Key? key, required this.title, required this.imageUrl}) : super(key: key);

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
                Text(widget.title,
                  style: TextStyle(
                      fontSize: 20, color: tColor),
                ),
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'lorem Whenever Lions club members get together, problems get smaller And communities get better. Because we help where help isneeded in\n'
                        ' our own communities and around the world with unmatched integrity and energy lorem Whenever Lions club members get together, problems get smaller'
                        ' And communities get better. Because we help where help isneeded in our own communities and around the world with unmatched integrity and energy'
                        'lorem Whenever Lions club members get together, problems get smaller And communities get better. Because we help where help isneeded in\n'
                        ' our own communities and around the world with unmatched integrity and energy lorem Whenever Lions club members get together, problems get smaller'
                        ' And communities get better. Because we help where help isneeded in our own communities and around the world with unmatched integrity and energ',
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
