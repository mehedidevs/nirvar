import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';

class LabeledDropdown extends StatelessWidget {
  final String? label; // Make label optional
  final String hint;
  final String? value;
  final List<String> items;
  final ValueChanged<String?>? onChanged;
  final FormFieldValidator<String?>? validator;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final TextStyle? itemStyle;
  final double spacing;
  final Color? fillColor;
  final InputBorder? border;
  final Widget? prefixIcon; // Optional prefix icon

  const LabeledDropdown({
    super.key,
    this.label, // Label is optional now
    required this.hint,
    required this.items,
    this.value,
    this.onChanged,
    this.validator,
    this.labelStyle,
    this.hintStyle,
    this.itemStyle,
    this.spacing = 8.0,
    this.fillColor = Colors.white,
    this.border,
    this.prefixIcon, // Optional prefix icon
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) // Only show label if it's provided
          Column(
            children: [
              Text(
                label!,
                style: labelStyle ??
                    TextStyle(
                      fontSize: 14.sp,
                      color: Colors.grey[700],
                    ),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: spacing.h), // Space between label and dropdown
            ],
          ),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            prefixIcon: prefixIcon, 
            hintText: hint,
            hintStyle: hintStyle ??
                TextStyle(
                  fontSize: 14.sp,
                  color: Colors.grey[500],
                ),
            border: border ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                  ),
                ),
            enabledBorder: border ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                  ),
                ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: const BorderSide(
                color: AppColors.primary,
              ),
            ),
            filled: true,
            fillColor: fillColor,
          ),
          value: value,
          items: items.isNotEmpty
              ? items
              .map((item) => DropdownMenuItem(
            value: item,
            child: Text(
              item,
              style: itemStyle ??
                  TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey[700],
                  ),
            ),
          ))
              .toList()
              : null,
          onChanged: onChanged,
          validator: validator,
          hint: Text(
            items.isEmpty ? 'No options available' : hint,
            style: hintStyle ??
                TextStyle(
                  fontSize: 14.sp,
                  color: Colors.grey[500],
                ),
          ),
        ),
      ],
    );
  }
}
