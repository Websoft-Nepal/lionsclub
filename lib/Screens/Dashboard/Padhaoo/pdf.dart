import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

import '../../../main.dart';

class PdfViewerScreen extends StatefulWidget {
  @override
  _PdfViewerScreenState createState() => _PdfViewerScreenState();
}

class _PdfViewerScreenState extends State<PdfViewerScreen> {
  String? localPath;
  final String pdfUrl = "https://www.ibm.com/downloads/cas/GJ5QVQ7X";

  @override
  void initState() {
    super.initState();
    _loadPDF();
  }

  Future<void> _loadPDF() async {
    var response = await http.get(Uri.parse(pdfUrl));
    var dir = await getApplicationDocumentsDirectory();
    File file = File("${dir.path}/downloaded_pdf.pdf");
    file.writeAsBytesSync(response.bodyBytes, flush: true);
    setState(() {
      localPath = file.path;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              'Padhoo Aviyan',
              style: TextStyle(color: Colors.white),
            ),
            Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
      body: localPath != null
          ? PDFView(
        filePath: localPath!,
      )
          : Center(child: CircularProgressIndicator()),
    );
  }
}


