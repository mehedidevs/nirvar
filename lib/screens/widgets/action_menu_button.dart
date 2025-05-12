import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nirvar/screens/utils/app_colors.dart';
import 'package:nirvar/screens/utils/theme_helper.dart';
import 'package:nirvar/screens/utils/ui_helper.dart';

class ActionMenuButton extends StatelessWidget {
  final VoidCallback onCreateFolder;
  final VoidCallback onFileUpload;

  const ActionMenuButton(
      {super.key, required this.onCreateFolder, required this.onFileUpload});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      // Custom child button design
      itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
        PopupMenuItem<int>(
          value: 1,
          padding: UIHelper.symmetricPadding(vertical: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:[
              Text(
                "Create",
                style: context.textTheme.labelMedium?.copyWith(
                  letterSpacing: 0.0,
                  color: Colors.black,
                ),
                // style: TextStyle(
                //   fontSize: 12.sp,
                //   color: Colors.black, // Black text
                // ),
              ),
              Icon(Icons.create_new_folder, color: Colors.black, size: 16.sp),
            ]
          ),
        ),
        PopupMenuDivider(
          height: 4.h,
        ),
        PopupMenuItem<int>(
          value: 2,
          padding: UIHelper.symmetricPadding(vertical: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Upload",
                style: context.textTheme.labelMedium?.copyWith(
                  letterSpacing: 0.0,
                  color:  const Color(0xFFE39087),
                ),
                // style: TextStyle(
                //   fontSize: 12.sp,
                //   color: const Color(0xFFE39087),
                // ),
              ),
               Icon(
                Icons.cloud_upload,
                color: const Color(0xFFE39087),
                size: 16.sp,
              ),
            ],

          ),
        ),
      ],
      onSelected: (int value) {
        if (value == 1) {
          onCreateFolder();
        } else if (value == 2) {
          onFileUpload();
        }
      },
      color: AppColors.menuItemColor.withOpacity(0.9),
      constraints: BoxConstraints(minWidth: 25.w),
      position: PopupMenuPosition.over,
      offset: const Offset(-2, 16),
      padding: EdgeInsets.zero,
      menuPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      // Custom child button design
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 4.w),
        decoration: BoxDecoration(
          color: AppColors.primary, // Light teal background
          borderRadius: BorderRadius.circular(30.r), // Rounded corners
        ),
        child: Padding(
          padding: EdgeInsets.all(4.w),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.add,
                color: Colors.white, // White icon
                size: 12.sp,
              ),
              SizedBox(width: 4.w),
              Text("New",
                  style: context.textTheme.labelMedium?.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ),
    );
  }
}
