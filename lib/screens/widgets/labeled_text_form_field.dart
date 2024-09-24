import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nirvar/screens/utils/app_colors.dart'; // Make sure to import your AppColors

class LabeledTextFormField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool obscureText;
  final bool enabled;
  final bool hasToggle;
  final void Function()? onVisibilityToggle;
  final bool readOnly;

  const LabeledTextFormField({
    Key? key,
    required this.label,
    required this.hint,
    this.controller,
    this.validator,
    this.obscureText = false,
    this.enabled = true,
    this.hasToggle = false, // Initialize with default value as false
    this.onVisibilityToggle,
    this.readOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14.sp,
            color: Colors.grey[700],
          ),
        ),
        SizedBox(height: 8.h),
        TextFormField(
          controller: controller,
          validator: validator,
          obscureText: obscureText,
          enabled: enabled,
          readOnly: readOnly,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey[500],
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color: Colors.grey.shade300,
              ),
            ),
            enabledBorder: OutlineInputBorder(
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
            fillColor: Colors.white,
            suffixIcon: hasToggle // Use the new property to control visibility toggle
                ? IconButton(
              icon: Icon(
                obscureText ? Icons.visibility_off : Icons.visibility,
                color: Colors.grey.shade300,
              ),
              onPressed: onVisibilityToggle,
            )
                : null,
          ),
        ),
      ],
    );
  }
}
