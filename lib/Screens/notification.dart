import 'package:flutter/material.dart';
import 'package:lionsclub/Custom_Widget/notiication.dart';

import '../../main.dart';
class Notice extends StatefulWidget {
  const Notice({super.key});

  @override
  State<Notice> createState() => _NoticeState();
}

class _NoticeState extends State<Notice> {
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
                height: 50, width: 50, child: Image.asset('assets/logo.png')),
            Spacer(),
            const Text(
              'Notifications',
              style: TextStyle(color: Colors.white),
            ),
            Spacer(
              flex: 2,
            )
          ],
        ),
      ),

      body: ListView(
        children: [
          MyNotification(Title: 'Student', Description: 'why advise hsfajfjas hfaskjfkasj fsa fsa fasnjf')

          
        ],
      ),
    );
  }

}
