import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';

class circuler_add_button extends StatelessWidget {
  const circuler_add_button({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        border: Border.all(
          color: Colors.grey.shade300, // light grey border
          width: .5,
        ),
      ),
      child: Material(
        shape: const CircleBorder(),
        elevation: 4,
        color: Colors.white, // Background color of the circle
        child: Padding(
          padding: const EdgeInsets.all(8.0), // Adjust padding for icon size
          child: Icon(
            Icons.add_circle_outline,
            color: AppColors.primary,
            size: 25.sp,
          ),
        ),
      ),
    );
  }
}