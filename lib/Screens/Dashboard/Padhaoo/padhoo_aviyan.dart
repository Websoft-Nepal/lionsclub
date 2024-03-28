import 'package:flutter/material.dart';
import 'package:lionsclub/Custom_Widget/pdfviewer.dart';
import '../../../main.dart';

class Padhoo_Aviyan extends StatefulWidget {
  @override
  _Padhoo_AviyanState createState() => _Padhoo_AviyanState();
}

class _Padhoo_AviyanState extends State<Padhoo_Aviyan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: sColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
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
            Text(
              'Padhoo Aviyan',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Padhoo Aviyan',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: 20, color: sColor, fontWeight: FontWeight.bold),
            ),
            Expanded(
                child: CustomPDFViewer(
              pdfUrl: 'https://www.ibm.com/downloads/cas/GJ5QVQ7X',
              title: '',
            )),
          ],
        ),
      ),
    );
  }
}
