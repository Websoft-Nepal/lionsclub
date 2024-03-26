import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lionsclub/Custom_Widget/pdfviewer.dart';
import '../../../consts/app_consts.dart';
import 'package:http/http.dart' as http;

class District_pdf extends StatefulWidget {
  const District_pdf({super.key});

  @override
  State<District_pdf> createState() => _District_pdfState();
}

class _District_pdfState extends State<District_pdf> {
  bool isFetched = false;
  String? pdfUrl;
  @override
  void initState() {
    super.initState();
    fetchPdf(context);
  }

  fetchPdf(
    BuildContext context,
  ) async {
    try {
      var res = await http.get(
        Uri.parse("${AppConstants.baseURL}/directory/list"),
      );

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);
        setState(() {
          pdfUrl = data['pdf'];
          isFetched = true;
        });
      } else {
        throw Exception('Error fetching PDF');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error fetching PDF'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      body: isFetched
          ? CustomPDFViewer(
              pdfUrl: pdfUrl!,
              title: 'District Directory',
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
