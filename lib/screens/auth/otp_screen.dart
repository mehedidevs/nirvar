import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nirvar/bloc/register_otp_send/register_otp_send_bloc.dart';
import 'package:nirvar/screens/auth/register_user_credentials_screen.dart';
import 'package:nirvar/screens/utils/app_colors.dart';
import 'package:nirvar/screens/utils/assets_path.dart';
import 'package:nirvar/screens/utils/helper.dart';
import 'package:nirvar/screens/widgets/custom_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../injection_container.dart';
import '../widgets/disabled_button.dart';

class OtpScreen extends StatefulWidget {
  final String phoneNumber;

  const OtpScreen({super.key, required this.phoneNumber});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _otpController = TextEditingController();
  String currentText = "";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<RegisterOtpSendBloc>(),
      child: _buildUI(context),
    );
  }

  Scaffold _buildUI(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 24.w),
          child: BlocConsumer<RegisterOtpSendBloc, RegisterOtpSendState>(
            listener: (context, state) {
              if (state.status == RegisterOtpSendStatus.success) {
                context.flushBarSuccessMessage(message: state.successMessage);
                Future.delayed(const Duration(seconds: 2), () {
                  if (context.mounted) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterUserCredentialsScreen()));
                  }
                });
              } else if (state.status == RegisterOtpSendStatus.failure) {
                _otpController.clear();
                context.flushBarErrorMessage(message: state.errorMessage);
              } else if (state.status ==
                  RegisterOtpSendStatus.resendOtpSuccess) {
                context.flushBarSuccessMessage(message: state.successMessage);
              } else if (state.status ==
                  RegisterOtpSendStatus.resendOtpFailure) {
                context.flushBarErrorMessage(message: state.errorMessage);
              }
            },
            buildWhen: (previous, current) => current.status != previous.status,
            builder: (context, state) {
              return Form(
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
                            AssetsPath
                                .verificationSvg, // Use logoPath parameter
                            width: 150.h,
                            height: 150.h,
                            fit: BoxFit.cover,
                          ),
                          20.verticalSpace,
                          Text('Enter OTP',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600)),
                          10.verticalSpace,
                          Text(
                            'Enter 4-digit OTP sent to (+88${widget.phoneNumber})',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w400),
                          ),
                          20.verticalSpace,
                          PinCodeTextField(
                            appContext: context,
                            length: 4,
                            controller: _otpController,
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
                            animationDuration:
                                const Duration(milliseconds: 300),
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
                              : (state.status == RegisterOtpSendStatus.loading)
                                  ? SpinKitChasingDots(
                                      color: AppColors.primary, size: 25.sp)
                                  : CustomButton(
                                      text: 'Verify',
                                      onPressed: () {
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                        context.read<RegisterOtpSendBloc>().add(GetOTP(otp: int.parse(_otpController.text)));
                                        context.read<RegisterOtpSendBloc>().add(RegisterOtpSendApiCall());
                                      },
                                    ),
                          5.verticalSpace,
                          (state.errorMessage == "OTP max count reached" ||
                                  state.errorMessage == "OTP has expired")
                              ? state.status == RegisterOtpSendStatus.resendOtpLoading
                              ? SpinKitChasingDots(color: AppColors.primary, size: 50.sp)
                              : TextButton(
                                  onPressed: () {
                                    context
                                        .read<RegisterOtpSendBloc>()
                                        .add(RegisterOtpResendApiCall());
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
