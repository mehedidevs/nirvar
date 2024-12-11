import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class ErrorMessageDisplay extends StatelessWidget {
  final String message;

  const ErrorMessageDisplay({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(color: AppColors.red),
            ),
          ],
        ),
      ),
    );
  }
}
