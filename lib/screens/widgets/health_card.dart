import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nirvar/screens/utils/app_colors.dart';
import 'package:nirvar/screens/utils/assets_path.dart';
import 'package:nirvar/screens/utils/theme_helper.dart';

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
    const double kCardRadius = 14.0;

    return SizedBox(
      height: 120.h,         // 0.18.sh
      child: Container(
        padding: EdgeInsets.only(top: kCardPadding.h,right: kCardPadding.w,left: kCardPadding.w),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(kCardRadius.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [

            // ListTile(
            //   title: Text(
            //     value,
            //     style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600,color: Colors.white),
            //     overflow: TextOverflow.ellipsis,
            //     maxLines: 1,
            //   ),
            //   subtitle:  Text(
            //     average,
            //     style: context.textTheme.labelSmall?.copyWith(fontWeight: FontWeight.w400,color: Colors.white),
            //   ),
            //   trailing:  InkWell(
            //     onTap: onPressed,
            //     child: SvgPicture.asset(
            //       AssetsPath.gotoSvg,
            //       height: 25.h,
            //       width: 25.w,
            //       placeholderBuilder: (context) => Icon(
            //         Icons.error,
            //         size: 25.w,
            //         color: Colors.red,
            //       ),
            //     ),
            //   ),
            // ),
            //
            // Spacer(),
            //
            // Text(
            //   label,
            //   style:context.textTheme.labelSmall?.copyWith(fontWeight: FontWeight.w400,color: Colors.white),
            // ),

            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          value,
                          style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600,color: Colors.white),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        Text(
                          average,
                          style:context.textTheme.labelSmall?.copyWith(fontWeight: FontWeight.w400,color: Colors.white,letterSpacing: 0.0),
                        ),
                      ],
                    ),
                  ),

                  4.horizontalSpace,

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
            // 2.verticalSpace,
            // Text(
            //   average,
            //   style:context.textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w400,color: Colors.white),
            // ),
            16.verticalSpace,
            Text(
              label,
              style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500,color: Colors.white,letterSpacing: 0.0),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}
