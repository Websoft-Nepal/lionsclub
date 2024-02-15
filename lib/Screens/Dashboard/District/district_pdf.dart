import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

import '../../../main.dart';

class District_Pdf extends StatefulWidget {
  @override
  _District_PdfState createState() => _District_PdfState();
}

class _District_PdfState extends State<District_Pdf> {
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
      body: localPath != null
          ? PDFView(
        filePath: localPath!,
      )
          : Center(child: CircularProgressIndicator()),
    );
  }
}


