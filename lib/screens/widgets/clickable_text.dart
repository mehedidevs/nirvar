import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:nirvar/screens/utils/app_colors.dart';

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
            Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: AppColors.black),
        children: [
          TextSpan(
            text: clickableText,
            style: clickableTextStyle ??
                Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: AppColors.primary),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
