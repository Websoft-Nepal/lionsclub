import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:flutter/material.dart';

class CustomPDFViewer extends StatefulWidget {
  final String pdfUrl;
  final String title;

  CustomPDFViewer({
    required this.pdfUrl,
    required this.title,
  });

  @override
  _CustomPDFViewerState createState() => _CustomPDFViewerState();
}

class _CustomPDFViewerState extends State<CustomPDFViewer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SfPdfViewer.network(
        widget.pdfUrl,
      ),
    );
  }
}
