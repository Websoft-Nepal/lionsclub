import 'package:flutter/material.dart';
import 'package:lionsclub/main.dart';

class MyCustomClubMember extends StatelessWidget {
  final String Name;
  final String Post;
  final Image;

  MyCustomClubMember(
      {required this.Name, required this.Post, required this.Image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 18.0, left: 18, top: 8),
      child: Card(
        elevation: 5,
        surfaceTintColor: Colors.white,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only( left: 8, bottom: 5),
                    child: Text(
                      Name,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: sColor),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      Post,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF141414)),
                    ),
                  ),
                ],
              ),
            ),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/logo.png'),
              foregroundImage: NetworkImage(Image),
            ),
          ],
        ),
      ),
    );
  }
}
