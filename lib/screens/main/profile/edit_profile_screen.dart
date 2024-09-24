import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nirvar/screens/utils/app_colors.dart';
import 'package:nirvar/screens/widgets/save_changes_button.dart';
import '../../utils/assets_path.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/labeled_text_form_field.dart';

class EditProfileScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _bloodGroupController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _feetController = TextEditingController();
  final TextEditingController _inchesController = TextEditingController();

  EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            // Profile Image
            Positioned(
              top: ScreenUtil().screenHeight * .1.h,
              left: 0,
              right: 0,
              child: Column(
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
                        child: SvgPicture.asset(AssetsPath.cameraSvg,height: 25.h,width: 25.w,),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Profile Card with Form
            Positioned(
              top: ScreenUtil().screenHeight * 0.3.h,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
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
                                'Personal Informations',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
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
                          label: 'Email Address',
                          hint: 'esmailkhalifa010@gmail.com',
                          controller: _emailController,
                          obscureText: false,
                          hasToggle: false,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email address';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16.h),
                        LabeledTextFormField(
                          label: 'Phone Number',
                          hint: '01123456789',
                          controller: _phoneController,
                          obscureText: false,
                          hasToggle: false,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your phone number';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16.h),
                        LabeledTextFormField(
                          label: 'Full Name',
                          hint: 'Esmail Khalifa',
                          controller: _nameController,
                          obscureText: false,
                          hasToggle: false,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your full name';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16.h),
                        LabeledTextFormField(
                          label: 'Blood Group',
                          hint: 'B+',
                          controller: _bloodGroupController,
                          obscureText: false,
                          hasToggle: false,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your blood group';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16.h),
                        LabeledTextFormField(
                          label: 'Weight',
                          hint: '72Kgs',
                          controller: _weightController,
                          obscureText: false,
                          hasToggle: false,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your weight';
                            }
                            return null;
                          },
                        ),

                        SizedBox(height: 16.h),
                        LabeledTextFormField(
                          label: 'Age',
                          hint: ' ',
                          controller: _ageController,
                          obscureText: false,
                          hasToggle: false,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your weight';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16.h),
                        _buildHeightTextFormField(),
                        LabeledTextFormField(
                          label: 'Gender',
                          hint: 'ex. Male,Female',
                          controller: _genderController,
                          obscureText: false,
                          hasToggle: false,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your weight';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 32.h),
                        CustomButton(
                          text: 'Save Changes',
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // Handle form submission
                            }
                          },
                        ),
                        SizedBox(height: ScreenUtil().screenHeight * 0.05.h),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeightTextFormField(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Height',
          style: TextStyle(
            fontSize: 14.sp,
            color: Colors.grey[700],
          ),
          textAlign: TextAlign.start,
        ),
        SizedBox(height: 8.h),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
              flex: 1,
              child: TextFormField(
                controller: _feetController,
                decoration: InputDecoration(
                  hintText: 'Feet',
                  hintStyle: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey[500],
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide(
                      color: Colors.grey.shade300,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide(
                      color: Colors.grey.shade300,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: const BorderSide(
                      color: AppColors.primary,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(width: 8.w),
            Flexible(
              flex: 1,
              child: TextFormField(
                controller: _inchesController,
                decoration: InputDecoration(
                  hintText: 'Inches',
                  hintStyle: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey[500],
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide(
                      color: Colors.grey.shade300,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide(
                      color: Colors.grey.shade300,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: const BorderSide(
                      color: AppColors.primary,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
      ],
    );
  }
}
