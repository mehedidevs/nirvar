import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nirvar/screens/utils/app_colors.dart';

class ActionMenuButton extends StatelessWidget {

  final VoidCallback onCreateFolder;
  final VoidCallback onFileUpload;

  const ActionMenuButton({Key? key, required this.onCreateFolder, required this.onFileUpload}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      // Custom child button design
      itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
        PopupMenuItem<int>(
          value: 1,
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              "Create",
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.black, // Black text
              ),
            ),
            trailing: const Icon(Icons.create_new_folder, color: Colors.black),
          ),
        ),
         PopupMenuDivider(height: 8.h),
        PopupMenuItem<int>(
          value: 2,
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              "Upload",
              style: TextStyle(
                fontSize: 16.sp,
                color: const Color(0xFFE39087),
              ),
            ),
            trailing: const Icon(Icons.cloud_upload, color: Color(0xFFE39087)),
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
      color: AppColors.menuItemColor,
      constraints: BoxConstraints(minWidth: 20.w),
      position: PopupMenuPosition.over,
      offset: const Offset(0, 6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      // Custom child button design
      child: Container(
        padding:  EdgeInsets.symmetric(horizontal: 8.h, vertical: 4.w),
        decoration: BoxDecoration(
          color: AppColors.primary, // Light teal background
          borderRadius: BorderRadius.circular(30.r), // Rounded corners
        ),
        child: Padding(
          padding:  EdgeInsets.all(4.sp),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children:  [
              Icon(
                Icons.add,
                color: Colors.white, // White icon
                size: 18.sp,
              ),
              SizedBox(width:4.w),
              Text(
                "New",
                style: TextStyle(
                  color: Colors.white, // White text
                  fontSize: 16.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

