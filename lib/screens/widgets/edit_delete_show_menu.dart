import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nirvar/screens/utils/theme_helper.dart';

import '../utils/app_colors.dart';
import '../utils/ui_helper.dart';

class EditDeleteShowMenu extends StatelessWidget {
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const EditDeleteShowMenu({
    super.key,
    required this.onEdit,
    required this.onDelete,
  });

  void _showCustomMenu(BuildContext context, TapDownDetails details) {
    final position = details.globalPosition;
    showMenu<int>(
      context: context,
      color: AppColors.menuItemColor.withOpacity(0.8),
      constraints: BoxConstraints(minWidth: 25.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      position: RelativeRect.fromLTRB(
        position.dx - 2, // little left (-2)
        position.dy + 16, // little below (+16)
        position.dx,
        position.dy,
      ),
      items: [
        PopupMenuItem(
          value: 1,
          padding: UIHelper.symmetricPadding(vertical: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Edit',
                style: context.textTheme.labelMedium?.copyWith(
                  letterSpacing: 0.0,
                  color: Colors.black,
                ),
              ),
              Icon(Icons.edit, color: Colors.black, size: 16.sp),
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
              Text(
                'Delete',
                style: context.textTheme.labelMedium?.copyWith(
                  letterSpacing: 0.0,
                  color: const Color(0xFFE39087),
                ),
              ),
              Icon(Icons.delete_forever, color: Color(0xFFE39087), size: 16.sp),
            ],
          ),
        ),
      ],
    ).then((selectedValue) {
      if (selectedValue == 1) {
        onEdit();
      } else if (selectedValue == 2) {
        onDelete();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) => _showCustomMenu(context, details),
      child: Icon(
        Icons.more_vert,
        size: 20.sp,
        color: Colors.grey,
      ),
    );
  }
}
