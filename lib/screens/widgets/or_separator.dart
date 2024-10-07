import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nirvar/screens/utils/app_colors.dart';

class OrSeparator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h), // Use screen utils for padding
      child: Row(
        children: [
          Expanded(
            child: DottedLine(
              dashColor: AppColors.primary.withOpacity(0.5), // Dotted line color
              lineThickness: 1.w, // Make the line thickness responsive
              dashGapLength: 4.w, // Space between dots
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w), // Spacing around the "Or" text
            child: Text(
              'Or',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14.sp, // Make the text size responsive
              ),
            ),
          ),
          Expanded(
            child: DottedLine(
              dashColor: AppColors.primary.withOpacity(0.5),
              lineThickness: 1.w,
              dashGapLength: 4.w,
            ),
          ),
        ],
      ),
    );
  }
}
