import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nirvar/bloc/sign_up/signup_bloc.dart';
import 'package:nirvar/screens/auth/otp_screen.dart';
import 'package:nirvar/screens/auth/sign_in_screen.dart';
import 'package:nirvar/screens/utils/helper.dart';
import 'package:nirvar/screens/widgets/clickable_text.dart';
import 'package:nirvar/screens/widgets/custom_button.dart';
import 'package:nirvar/screens/widgets/custom_textInput.dart';

import '../../injection_container.dart';
import '../utils/app_colors.dart';
import '../utils/assets_path.dart';
import '../widgets/welcome_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  initState() {
    super.initState();
  }

  @override
  void dispose() {
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<SignUpBloc>(),
      child: _buildUI(context),
    );
  }

  Widget _buildUI(BuildContext context) {
    return WelcomeScreen(
      logoPath: AssetsPath.appLogoSvg,
      welcomeText: 'Connect to Wellness',
      descriptionText:
          'Reduce redundancy and improve your healthcare experience',
      children: [
        BlocConsumer<SignUpBloc, SignUpState>(
          listener: (context, state) {
            if (state.status == SignUpStatus.success) {
              context.flushBarSuccessMessage(message: "OTP Send Successfully.Expires in 3 minutes");
              Future.delayed(const Duration(seconds: 2), () {
               if(context.mounted){
                 Navigator.pushReplacement(
                   context,
                   MaterialPageRoute(builder: (context) => OtpScreen(phoneNumber: state.phoneNumber.toString())),
                 );
               }
              });
            } else if (state.status == SignUpStatus.failure) {
              context.flushBarErrorMessage(message: state.errorMessage);
            }
          },
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Phone Number is Required';
                      } else if (value.length < 11) {
                        return 'Phone number must be 11 digits';
                      }
                      return null;
                    },
                  ),
                  20.verticalSpace,
                  state.status == SignUpStatus.loading
                      ? SpinKitChasingDots(
                          color: AppColors.primary, size: 25.sp)
                      : CustomButton(
                          text: 'Get Started',
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              FocusManager.instance.primaryFocus?.unfocus();
                              context.read<SignUpBloc>().add(
                                  SignUpMobileNumberChanged(
                                      phoneNumber:  _phoneNumberController.text.trim()));
                              context.read<SignUpBloc>().add(SignUpApiCall());
                            }
                          },
                        )
                ],
              ),
            );
          },
        ),
        20.verticalSpace,
        _goToSignInScreen(context),
        20.verticalSpace
      ],
    );
  }

  Center _goToSignInScreen(BuildContext context) {
    return Center(
      child: ClickableText(
        regularText: 'Don’t have an account?',
        clickableText: 'SIGN IN',
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const SignInScreen()));
        },
      ),
    );
  }
}
