import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nirvar/screens/widgets/custom_chasing_dots.dart';

import '../../bloc/logout/logout_bloc.dart';
import '../utils/app_colors.dart';
import '../utils/assets_path.dart';
import 'custom_button.dart';

class LogoutDialog extends StatelessWidget {
  final Function(bool) onLogoutSuccess;

  const LogoutDialog({
    Key? key,
    required this.onLogoutSuccess,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: BlocConsumer<LogOutBloc, LogoutState>(
          listener: (context, state) {
            if (state.status == LogoutStatus.success) {
              // Close the dialog, then call the success callback
              Navigator.of(context).pop();
              onLogoutSuccess(true);
            } else if (state.status == LogoutStatus.failure) {
              // Close the dialog, then call the failure callback
              Navigator.of(context).pop();
              onLogoutSuccess(false);
            }
          },
          builder: (context, state) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(AssetsPath.logoutDialogueSvg),
                SizedBox(height: 16.h),
                Text(
                  'Are you sure you want to log out of your account?',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24.h),
                // Show loading spinner while logout is processing
                state.status == LogoutStatus.loading
                    ? const CustomChasingDots()
                    : Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 0.h, horizontal: 16.w),
                        child: CustomButton(
                          text: 'Log Out',
                          onPressed: () {
                            // Trigger the logout event
                            context.read<LogOutBloc>().add(LogOutApiCall());
                          },
                        ),
                      ),
                SizedBox(height: 8.h),
                // Cancel Button
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.primary, // Adjust the color if needed
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
