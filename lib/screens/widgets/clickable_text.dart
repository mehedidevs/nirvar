import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:nirvar/screens/utils/app_colors.dart';
import 'package:nirvar/screens/utils/theme_helper.dart';

class ClickableText extends StatelessWidget {
  final String regularText;
  final String clickableText;
  final TextStyle? regularTextStyle;
  final TextStyle? clickableTextStyle;
  final VoidCallback onTap;

  const ClickableText({
    super.key,
    required this.regularText,
    required this.clickableText,
    required this.onTap,
    this.regularTextStyle,
    this.clickableTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: regularText,
        style: regularTextStyle ??
                context
                .textTheme
                .bodySmall
                ?.copyWith(color: AppColors.black,fontWeight: FontWeight.w600),
        children: [
          TextSpan(
            text: clickableText,
            style: clickableTextStyle ??
               context
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: AppColors.primary,fontWeight: FontWeight.w600),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
