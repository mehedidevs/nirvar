import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nirvar/bloc/forgot_password_reset/forgot_password_reset_bloc.dart';
import 'package:nirvar/screens/auth/sign_in_screen.dart';
import 'package:nirvar/screens/auth/sign_up_screen.dart';
import 'package:nirvar/screens/utils/assets_path.dart';
import 'package:nirvar/screens/utils/helper.dart';
import 'package:nirvar/screens/widgets/welcome_screen.dart';

import '../../injection_container.dart';
import '../utils/app_colors.dart';
import '../widgets/clickable_text.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textInput.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _isObscuredPassword = true;
  bool _isObscuredConfirmPassword = true;
  String? password;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ForgotPasswordResetBloc>(),
      child: _buildUI(context),
    );
  }

  Widget _buildUI(BuildContext context) {
    return WelcomeScreen(
      logoPath: AssetsPath.appLogoSvg,
      welcomeText: 'Change Password',
      descriptionText: 'Enter your new password',
      children: [
        BlocConsumer<ForgotPasswordResetBloc, ForgotPasswordResetState>(
          listener: (context, state) {
            if (state.status == ForgotPasswordResetStatus.success) {
              _passwordController.clear();
              _confirmPasswordController.clear();
              context.flushBarSuccessMessage(message: state.successMessage);
              Future.delayed(const Duration(seconds: 2), () {
                if(context.mounted){
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const SignInScreen()));
                }
              });
            } else if (state.status == ForgotPasswordResetStatus.failure) {
              context.flushBarErrorMessage(message: state.errorMessage);
            }
          },
          buildWhen: (previous, current) => current.status != previous.status,
          builder: (context, state) {
            return Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomTextField(
                    hint: 'Enter new password',
                    prefixIcon: SvgPicture.asset(
                      AssetsPath.lockSvg,
                      fit: BoxFit.scaleDown,
                    ),
                    obscureText: _isObscuredPassword,
                    obscureVisible: () {
                      setState(() {
                        _isObscuredPassword = !_isObscuredPassword;
                      });
                    },
                    controller: _passwordController,
                    onChanged: (value) {
                      password = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is required';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                  10.verticalSpace,
                  CustomTextField(
                    hint: 'Confirm new password',
                    prefixIcon: SvgPicture.asset(
                      AssetsPath.lockSvg,
                      fit: BoxFit.scaleDown,
                    ),
                    obscureText: _isObscuredConfirmPassword,
                    obscureVisible: () {
                      setState(() {
                        _isObscuredConfirmPassword =
                            !_isObscuredConfirmPassword;
                      });
                    },
                    controller: _confirmPasswordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is required';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }else if (value != password) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                  10.verticalSpace,
                  state.status == ForgotPasswordResetStatus.loading
                      ? SpinKitChasingDots(color: AppColors.primary, size: 25.sp)
                      : CustomButton(text: 'Submit', onPressed: () {
                        if(_formKey.currentState!.validate()){
                          context.read<ForgotPasswordResetBloc>().add(ConfirmedNewPassword(newPassword: _confirmPasswordController.text.trim()));
                          context.read<ForgotPasswordResetBloc>().add(ForgotPasswordResetApiCall());
                        }
                  },),
                ],
              ),
            );
          },
        ),
        const Spacer(),
        _goToSignUpScreen(context),
        20.verticalSpace
      ],
    );
  }

  Center _goToSignUpScreen(BuildContext context) {
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
