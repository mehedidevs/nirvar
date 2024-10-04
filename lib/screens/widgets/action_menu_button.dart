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
      // Popup menu design
      itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
        PopupMenuItem<int>(
          value: 1,
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text(
              "Create",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black, // Black text
              ),
            ),
            trailing: const Icon(Icons.add_box, color: Colors.black),
          ),
        ),
        const PopupMenuDivider(),
        PopupMenuItem<int>(
          value: 2,
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              "Upload",
              style: TextStyle(
                fontSize: 16,
                color: Colors.red[200], // Semi-transparent red
              ),
            ),
            leading: const Icon(Icons.upload, color: Colors.red),
          ),
        ),
      ],
      onSelected: (int value) {
        // Handle menu item clicks here
        if (value == 1) {
          onCreateFolder();
        } else if (value == 2) {
          onFileUpload();
        }
      },
    );
  }
}

