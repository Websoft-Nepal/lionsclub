import 'package:flutter/material.dart';

import '../main.dart';
class ZonalD extends StatefulWidget {
  const ZonalD({super.key});

  @override
  State<ZonalD> createState() => _ZonalDState();
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
                height: 50, width: 50, child: Image.asset('assets/logo.png')),
            Spacer(),
            Text(
              'Zonal Directory',
              style: TextStyle(color: Colors.white),
            ),
            Spacer(
              flex: 2,
            )
          ],
        ),
      ),
    );
  }
}
