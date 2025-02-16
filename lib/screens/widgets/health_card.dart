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

  const HealthCard({
    super.key,
    required this.value,
    required this.average,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    const double kCardPadding = 16.0;
    const double kCardRadius = 12.0;

    return SizedBox(
      height: 0.18.sh,
      child: Container(
        padding: EdgeInsets.all(kCardPadding.w),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(kCardRadius.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      value,
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  InkWell(
                    onTap: onPressed,
                    child: SvgPicture.asset(
                      AssetsPath.gotoSvg,
                      height: 30.h,
                      width: 30.w,
                      placeholderBuilder: (context) => Icon(
                        Icons.error,
                        size: 30.w,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              average,
              style: TextStyle(fontSize: 14.sp, color: Colors.white),
            ),
            SizedBox(height: 16.h),
            Text(
              label,
              style: TextStyle(fontSize: 16.sp, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
