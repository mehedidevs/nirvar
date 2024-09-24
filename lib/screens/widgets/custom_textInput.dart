import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String? label;
  final String? hint;
  final bool? enabled;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final void Function()? obscureVisible;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  final void Function()? onTap;
  final void Function()? onEditingComplete;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final InputBorder? border;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? disabledBorder;
  final InputBorder? errorBorder;
  final TextAlign? textAlign;
  final TextStyle? style;
  final String? errorText;

  const CustomTextField({
    super.key,
    this.label,
    this.textAlign,
    this.hint,
    this.enabled,
    this.controller,
    this.keyboardType,
    this.obscureText,
    this.suffixIcon,
    this.obscureVisible,
    this.prefixIcon,
    this.validator,
    this.onSaved,
    this.onChanged,
    this.onTap,
    this.onEditingComplete,
    this.textInputAction,
    this.focusNode,
    this.border,
    this.enabledBorder,
    this.focusedBorder,
    this.disabledBorder,
    this.errorBorder,
    this.style,
    this.errorText
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled ?? true,
      style: style ?? Theme.of(context).textTheme.bodySmall,
      controller: controller,
      cursorColor: AppColors.primary,
      keyboardType: keyboardType,
      validator: validator,
      onSaved: onSaved,
      onChanged: onChanged,
      onTap: onTap,
      textAlign: textAlign ?? TextAlign.start,
      onEditingComplete: onEditingComplete,
      textInputAction: textInputAction,
      focusNode: focusNode,
      readOnly: onTap != null,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        labelText: label,
        hintText: hint,
        errorText: errorText,
        suffixIcon: obscureVisible != null
            ? IconButton(
          onPressed: obscureVisible,
          icon: Icon(
            obscureText ?? false
                ? Icons.visibility
                : Icons.visibility_off,
            color: AppColors.primary,
          ),
        )
            : suffixIcon,
        prefixIcon: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: prefixIcon,
        ),
        labelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.grey),
        floatingLabelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.grey),
        hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.grey),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        border: border ??
            OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.primary),
              borderRadius: BorderRadius.all(
                Radius.circular(15.r),
              ),
            ),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.primary),
              borderRadius: BorderRadius.all(
                Radius.circular(15.r),
              ),
            ),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.primary),
              borderRadius: BorderRadius.all(
                Radius.circular(15.r),
              ),
            ),
        errorBorder: focusedBorder ??
            OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.red),
                borderRadius: BorderRadius.all(
                  Radius.circular(15.r),
                )
            ),
        disabledBorder: disabledBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.primary),
              borderRadius: BorderRadius.all(
                Radius.circular(15.r),
              ),
            ),
      ),
    );
  }
}
