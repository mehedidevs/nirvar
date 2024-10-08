import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nirvar/screens/utils/app_colors.dart';

class EditDeleteMenu extends StatelessWidget {
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const EditDeleteMenu({
    Key? key,
    required this.onEdit,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      icon: Icon(
        Icons.more_vert,
        size: 25.sp,
        color: Colors.grey,
      ),
      color: AppColors.menuItemColor,
      constraints: BoxConstraints(minWidth: 20.w),
      position: PopupMenuPosition.over,
      offset: const Offset(0, 6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      onSelected: (value) {
        if (value == 1) {
          onEdit();
        } else if (value == 2) {
          onDelete();
        }
      },
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 1,
          child: ListTile(
            title: Text('Edit', style: TextStyle(fontSize: 12.sp)),
            trailing:   Icon(Icons.edit, color: Colors.black,size: 20.sp,),
          ),
        ),
        PopupMenuDivider(height: 8.h),
        PopupMenuItem(
          value: 2,
          child: ListTile(
            title: Text('Delete', style: TextStyle(fontSize: 12.sp, color: const Color(0xFFE39087))),
            trailing:   Icon(Icons.delete_forever, color: Color(0xFFE39087),size: 20.sp,),
          )
        ),
      ],
    );
  }
}
