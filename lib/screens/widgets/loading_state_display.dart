import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nirvar/screens/widgets/custom_chasing_dots.dart';


class LoadingStateDisplay extends StatelessWidget {
  final double? size;

  const LoadingStateDisplay({super.key, this.size});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomChasingDots(size: size ?? 50.sp),
      ),
    );
  }
}

