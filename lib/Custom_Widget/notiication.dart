import 'package:flutter/material.dart';
import 'package:lionsclub/main.dart';

class MyNotification extends StatelessWidget {
  final String Title;
  final String Description;
  MyNotification({
    required this.Title,
    required this.Description

  });

  @override
  Widget build(BuildContext context) {
    return Card(

      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text('Lions club international district 325 j, NEpal third cabinet meeting 2022/023 presentation online open',style: TextStyle(color: tColor,fontWeight: FontWeight.bold,fontSize: 18),),
            ),
            Text('01 Feb,2023',style: TextStyle(color: ttColor),)

          ],
        ),
      ),
    );
  }
}
