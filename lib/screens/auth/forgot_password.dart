import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nirvar/bloc/forgot_password/forgot_password_bloc.dart';
import 'package:nirvar/screens/auth/forgot_password_otp_screen.dart';
import 'package:nirvar/screens/auth/sign_up_screen.dart';
import 'package:nirvar/screens/utils/assets_path.dart';
import 'package:nirvar/screens/utils/helper.dart';
import 'package:nirvar/screens/widgets/welcome_screen.dart';

import '../../injection_container.dart';
import '../utils/app_colors.dart';
import '../widgets/clickable_text.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textInput.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  void dispose() {
    _phoneNumberController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ForgotPasswordBloc>(),
      child: buildUI(context),
    );
  }

  Widget buildUI(BuildContext context) {
    return WelcomeScreen(
      logoPath: AssetsPath.appLogoSvg,
      welcomeText: 'Forget Password',
      descriptionText:
          'Reduce redundancy and improve your healthcare experience',
      children: [
        BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
          listener: (context, state) {
            if (state.status == ForgotPasswordStatus.success) {
              _phoneNumberController.clear();
              Future.delayed(const Duration(seconds: 2), () {
                if(context.mounted){
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ForgotPasswordOtpScreen(phoneNumber: state.phoneNumber.toString())),
                  );
                }
              });
            } else if (state.status == ForgotPasswordStatus.error) {
              context.flushBarErrorMessage(message: state.errorMessage);
            }
          },
          buildWhen: (previousState, currentState) => currentState.status != previousState.status,
          builder: (context, state) {
            return Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomTextField(
                    hint: 'Phone number',
                    keyboardType: TextInputType.phone,
                    prefixIcon: SvgPicture.asset(
                      AssetsPath.phoneSvg,
                      fit: BoxFit.scaleDown,
                    ),
                    controller: _phoneNumberController,
                    validator: _phoneNumberValidation,
                  ),
                  20.verticalSpace,
                  state.status == ForgotPasswordStatus.loading
                      ? SpinKitChasingDots(
                          color: AppColors.primary, size: 25.sp)
                      : CustomButton(
                          text: 'Send OTP',
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              FocusManager.instance.primaryFocus?.unfocus();
                              context.read<ForgotPasswordBloc>().add(ForgotPasswordMobileNumberChanged(
                                  phoneNumber: _phoneNumberController.text.trim()));
                              context.read<ForgotPasswordBloc>().add(ForgotPasswordApiCall());
                            }
                          },
                        ),
                ],
              ),
            );
          },
        ),
        20.verticalSpace,
        _goToSignUpScreen(context),
        20.verticalSpace,
      ],
    );
  }

  String? _phoneNumberValidation(value) {
            if (value == null || value.isEmpty) {
              return 'Phone Number is Required';
            } else if (value.length < 11) {
              return 'Phone number must be 11 digits';
            } else if (!RegExp(r'^01\d{9}$').hasMatch(value)) {
              return 'Phone number must start with 01 and be 11 digits long';
            }
            return null;
          }

  Widget _goToSignUpScreen(context) {
    return Center(
      child: ClickableText(
        regularText: 'Don’t have an account?',
        clickableText: 'Sign Up',
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const SignUpScreen()));
        },
      ),
    );
  }
}
