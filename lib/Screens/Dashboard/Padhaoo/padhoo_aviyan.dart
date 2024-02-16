import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:lionsclub/Custom_Widget/pdfviewer.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:open_file/open_file.dart';
import '../../../main.dart';

class Padhoo_Aviyan extends StatefulWidget {
  @override
  _Padhoo_AviyanState createState() => _Padhoo_AviyanState();
}

class _Padhoo_AviyanState extends State<Padhoo_Aviyan> {
  

  @override
  Widget build(BuildContext context) {
    return CustomPDFViewer(pdfUrl:'https://www.ibm.com/downloads/cas/GJ5QVQ7X' , title: 'Padhoo_Aviyan');
  }
}
