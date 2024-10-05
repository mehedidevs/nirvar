import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nirvar/bloc/password_change/password_change_bloc.dart';
import 'package:nirvar/screens/utils/app_colors.dart';
import 'package:nirvar/screens/utils/helper.dart';
import 'package:nirvar/screens/widgets/labeled_text_form_field.dart';
import '../../../injection_container.dart';
import '../../../repository/authentication/auth_repository.dart';
import '../../utils/assets_path.dart';
import '../../widgets/custom_button.dart';
import '../main_screen.dart';

class AccountSettingsScreen extends StatefulWidget {
  @override
  State<AccountSettingsScreen> createState() => _AccountSettingsScreenState();
}

class _AccountSettingsScreenState extends State<AccountSettingsScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _isCurrentPasswordObscured = true;
  bool _isNewPasswordObscured = true;
  bool _isConfirmPasswordObscured = true;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<PasswordChangeBloc>()),
      ],
      child: _buildUI(context),
    );
  }

  Widget _buildUI(context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Background
            Container(
              height: ScreenUtil().screenHeight,
              color: AppColors.primary,
            ),
            // Top Right Decorative SVG
            Positioned(
              top: 0,
              right: 0,
              child: SvgPicture.asset(AssetsPath.profileDesignSvg),
            ),
            // Custom App Bar (Settings Title and Icons)
            Positioned(
              top: 20.h,
              left: 16.w,
              child: IconButton(
                icon: SvgPicture.asset(AssetsPath.backArrowSvg),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            Positioned(
              top: 20.h,
              right: 16.w,
              child: IconButton(
                icon: SvgPicture.asset(AssetsPath.notificationWithBadgeSvg),
                onPressed: () {
                  // Handle notification click
                },
              ),
            ),
            Positioned(
              top: 25.h,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  'Settings',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            // Profile Image Need to Implement Profile API
            Positioned(
              top: ScreenUtil().screenHeight * .1.h,
              left: 0,
              right: 0,
              child: _getUserProfilePicture(),
            ),
            // Profile Card with Form Change Password API

            BlocConsumer<PasswordChangeBloc, PasswordChangeState>(
              listener: (context, state) {
                if (state.status == PasswordChangeStatus.success) {
                  context.flushBarSuccessMessage(message: state.successMessage);
                  clearController();
                  Future.delayed(const Duration(seconds: 2), () {
                    if (context.mounted) {
                      //not worked
                     // Navigator.of(context, rootNavigator: true).pop();

                      //Alternative
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => MainScreen()));
                      print('Worked');
                    }
                  });
                } else if (state.status == PasswordChangeStatus.failure) {
                  context.flushBarErrorMessage(message: state.errorMessage);
                }
              },
              builder: (context, state) {
                return Positioned(
                  top: ScreenUtil().screenHeight * 0.3.h,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.r),
                        topRight: Radius.circular(40.r),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Center(
                              child: Column(
                                children: [
                                  Text(
                                    'Change Password',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 1.h),
                                  Container(
                                    width: 150.w,
                                    child: Divider(
                                      color: AppColors.primary,
                                      thickness: 2.h,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 16.h),
                            LabeledTextFormField(
                              label: 'Current Password',
                              hint: '********',
                              controller: _currentPasswordController,
                              obscureText: _isCurrentPasswordObscured,
                              hasToggle: true,
                              onVisibilityToggle: () {
                                setState(() {
                                  _isCurrentPasswordObscured =
                                      !_isCurrentPasswordObscured;
                                });
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your current password';
                                } else if (value.length < 6) {
                                  return 'Password must be at least 6 characters';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 16.h),
                            LabeledTextFormField(
                              label: 'New Password',
                              hint: '********',
                              controller: _newPasswordController,
                              obscureText: _isNewPasswordObscured,
                              hasToggle: true,
                              onVisibilityToggle: () {
                                setState(() {
                                  _isNewPasswordObscured =
                                      !_isNewPasswordObscured;
                                });
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a new password';
                                } else if (value.length < 6) {
                                  return 'Password must be at least 6 characters';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 16.h),
                            LabeledTextFormField(
                              label: 'Confirm New Password',
                              hint: '********',
                              controller: _confirmPasswordController,
                              obscureText: _isConfirmPasswordObscured,
                              hasToggle: true,
                              onVisibilityToggle: () {
                                setState(() {
                                  _isConfirmPasswordObscured =
                                      !_isConfirmPasswordObscured;
                                });
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please confirm your new password';
                                } else if (value !=
                                    _newPasswordController.text) {
                                  return 'Passwords do not match';
                                } else if (value.length < 6) {
                                  return 'Password must be at least 6 characters';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 32.h),
                            state.status == PasswordChangeStatus.loading
                                ? SpinKitChasingDots(
                                    color: AppColors.primary, size: 25.sp)
                                : CustomButton(
                                    text: 'Save Changes',
                                    onPressed: () {
                                      if (_formKey.currentState?.validate() ??
                                          false) {
                                        context.read<PasswordChangeBloc>().add(
                                            GetOldPassword(
                                                oldPassword:
                                                    _currentPasswordController
                                                        .text));
                                        context.read<PasswordChangeBloc>().add(
                                            GetNewPassword(
                                                newPassword:
                                                    _confirmPasswordController
                                                        .text));
                                        context
                                            .read<PasswordChangeBloc>()
                                            .add(PasswordChangeApiCall());
                                      }
                                    },
                                  ),
                            SizedBox(
                                height: ScreenUtil().screenHeight * 0.05.h),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _getUserProfilePicture() {

    final authRepository = sl<AuthRepository>();
    return FutureBuilder(
      future: authRepository.getUserProfile(),
      builder: (context,snapshot){
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: SpinKitChasingDots(
              color: AppColors.primary, size: 50.sp)); // Show a loading indicator while waiting for data
        }

        if (!snapshot.hasData) {
          return Column(
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 50.r,
                    backgroundColor: AppColors.white,
                    child: Icon(Icons.person, size: 60.sp),
                  ),
                  // Positioned Camera Icon Button
                  Positioned(
                    bottom: 2,
                    right: 0,
                    child: SvgPicture.asset(
                      AssetsPath.cameraSvg,
                      height: 25.h,
                      width: 25.w,
                    ),
                  ),
                ],
              ),
            ],
          );
        }


        return snapshot.data!.fold((error){
          return Column(
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 50.r,
                    backgroundColor: AppColors.white,
                    child: Icon(Icons.person, size: 60.sp),
                  ),
                  // Positioned Camera Icon Button
                  Positioned(
                    bottom: 2,
                    right: 0,
                    child: SvgPicture.asset(
                      AssetsPath.cameraSvg,
                      height: 25.h,
                      width: 25.w,
                    ),
                  ),
                ],
              ),
            ],
          );
        }, (success){
          if(success.photo == null || success.photo!.isEmpty){
            return Column(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 50.r,
                      backgroundColor: AppColors.white,
                      child: Icon(Icons.person, size: 60.sp),
                    ),
                    // Positioned Camera Icon Button
                    Positioned(
                      bottom: 2,
                      right: 0,
                      child: SvgPicture.asset(
                        AssetsPath.cameraSvg,
                        height: 25.h,
                        width: 25.w,
                      ),
                    ),
                  ],
                ),
              ],
            );
          }else{
            return Column(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 50.r,
                      backgroundColor: AppColors.white,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50.r),
                          child: Image.network(success.photo ?? "",fit: BoxFit.cover)),
                    ),
                    // Positioned Camera Icon Button
                    Positioned(
                      bottom: 2,
                      right: 0,
                      child: SvgPicture.asset(
                        AssetsPath.cameraSvg,
                        height: 25.h,
                        width: 25.w,
                      ),
                    ),
                  ],
                ),
              ],
            );
          }
        });
      },);

  }

  @override
  void dispose() {
    super.dispose();
    _confirmPasswordController.dispose();
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
  }

  void clearController() {
    _confirmPasswordController.clear();
    _currentPasswordController.clear();
    _newPasswordController.clear();
  }
}
