import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nirvar/screens/utils/app_colors.dart';
import 'package:nirvar/screens/utils/assets_path.dart';

class HealthCard extends StatelessWidget {
  final String value;
  final String average;
  final String label;
  final VoidCallback onPressed;

  HealthCard({
    required this.value,
    required this.average,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.18.sh,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(12.r),
          shape: BoxShape.rectangle),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          value,
                          style: TextStyle(
                              fontSize: 24.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                          overflow: TextOverflow.fade,
                          maxLines: 1,
                        ),
                        SizedBox(width: 8.w),
                        InkWell(
                          onTap: onPressed,
                          child: SvgPicture.asset(
                            AssetsPath.gotoSvg,
                            height: 30.h,
                            width: 30.w,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      average,
                      style: TextStyle(fontSize: 14.sp, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            label,
            style: TextStyle(fontSize: 16.sp, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
