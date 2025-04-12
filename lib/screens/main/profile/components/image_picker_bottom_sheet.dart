import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nirvar/screens/utils/app_colors.dart';
import 'package:nirvar/screens/utils/theme_helper.dart';

import '../../../utils/assets_path.dart';

class ImagePickerBottomSheet extends StatelessWidget {
  final VoidCallback onCameraTap;
  final VoidCallback onGalleryTap;

  const ImagePickerBottomSheet({
    super.key,
    required this.onCameraTap,
    required this.onGalleryTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40.w,
            height: 4.h,
            decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            "Choose an option",
            style: context.textTheme.bodyLarge?.copyWith(color: AppColors.appBarColor,fontWeight: FontWeight.w600,)
          ),
          SizedBox(height: 24.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _ImageOptionButton(
                icon: AssetsPath.cameraColorSvg,
                label: "Camera",
                onTap: onCameraTap,
              ),
              _ImageOptionButton(
                icon: AssetsPath.gallarySvg,
                label: "Gallery",
                onTap: onGalleryTap,
              ),
            ],
          ),
          SizedBox(height: 8.h),
        ],
      ),
    );
  }
}

class _ImageOptionButton extends StatelessWidget {
  final String icon;
  final String label;
  final VoidCallback onTap;

  const _ImageOptionButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          SvgPicture.asset(
            icon,
          ),
          SizedBox(height: 8.h),
          Text(
            label,
            style: context.textTheme.bodySmall?.copyWith(color: AppColors.appBarColor,fontWeight: FontWeight.w300,)
          )
        ],
      ),
    );
  }
}
