import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UIHelper {
  // Screen Height and Width using ScreenUtil for responsive design
  static final double screenHeight = ScreenUtil().screenHeight;
  static final double screenWidth = ScreenUtil().screenWidth;


  //Radius
  static final double largeRadius = 50.r;
  static final double mediumRadius = 25.r;
  static final double smallRadius = 15.r;
  static final double extraSmallRadius = 10.r;


  // Predefined padding constants
  static final EdgeInsets paddingSmall = EdgeInsets.all(8.r);
  static final EdgeInsets paddingMedium = EdgeInsets.all(16.r);
  static final EdgeInsets paddingLarge = EdgeInsets.all(24.r);

  // Predefined margin constants
  static final EdgeInsets marginSmall = EdgeInsets.all(8.r);
  static final EdgeInsets marginMedium = EdgeInsets.all(16.r);
  static final EdgeInsets marginLarge = EdgeInsets.all(24.r);

  // Horizontal and Vertical paddings
  static final EdgeInsets horizontalPaddingSmall = EdgeInsets.symmetric(horizontal: 8.w);
  static final EdgeInsets horizontalPaddingMedium = EdgeInsets.symmetric(horizontal: 16.w);
  static final EdgeInsets horizontalPaddingLarge = EdgeInsets.symmetric(horizontal: 24.w);

  static final EdgeInsets verticalPaddingSmall = EdgeInsets.symmetric(vertical: 8.h);
  static final EdgeInsets verticalPaddingMedium = EdgeInsets.symmetric(vertical: 16.h);
  static final EdgeInsets verticalPaddingLarge = EdgeInsets.symmetric(vertical: 24.h);

  // Horizontal and Vertical margins
  static final EdgeInsets horizontalMarginSmall = EdgeInsets.symmetric(horizontal: 8.w);
  static final EdgeInsets horizontalMarginMedium = EdgeInsets.symmetric(horizontal: 16.w);
  static final EdgeInsets horizontalMarginLarge = EdgeInsets.symmetric(horizontal: 24.w);

  static final EdgeInsets verticalMarginSmall = EdgeInsets.symmetric(vertical: 8.h);
  static final EdgeInsets verticalMarginMedium = EdgeInsets.symmetric(vertical: 16.h);
  static final EdgeInsets verticalMarginLarge = EdgeInsets.symmetric(vertical: 24.h);

  // Specific only paddings
  static EdgeInsets onlyPadding({double top = 0, double bottom = 0, double left = 0, double right = 0}) {
    return EdgeInsets.only(
      top: top.h,
      bottom: bottom.h,
      left: left.w,
      right: right.w,
    );
  }

  // Specific only margins
  static EdgeInsets onlyMargin({double top = 0, double bottom = 0, double left = 0, double right = 0}) {
    return EdgeInsets.only(
      top: top.h,
      bottom: bottom.h,
      left: left.w,
      right: right.w,
    );
  }

  // Flexible and adaptable paddings/margins
  static EdgeInsets symmetricPadding({double vertical = 16, double horizontal = 8}) {
    return EdgeInsets.symmetric(vertical: vertical.h, horizontal: horizontal.w);
  }

  static EdgeInsets symmetricMargin({double vertical = 16, double horizontal = 8}) {
    return EdgeInsets.symmetric(vertical: vertical.h, horizontal: horizontal.w);
  }

  // Vertical spacing with predefined sizes
  static SizedBox verticalSpaceSmall() {
    return SizedBox(height: 8.h);
  }

  static SizedBox verticalSpaceMedium() {
    return SizedBox(height: 16.h);
  }

  static SizedBox verticalSpaceLarge() {
    return SizedBox(height: 24.h);
  }

  static SizedBox verticalSpaceExtraLarge() {
    return SizedBox(height: 32.h);
  }

  // Horizontal spacing with predefined sizes
  static SizedBox horizontalSpaceSmall() {
    return SizedBox(width: 8.w);
  }

  static SizedBox horizontalSpaceMedium() {
    return SizedBox(width: 16.w);
  }

  static SizedBox horizontalSpaceLarge() {
    return SizedBox(width: 24.w);
  }

  static SizedBox horizontalSpaceExtraLarge() {
    return SizedBox(width: 32.w);
  }

  // Flexible vertical and horizontal spacing with default value
  static SizedBox verticalSpace([double height = 10]) {
    return SizedBox(height: height.h);
  }

  static SizedBox horizontalSpace([double width = 10]) {
    return SizedBox(width: width.w);
  }
}
