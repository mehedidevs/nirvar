import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nirvar/screens/utils/app_colors.dart';
import 'package:nirvar/screens/utils/theme_helper.dart';

import '../utils/ui_helper.dart';

class EditDeleteMenu extends StatelessWidget {
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const EditDeleteMenu({
    super.key,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      icon: Icon(
        Icons.more_vert,
        size: 20.sp,
        color: Colors.grey,
      ),
      color: AppColors.menuItemColor.withOpacity(0.95),
      constraints: BoxConstraints(minWidth: 25.w),
      position: PopupMenuPosition.over,
      offset: const Offset(-2, 16),
      padding: EdgeInsets.zero,
      menuPadding: EdgeInsets.zero,
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
          padding: UIHelper.symmetricPadding(vertical: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             Text('Edit',  style: context.textTheme.labelMedium?.copyWith(
                letterSpacing: 0.0,
                color: Colors.black,
              ),),
             Icon(Icons.edit, color: Colors.black,size: 16.sp,),
            ],
          ),
        ),
        PopupMenuDivider(height: 4.h),
        PopupMenuItem(
          value: 2,
            padding: UIHelper.symmetricPadding(vertical: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
            Text('Delete',  style: context.textTheme.labelMedium?.copyWith(
               letterSpacing: 0.0,
               color: const Color(0xFFE39087),
             ),),
             Icon(Icons.delete_forever, color: Color(0xFFE39087),size: 16.sp,),
           ],
          )
        ),
      ],
    );
  }
}
