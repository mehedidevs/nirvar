import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nirvar/screens/utils/assets_path.dart';

import '../../../utils/app_colors.dart';

class BloodPressureWidget extends StatelessWidget {
  final String bloodPressure;

  const BloodPressureWidget({Key? key, required this.bloodPressure})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal:  16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        gradient: const LinearGradient(
          colors: [AppColors.boxGradiantStart, AppColors.boxGradiantEnd],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Blood Pressure',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          bloodPressure,
                          style: TextStyle(
                            fontSize: 32.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          'Avg.',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.black.withOpacity(0.6),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SvgPicture.asset(
                  AssetsPath.beatSvg,
                  height: 50.h,
                  width: 50.w,
                ),
              ],
            ),
          ),
          Icon(
            Icons.more_horiz,
            size: 20.sp,
            color: Colors.black,
          ),
          SizedBox(height: 4.h)
        ],
      ),
    );
  }
}
