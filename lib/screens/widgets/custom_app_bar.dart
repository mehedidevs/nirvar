import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nirvar/screens/utils/app_colors.dart';

import '../notification/notification_screen.dart';
import '../utils/assets_path.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: GestureDetector(
        onTap: () => Navigator.of(context).pop(true),
        child: const Icon(Icons.arrow_back_ios, color: Colors.black),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 2.h),
          Container(
            height: 2.h,
            width: 100.w,
            color: AppColors.shadyBlue,
          ),
        ],
      ),
      centerTitle: true,
      actions: [
        Stack(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NotificationScreen(hasNotification: true),
                    ),
                  );
                },
                icon: SvgPicture.asset(AssetsPath.notificationWithBadgeSvg)
            ),
            // Positioned(
            //   right: 11,
            //   top: 11,
            //   child: Container(
            //     padding: EdgeInsets.all(2.w),
            //     decoration: BoxDecoration(
            //       color: AppColors.primary,
            //       shape: BoxShape.circle,
            //     ),
            //     constraints: BoxConstraints(
            //       minWidth: 8.w,
            //       minHeight: 8.h,
            //     ),
            //   ),
            // )
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
