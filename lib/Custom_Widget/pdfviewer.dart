import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:open_file/open_file.dart';
import '../../../main.dart';

class CustomPDFViewer extends StatefulWidget {
  final String pdfUrl;
  final String title;

  CustomPDFViewer({required this.pdfUrl, required this.title});

  @override
  _CustomPDFViewerState createState() => _CustomPDFViewerState();
}

class _CustomPDFViewerState extends State<CustomPDFViewer> {
  String? localPath;
  double downloadProgress = 0.0;

  @override
  void initState() {
    super.initState();
    _loadPDF();
  }

  Future<void> _openDownloadedFile(String path) async {
    if (Platform.isAndroid) {
      await OpenFile.open(path);
    } else if (Platform.isIOS) {
      if (await canLaunchUrl(path as Uri)) {
        await launchUrl(path as Uri);
      } else {
        throw 'Could not launch $path';
      }
    } else {
      throw 'Unsupported platform';
    }
  }

  Future<void> _loadPDF() async {
    var response = await http.get(Uri.parse(widget.pdfUrl));
    var dir = await getApplicationDocumentsDirectory();
    File file = File("${dir.path}/${widget.title}_pdf.pdf");
    file.writeAsBytesSync(response.bodyBytes, flush: true);
    setState(() {
      localPath = file.path;
    });
  }

  Future<void> _downloadPDF(String url) async {
    var request = http.Request('GET', Uri.parse(url));
    var response = await request.send();

    var bytesReceived = 0;
    var totalBytes = response.contentLength ?? -1;

    var dir = await getApplicationDocumentsDirectory();
    var file = File("${dir.path}/${widget.title}_pdf.pdf");

    await response.stream.listen(
          (List<int> chunk) {
        bytesReceived += chunk.length;
        var progress = bytesReceived / totalBytes;
        setState(() {
          downloadProgress = progress;
        });
        file.writeAsBytesSync(chunk, mode: FileMode.append);
      },
      onDone: () {
        setState(() {
          downloadProgress = 1.0;
        });
        _showDownloadCompleteDialog();
      },
      onError: (e) {
        print('Error during download: $e');
      },
    );
  }

  Future<void> _showDownloadCompleteDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Download Complete'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('The PDF file has been downloaded successfully.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Open'),
              onPressed: () {
                if (localPath != null) {
                  _openDownloadedFile(localPath!);
                }
              },
            ),
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: localPath != null
          ? PDFView(
        filePath: localPath!,
      )
          : Center(
        child: downloadProgress > 0
            ? CircularProgressIndicator(
          value: downloadProgress,
        )
            : CircularProgressIndicator(),
      ),
    );
  }
}
