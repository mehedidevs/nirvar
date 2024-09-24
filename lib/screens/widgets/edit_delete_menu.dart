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

      color: AppColors.paleLight,
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
          child: Row(
            children: [
              Text('Edit', style: TextStyle(fontSize: 16.sp)),
              Spacer(),
              const Icon(Icons.edit, color: Colors.black),
            ],
          ),
        ),
        PopupMenuDivider(),
        PopupMenuItem(
          value: 2,
          child: Row(
            children: [
              Text('Delete', style: TextStyle(fontSize: 16.sp, color: Color(0xFFE39087))),
              Spacer(),
              Icon(Icons.delete, color: Color(0xFFE39087)),
            ],
          ),
        ),
      ],
    );
  }
}
