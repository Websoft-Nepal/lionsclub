import 'package:flutter/material.dart';

import '../../../main.dart';
class Padhoo_Aviyan extends StatefulWidget {
  const Padhoo_Aviyan({super.key});

  @override
  State<Padhoo_Aviyan> createState() => _Padhoo_AviyanState();
}

class _Padhoo_AviyanState extends State<Padhoo_Aviyan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: sColor,
        title: Row(
          children: [
            SizedBox(
              height: 50,
              width: 50,
              child: Image.asset('assets/logo.png'),
            ),
            Spacer(),
            const Text(
              'Padhaoo Aviyan',
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("List of Contribution",style: TextStyle(fontSize: 25,color: sColor),),
          ),
          Container(
              // height: 100,
              child: Image.asset('assets/padhoo.png'))
        ],
      ),
    );
  }
}
