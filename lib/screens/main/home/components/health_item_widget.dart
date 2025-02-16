import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../utils/app_colors.dart';

class HealthItemWidget extends StatelessWidget {
  final String title;
  final String value;
  final String svgAsset;
  final VoidCallback? onMenuPressed;

  const HealthItemWidget({
    super.key,
    required this.title,
    required this.value,
    required this.svgAsset,
    this.onMenuPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.w),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.pale, // Background color of the card
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Icon Container
          SvgPicture.asset(svgAsset),
          SizedBox(width: 16.w), // Space between icon and text
          // Text Column
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                    color: const Color(0xFF2B3A4B), // Text color
                  ),
                ),
                SizedBox(height: 4.h), // Space between title and subtitle
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: const Color(0xFF8A8A8A), // Subtext color
                  ),
                ),
              ],
            ),
          ),
          // Overflow Menu Icon
          IconButton(
            icon: const Icon(
              Icons.more_vert,
              color: Color(0xFF2B3A4B),
            ),
            onPressed: onMenuPressed,
          ),
        ],
      ),
    );
  }
}
