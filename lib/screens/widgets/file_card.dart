import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nirvar/screens/details/report_screen.dart';
import 'package:nirvar/screens/utils/app_colors.dart';
import 'package:nirvar/screens/utils/assets_path.dart';

import '../main/my_files/scanner/qr_code_screen.dart';
import 'edit_delete_menu.dart';

class FileCard extends StatelessWidget {
  final String folderName;
  final int fileCount;

  FileCard({required this.folderName, required this.fileCount});



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ReportScreen(title: folderName)));
      },
      child: Container(
        padding: EdgeInsets.all(12.w),  // Responsive padding
        decoration: BoxDecoration(
          color: AppColors.pale,
          borderRadius: BorderRadius.circular(16.r), // Responsive corner radius
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8.r,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Image.asset(
                    AssetsPath.fileCardPng,
                    width: 48.sp,
                    height: 48.sp,
                  ),

                  const Spacer(),  // Responsive spacing
                  Text(
                    folderName,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    '$fileCount Files',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 8.h),
                ],
              ),
            ),
            Flexible(
              child: Column(
                children: [
                  // Icon(
                  //   Icons.more_vert,
                  //   size: 20.sp,
                  //   color: Colors.grey,
                  // ),

                  EditDeleteMenu(
                    onEdit: () {
                      // _editAction(context);
                    },
                    onDelete: () {
                      // _deleteAction(context);
                    },
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => QrCodeScreen()));
                    },
                    child: Icon(
                      Icons.share,
                      size: 20.sp,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
