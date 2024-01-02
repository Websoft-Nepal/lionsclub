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

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Hello Chairman !!',style: TextStyle(fontSize: 20,color: sColor,fontWeight: FontWeight.bold),),
            ),
            CircleAvatar(
                 backgroundColor: pColor,
                radius: 200,
                child: Container(height: 400, child: Image.asset('assets/officerm.png'))),
            const Card(
              elevation: 5,
              surfaceTintColor:Colors.white60,
              child: Column(
                children: [

                  Text('Message from Chairperson',style: TextStyle(fontSize: 20,color: sColor,fontWeight: FontWeight.bold),),
                  SizedBox(height: 8,),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('lorem Whenever Lions club members get together, problems get smaller And communities get better. Because we help where help isneeded in\n'
                        ' our own communities and around the world with unmatched integrity and energy lorem Whenever Lions club members get together, problems get smaller'
                        ' And communities get better. Because we help where help isneeded in our own communities and around the world with unmatched integrity and energy'
                        'lorem Whenever Lions club members get together, problems get smaller And communities get better. Because we help where help isneeded in\n'
                        ' our own communities and around the world with unmatched integrity and energy lorem Whenever Lions club members get together, problems get smaller'
                        ' And communities get better. Because we help where help isneeded in our own communities and around the world with unmatched integrity and energ',style: TextStyle(color:ttColor),),
                  ),

                ],
              ),
            )
           
          ],
        ),
      ),
    );
  }
}
