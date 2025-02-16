import 'dart:typed_data'; // For Uint8List
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pdfx/pdfx.dart'; // For PDF rendering
import 'package:http/http.dart' as http;

import '../utils/app_colors.dart'; // For fetching the PDF

class PdfViewer extends StatefulWidget {
  final String pdfUrl;

  const PdfViewer({super.key, required this.pdfUrl});

  @override
  _PdfViewerState createState() => _PdfViewerState();
}

class _PdfViewerState extends State<PdfViewer> {
  PdfControllerPinch? _pdfController;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadPdf();
  }

  Future<void> _loadPdf() async {
    try {
      // Load the PDF directly from the URL
      _pdfController = PdfControllerPinch(
        document: PdfDocument.openData(
          await _fetchPdfFromUrl(widget.pdfUrl),
        ),
      );

      setState(() {
        _isLoading = false; // Hide the loader once the PDF is loaded
      });
    } catch (e) {
      print('Error loading PDF: $e');
      setState(() {
        _isLoading = false; // Hide the loader if there's an error
      });
    }
  }

  Future<Uint8List> _fetchPdfFromUrl(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      throw Exception('Failed to load PDF');
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? SizedBox(
            height: ScreenUtil().screenHeight * 0.5,
            child: Center(
                child:
                    SpinKitChasingDots(color: AppColors.primary, size: 50.sp)))
        : SizedBox(
            width: ScreenUtil().screenWidth * 0.8,
            height: ScreenUtil().screenHeight * 0.4.h,
            child: PdfViewPinch(
              controller: _pdfController!, // Render the PDF
            ),
          );
  }
}
