import 'package:flutter/material.dart';
import 'package:lionsclub/main.dart';

class Message extends StatefulWidget {
  const Message({super.key});

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: sColor,
        title: Row(

          children: [
            Spacer(),
            Text(
              'Hello Chairman !!',
              style: TextStyle(
                  fontSize: 20, color:Colors.white,fontWeight: FontWeight.bold),
            ),
            Spacer(flex: 2,)
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 150.0,
              backgroundImage: AssetImage('assets/officer.jpeg'),
            ),
            SizedBox(height: 20,),
            Column(
              children: [
                Text(
                  'Message from Chairperson',
                  style: TextStyle(
                      fontSize: 20, color: sColor, fontWeight: FontWeight.bold),
                ),
                Text(
                  '( Chairperson )',
                  style: TextStyle(
                    color: ttColor,
                  ),
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
