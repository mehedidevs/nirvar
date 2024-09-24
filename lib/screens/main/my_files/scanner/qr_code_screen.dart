import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For Clipboard
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nirvar/screens/utils/app_colors.dart';
import 'package:nirvar/screens/utils/assets_path.dart';

import '../../../widgets/custom_button_with_icon.dart'; // If you're using ScreenUtil for responsiveness

class QrCodeScreen extends StatefulWidget {
  const QrCodeScreen({super.key});

  @override
  State<QrCodeScreen> createState() => _QrCodeScreenState();
}

class _QrCodeScreenState extends State<QrCodeScreen> {
  bool isButtonVisible = false;
  bool hasCopied = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
          'Scan QR Code',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: ScreenUtil().screenHeight * .1.h,
                  ),
                  FittedBox(
                    fit: BoxFit.contain,
                    child: Image.asset(
                      AssetsPath.qrCodePng,
                      height: 250.h,
                      width: 250.w,
                    ),
                  ),
                  SizedBox(height: 16.h),

                  // URL Container
                  Padding(
                    padding: EdgeInsets.all(16.w),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.boxGradiantEnd),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'https://www.google.com/la-i&urlmkq',
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.black,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          IconButton(
                            icon: SvgPicture.asset(
                              hasCopied ? AssetsPath.copyFilledSvg : AssetsPath.copySvg,
                            ),
                            onPressed: () {
                              Clipboard.setData(
                                const ClipboardData(
                                    text: 'https://www.google.com/la-i&urlmkq'),
                              );
                              setState(() {
                                isButtonVisible = true; // Show the button
                                hasCopied = true; // Change the icon to check
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: ScreenUtil().screenHeight * .065.h),

                  // Button that appears after copying the link
                  if (isButtonVisible)
                    CustomButtonWithIcon(
                      text: 'Link Copied To Clipboard',
                      onPressed: () {
                        // Your action here
                      },
                      icon: Icons.check_circle,
                      widthFactor: 0.8,
                      heightFactor: 0.08,
                    )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
