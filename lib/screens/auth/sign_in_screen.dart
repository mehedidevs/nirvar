import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nirvar/bloc/login/login_bloc.dart';
import 'package:nirvar/routes/navigation_helper.dart';
import 'package:nirvar/routes/routes_name.dart';
import 'package:nirvar/screens/auth/register_user_credentials_screen.dart';
import 'package:nirvar/screens/auth/sign_up_screen.dart';
import 'package:nirvar/screens/notification/components/notification_list_view.dart';
import 'package:nirvar/screens/utils/assets_path.dart';
import 'package:nirvar/screens/utils/helper.dart';
import 'package:nirvar/screens/widgets/custom_chasing_dots.dart';
import 'package:nirvar/screens/widgets/welcome_screen.dart';

import '../../injection_container.dart';
import '../main/main_screen.dart';
import '../utils/app_colors.dart';
import '../widgets/clickable_text.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textInput.dart';
import '../widgets/privacy_policy_text.dart';
import 'forgot_password.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isObscured = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _phoneNumberController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void clear(){
    _phoneNumberController.clear();
    _passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<LoginBloc>(),
      child: _buildUI(context),
    );
  }

  Widget _buildUI(BuildContext context) {
    return WelcomeScreen(
      logoPath: AssetsPath.appLogoSvg,
      welcomeText: 'Welcome!',
      descriptionText:
          'Reduce redundancy and improve your healthcare experience',
      children: [
        BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state.status == LoginStatus.success) {
              clear();
              context.flushBarSuccessMessage(message: "Login successful");
              Future.delayed(const Duration(seconds: 2), () {
                if(context.mounted){
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (context) => const MainScreen()),(route) => false);
                }
              });
            } else if (state.status == LoginStatus.failure) {
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
                  10.verticalSpace,
                  CustomTextField(
                    hint: 'Password',
                    prefixIcon: SvgPicture.asset(
                      AssetsPath.lockSvg,
                      fit: BoxFit.scaleDown,
                    ),
                    suffixIcon: SvgPicture.asset(
                      AssetsPath.previewSvg,
                      fit: BoxFit.scaleDown,
                    ),
                    obscureText: _isObscured,
                    obscureVisible: () {
                      setState(() {
                        _isObscured = !_isObscured;
                      });
                    },
                    controller: _passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is required';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                  5.verticalSpace,
                  ForgotPasswordWidget(),
                  5.verticalSpace,
                  state.status == LoginStatus.loading
                      ? CustomChasingDots()
                      : CustomButton(
                          text: 'SIGN IN',
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              FocusManager.instance.primaryFocus?.unfocus();
                              context.read<LoginBloc>().add(LoginMobileNumberChanged(phoneNumber:  _phoneNumberController.text.trim()));
                              context.read<LoginBloc>().add(LoginPasswordChanged(password: _passwordController.text.trim()));
                              context.read<LoginBloc>().add(LoginApiCall());
                            }
                          },
                        )
                ],
              ),
            );
          },
        ),
        20.verticalSpace,
        _goToSignUp(context),
        Spacer(),
        PrivacyPolicyText(),
        20.verticalSpace,
      ],
    );
  }

  Widget _goToSignUp(context) {
    return Center(
      child: ClickableText(
        regularText: 'Don’t have an account?',
        clickableText: ' SIGN UP',
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SignUpScreen()));
        },
      ),
    );
  }

}

class ForgotPasswordWidget extends StatelessWidget {
  const ForgotPasswordWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ForgotPassword(),
              ),
            );
          },
          child: Text(
            'Forgot Password?',
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: AppColors.black),
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}
