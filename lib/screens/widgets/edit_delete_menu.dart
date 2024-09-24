import 'package:flutter/material.dart';
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
              Icon(Icons.edit, color: Colors.blueAccent),
              SizedBox(width: 8),
              Text("Edit"),
            ],
          ),
        ),
        PopupMenuItem(
          value: 2,
          child: Row(
            children: [
              Icon(Icons.delete, color: Colors.red),
              SizedBox(width: 8),
              Text("Delete"),
            ],
          ),
        ),
      ],
    );
  }
}
