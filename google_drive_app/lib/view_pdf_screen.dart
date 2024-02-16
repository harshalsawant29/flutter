import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path/path.dart';

class ViewPdfScreen extends StatefulWidget {
  final File file;
  ViewPdfScreen({@required this.file});

  @override
  State<ViewPdfScreen> createState() => _ViewPdfScreenState();
}

class _ViewPdfScreenState extends State<ViewPdfScreen> {
  @override
  Widget build(BuildContext context) {
    final name = basename(widget.file.path);
    //log('${widget.file.path}');
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: PDFView(
        filePath: widget.file.path,
      ),
    );
  }
}
