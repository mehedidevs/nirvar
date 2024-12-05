import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nirvar/bloc/forgot_password_otp_send/forgot_password_otp_send_bloc.dart';
import 'package:nirvar/bloc/resend_otp/resend_otp_bloc.dart';
import 'package:nirvar/screens/auth/change_password.dart';
import 'package:nirvar/screens/utils/app_colors.dart';
import 'package:nirvar/screens/utils/helper.dart';
import 'package:nirvar/screens/widgets/disabled_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../injection_container.dart';
import '../utils/assets_path.dart';
import '../widgets/custom_button.dart';

class ForgotPasswordOtpScreen extends StatefulWidget {
  final String phoneNumber;

  const ForgotPasswordOtpScreen({super.key, required this.phoneNumber});

  @override
  State<ForgotPasswordOtpScreen> createState() =>
      _ForgotPasswordOtpScreenState();
}

class _ForgotPasswordOtpScreenState extends State<ForgotPasswordOtpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ForgotPasswordOtpSendBloc>(),
      child: _buildUI(context),
    );
  }

  Widget _buildUI(context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 24.w),
          child: BlocConsumer<ForgotPasswordOtpSendBloc, ForgotPasswordOtpSendState>(
            listener: (context, state) {
              if (state.status == ForgotPasswordOtpSendStatus.success) {
                context.flushBarSuccessMessage(message: state.successMessage);
                Future.delayed(const Duration(seconds: 2), () {
                  if(context.mounted){
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ChangePassword()));
                  }
                });
              } else if (state.status == ForgotPasswordOtpSendStatus.failure) {
                _otpController.clear();
                context.flushBarErrorMessage(message: state.errorMessage);
              } else if(state.status == ForgotPasswordOtpSendStatus.resendSuccess){
                context.flushBarSuccessMessage(message: state.successMessage);
              }else if(state.status == ForgotPasswordOtpSendStatus.resendFailure){
                context.flushBarErrorMessage(message: state.errorMessage);
              }
            },
            buildWhen: (previous, current) => current.status != previous.status,
            builder: (context, state) {
              return  Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: ScreenUtil().screenHeight * .001.h),
                    Text('Enter Verification Code',
                        style: Theme.of(context).textTheme.titleMedium),
                    20.verticalSpace,
                    SvgPicture.asset(
                      AssetsPath.verificationSvg, // Use logoPath parameter
                      width: 150.h,
                      height: 150.h,
                      fit: BoxFit.cover,
                    ),
                    20.verticalSpace,
                    Text('Enter OTP',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: Colors.black, fontWeight: FontWeight.w600)),
                    10.verticalSpace,
                    Text(
                      'Enter 4-digit OTP sent to (+88${widget.phoneNumber})',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: Colors.grey, fontWeight: FontWeight.w400),
                    ),
                    20.verticalSpace,
                    PinCodeTextField(
                      appContext: context,
                      length: 4,
                      controller: _otpController,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      animationType: AnimationType.fade,
                      pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(15.r),
                          fieldHeight: 50.h,
                          fieldWidth: 50.w,
                          activeFillColor: Colors.white,
                          selectedFillColor: Colors.white,
                          inactiveFillColor: Colors.white,
                          errorBorderColor: AppColors.red,
                          activeColor: AppColors.primary,
                          selectedColor: AppColors.primary,
                          inactiveColor: AppColors.white,
                          inActiveBoxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                          activeBoxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ]),
                      animationDuration: const Duration(milliseconds: 300),
                      backgroundColor: Colors.transparent,
                      enableActiveFill: true,
                      onCompleted: (value) {},
                      onChanged: (value) {
                        if (value.length == 4 &&
                            RegExp(r'^\d{4}$').hasMatch(value)) {
                          setState(() {
                            _otpController.text = value;
                          });
                        }
                      },
                    ),
                    20.verticalSpace,
                    (_otpController.text.isEmpty || _otpController.text.length < 4)
                        ? const DisabledButton(buttonText: 'Verify')
                        : (state.status == ForgotPasswordOtpSendStatus.loading)
                        ? SpinKitChasingDots(
                        color: AppColors.primary, size: 25.sp)
                        : CustomButton(
                      text: 'Verify',
                      onPressed: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                        context.read<ForgotPasswordOtpSendBloc>().add(ForgotPasswordOtpChange(otp: int.parse(_otpController.text)));
                        context.read<ForgotPasswordOtpSendBloc>().add(ForgotPasswordOtpSendApiCall());
                        print("Count");
                      },
                    ),
                    5.verticalSpace,
                    (state.errorMessage == "OTP max count reached" ||
                        state.errorMessage == "OTP has expired")
                        ? state.status == ForgotPasswordOtpSendStatus.resendLoading
                        ? SpinKitChasingDots(color: AppColors.primary, size: 50.sp)
                        : TextButton(
                      onPressed: () {
                        context.read<ForgotPasswordOtpSendBloc>().add(ForgotPasswordOtpResendApiCall());
                      },
                      child: Text(
                        'Re-Sent OTP',
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall
                            ?.copyWith(color: AppColors.primary),
                      ),
                    )
                        : const SizedBox()
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
