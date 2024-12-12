import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nirvar/models/patient_files/patient_file.dart';
import 'package:nirvar/repository/patient_file/patient_file_repository.dart';
import 'package:nirvar/routes/navigation_helper.dart';
import 'package:nirvar/screens/utils/app_colors.dart';
import 'package:nirvar/screens/utils/assets_path.dart';
import 'package:nirvar/screens/utils/helper.dart';
import 'package:nirvar/screens/widgets/custom_chasing_dots.dart';
import 'package:nirvar/screens/widgets/disabled_button.dart';
import 'package:fl_downloader/fl_downloader.dart';

import '../../injection_container.dart';

class ReportDetailsScreen extends StatefulWidget {
  final PatientFile file;
  const ReportDetailsScreen({super.key, required this.file});
  @override
  State<ReportDetailsScreen> createState() => _ReportDetailsScreenState();
}

class _ReportDetailsScreenState extends State<ReportDetailsScreen> {

  bool _loading = false;
  int _downloadProgress = 0;
  dynamic downloadId;
  String? status;
  bool _isDownloading = false;
  late StreamSubscription progressStream;
  String url = '';
  String fileName = '';

  @override
  void initState() {
    super.initState();
    FlDownloader.initialize();

    progressStream = FlDownloader.progressStream.listen((event) {
      setState(() {
        _downloadProgress = event.progress;
        downloadId = event.downloadId;
        status = event.status.name;
      });

      if (event.status == DownloadStatus.successful) {
        // Open file after successful download
        FlDownloader.openFile(filePath: event.filePath);
      } else if (event.status == DownloadStatus.failed) {
        debugPrint('Download failed: ${event.status}');
      }
    });
  }

  @override
  void dispose() {
    progressStream.cancel();
    super.dispose();
  }


  // Function to handle file download with permission check
  Future<void> startDownload() async {
    final permission = await FlDownloader.requestPermission();
    if (permission == StoragePermissionStatus.granted) {
      setState(() {
        status = 'Starting download...';
      });

      await FlDownloader.download(
       url,
        fileName: fileName,
      );
    } else {
      debugPrint('Permission denied');
      setState(() {
        status = 'Permission denied';
      });
    }
  }

  // Function to handle cancellation of downloads
  Future<void> cancelDownload() async {
    if (downloadId != null) {
      final cancelList = [downloadId];
      final cancelled = await FlDownloader.cancel(cancelList);

      setState(() {
        _downloadProgress = 0;
        downloadId = null;
        status = (cancelled == cancelList.length)
            ? 'All downloads cancelled'
            : 'Cancelled $cancelled downloads';
      });
    }
  }

  String extractFilePath(String url) {
    final pattern = RegExp(r'files/(.*)');
    final match = pattern.firstMatch(url);
    return match != null ? match.group(1) ?? '' : '';
  }

  Color _getProgressColor(double progress) {
    if (progress < 0.3) {
      return Colors.redAccent;
    } else if (progress < 0.7) {
      return AppColors.softCoral;
    } else {
      return AppColors.primary;
    }
  }


  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          leading: GestureDetector(
            onTap: () => context.pop(),
            child: const Icon(Icons.arrow_back_ios, color: Colors.black),
          ),
          title: Text(
            widget.file.name ?? '',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Center(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 8.w),
              child: ListView(
                shrinkWrap: true,
                children: [
                  FittedBox(
                    fit: BoxFit.cover,
                    child: widget.file.path == null
                        ? Image.asset(
                            AssetsPath.prescriptionDetailsPng,
                            width: ScreenUtil().screenWidth * 0.8,
                            height: ScreenUtil().screenHeight * 0.7.h,
                          )
                        : Image.network(widget.file.path ?? ""),
                  ),

                  SizedBox(height: ScreenUtil().screenHeight * 0.05.h),

                  _isDownloading ? Stack(
                    alignment: Alignment.center, // Align the text to the center
                    children: [
                      // Linear Progress Indicator with rounded corners
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.r), // Rounded corners
                        child: LinearProgressIndicator(
                          value: _downloadProgress.toDouble(),
                          minHeight: 12.h, // Adjust height for better visibility
                          backgroundColor: AppColors.softCoral.withOpacity(0.5), // Lighter background
                          valueColor: AlwaysStoppedAnimation<Color>(
                            _getProgressColor(_downloadProgress.toDouble()), // Dynamic color based on progress
                          ),
                        ),
                      ),
                      // Progress percentage text in the center
                      Text(
                        "${(_downloadProgress).toStringAsFixed(0)}%", // Display percentage
                        style: TextStyle(
                          fontSize: 14.sp, // Adjust size based on your design
                          fontWeight: FontWeight.bold,
                          color: Colors.black, // Color for contrast (or dynamic if needed)
                        ),
                      ),
                    ],
                  ) : SizedBox(),

                  SizedBox(height: ScreenUtil().screenHeight * 0.1.h),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: _loading
                        ? const CustomChasingDots()
                        : _isDownloading ? const DisabledButton(buttonText: 'Download')
                        : _buildCustomButton(context, 'Download', Icons.download, const LinearGradient(
                      colors: [
                        AppColors.boxGradiantStart,
                        AppColors.boxGradiantEnd,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ), Colors.white) ,
                  ),


                  SizedBox(height: ScreenUtil().screenHeight * 0.05.h),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCustomButton(
    BuildContext context,
    String text,
    IconData icon,
    dynamic background,
    Color textColor,
  ) {
    return Container(
      width: 0.4.sw, // Width is 40% of screen width
      height: 50.h,
      decoration: BoxDecoration(
        gradient: background is LinearGradient ? background : null,
        color: background is Color ? background : null,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () async {

          setState(() {
            _loading = true;
          });

          final response = await sl<PatientFileRepository>().downloadFiles(widget.file.fileId.toString());
          response.fold((failure){
            context.flushBarErrorMessage(message: failure.toString());
            setState(() {
              _loading = false;
            });
          }, (success){
            context.flushBarSuccessMessage(message: "File Started to Download");
            //need to send the url
            print(success);
            setState(() {
              url = success;
              fileName = extractFilePath(success);
              startDownload();
              _loading = false;
              _isDownloading = true;
            });
          });

        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 14.h),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 16.sp,
                color: textColor,
              ),
            ),
            SizedBox(width: 8.w), // Add spacing between text and icon
            Icon(
              icon,
              color: textColor,
              size: 20.sp,
            ),
          ],
        ),
      ),
    );
  }
}
