import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nirvar/bloc/user_profile_details/user_profile_details_bloc.dart';
import 'package:nirvar/bloc/user_profile_update/user_profile_update_bloc.dart';
import 'package:nirvar/models/user_profile_update/user_profile_update.dart';
import 'package:nirvar/screens/utils/app_colors.dart';
import 'package:nirvar/screens/utils/helper.dart';
import 'package:nirvar/screens/widgets/custom_chasing_dots.dart';
import '../../../injection_container.dart';
import '../../utils/assets_path.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/labeled_text_form_field.dart';

class EditProfileScreen extends StatefulWidget {
  EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();

  File? selectedMedia;
  String? photoUrl;

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _phoneController = TextEditingController();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _bloodGroupController = TextEditingController();

  final TextEditingController _dateOfBirthController = TextEditingController();

  final TextEditingController _weightController = TextEditingController();

  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  final TextEditingController _genderController = TextEditingController();

  final TextEditingController _feetController = TextEditingController();

  final TextEditingController _inchesController = TextEditingController();

  Future<void> _captureAndExtractText(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        selectedMedia = File(pickedFile.path);
      });
    }
  }

  void _showImageSourceDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Choose An Option",
            textAlign: TextAlign.center,
          ),
          content: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context); // Close the dialog
                  _captureAndExtractText(ImageSource.camera); // Choose camera
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.camera_alt, size: 50.sp),
                    SizedBox(height: 4.h),
                    Text(
                      "Camera",
                      style:
                          TextStyle(color: AppColors.primary, fontSize: 20.sp),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context); // Close the dialog
                  _captureAndExtractText(ImageSource.gallery); // Choose camera
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.photo, size: 50.sp),
                    SizedBox(height: 4.h),
                    Text("Gallery",
                        style: TextStyle(
                            color: AppColors.primary, fontSize: 20.sp)),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    context.read<UserProfileDetailsBloc>().add(GetUserProfileDetailsFromApi());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<UserProfileUpdateBloc>()),
      ],
      child: _buildUI(context),
    );
  }

  Widget _buildUI(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: BlocConsumer<UserProfileDetailsBloc, UserProfileDetailsState>(
          listener: (context, state) {
            if (state.status == UserProfileDetailsStatus.success) {
              _nameController.text = state.userProfile.name ?? '';
              _emailController.text = state.userProfile.email ?? '';
              _phoneController.text = state.userProfile.number ?? '';
              _bloodGroupController.text = state.userProfile.bloodGroup ?? '';
              _dateOfBirthController.text = state.userProfile.dateOfBirth ?? '';
              _genderController.text = state.userProfile.gender ?? '';
              _ageController.text = state.userProfile.age.toString();
              _addressController.text = state.userProfile.address ?? '';
              _weightController.text = state.userProfile.weight.toString();

              print("Blood Group ${state.userProfile.bloodGroup}");
              print("Blood Group ${state.userProfile.dateOfBirth}");

              print("User Proifle${state.userProfile}");

              final regExp = RegExp(r'(\d+)\s*[Ff][Tt]\s*(\d+)\s*[Ii][Nn]');

              print('Height string from userProfile: ${state.userProfile.height}');

              final match = regExp.firstMatch(state.userProfile.height.toString() ?? '');

              if (match != null) {
                // Extract feet and inches from the match
                String feet = match.group(1) ?? '';
                String inches = match.group(2) ?? '';

                // Debugging output
                print('Feet: $feet, Inches: $inches');

                _feetController.text = feet;
                _inchesController.text = inches;
              }

              photoUrl = state.userProfile.photo;

            } else if (state.status == UserProfileDetailsStatus.failure) {
              context.flushBarErrorMessage(message: state.errorMessage);
            } else if(state.status == UserProfileDetailsStatus.loading){
              SpinKitChasingDots(color: AppColors.primary, size: 50.sp);
            }
          },
          builder: (context, state) {
            return state.status == UserProfileDetailsStatus.loading
                ? Center(child: CustomChasingDots(size: 50.sp,))
                : Stack(children: [
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
                      Navigator.of(context).pop(true);
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
                          (selectedMedia != null)
                              ? CircleAvatar(
                                  radius: 50.r,
                                  backgroundColor: AppColors.white,
                                  child: Image.file(
                                    selectedMedia!,
                                    width: 60.sp,
                                    height: 60.sp,
                                  ),
                                )
                              : (photoUrl != null)
                                  ? CircleAvatar(
                                      radius: 50.r,
                                      backgroundColor: AppColors.white,
                                      child: Image.network(
                                        photoUrl!,
                                        height: 60.sp,
                                        width: 60.sp,
                                      ),
                                    )
                                  : CircleAvatar(
                                      radius: 50.r,
                                      backgroundColor: AppColors.white,
                                      child: Icon(Icons.person, size: 60.sp),
                                    ),
                          // Positioned Camera Icon Button
                          Positioned(
                            bottom: 2,
                            right: 0,
                            child: InkWell(
                                onTap: _showImageSourceDialog,
                                child: SvgPicture.asset(
                                  AssetsPath.cameraSvg,
                                  height: 25.h,
                                  width: 25.w,
                                )),
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
                            _credentialText('Personal Informations'),
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
                                } // Define a basic email pattern
                                String emailPattern = r'^[^@]+@[^@]+\.[^@]+';
                                // Use RegExp to match the email pattern
                                RegExp regExp = RegExp(emailPattern);
                                if (!regExp.hasMatch(value)) {
                                  return 'Please enter a valid email address';
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
                              readOnly: true,
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
                              hint: ' ',
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
                              hint: 'Kgs',
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
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: LabeledTextFormField(
                                    label: 'Height',
                                    hint: 'FT',
                                    controller: _feetController,
                                    obscureText: false,
                                    hasToggle: false,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Enter you Height in Feet';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                SizedBox(width: 8.w),
                                Flexible(
                                  flex: 1,
                                  child: LabeledTextFormField(
                                    label: '',
                                    hint: 'IN',
                                    controller: _inchesController,
                                    obscureText: false,
                                    hasToggle: false,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Enter you Height in Inches';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 16.h),
                            LabeledTextFormField(
                              label: 'Date Of Birth',
                              hint: '',
                              controller: _dateOfBirthController,
                              obscureText: false,
                              hasToggle: false,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return null;
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 16.h),
                            LabeledTextFormField(
                              label: 'Age',
                              hint: '',
                              controller: _ageController,
                              obscureText: false,
                              hasToggle: false,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return null;
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 16.h),
                            LabeledTextFormField(
                              label: 'Gender',
                              hint: 'ex. Male,Female',
                              controller: _genderController,
                              obscureText: false,
                              hasToggle: false,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your gender';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 16.h),
                            LabeledTextFormField(
                              label: 'Address',
                              hint: ' ',
                              controller: _addressController,
                              obscureText: false,
                              hasToggle: false,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your address';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 32.h),
                            BlocConsumer<UserProfileUpdateBloc,
                                UserProfileUpdateState>(
                              listener: (context, state) {
                                if(state.status == UserProfileUpdateStatus.success){
                                  context.flushBarSuccessMessage(message: state.successMessage);
                                 Future.delayed(const Duration(seconds: 2)).then((_){

                                   if(context.mounted){
                                     Navigator.of(context).pop(true);
                                   }


                                 });
                                }else if(state.status == UserProfileUpdateStatus.failure){
                                  context.flushBarErrorMessage(message: state.errorMessage);
                                }
                              },
                              builder: (context, state) {
                                return state.status ==
                                        UserProfileUpdateStatus.loading
                                    ? SpinKitChasingDots(
                                        color: AppColors.primary, size: 25.sp)
                                    : CustomButton(
                                        text: 'Save Changes',
                                        onPressed: () {
                                          if (_formKey.currentState?.validate() ?? false) {
                                            context
                                                .read<UserProfileUpdateBloc>()
                                                .add(GetUserUpdatedInformation(
                                                userProfile:
                                                UserProfileUpdate(
                                                  name: _nameController.text,
                                                  email: _emailController.text,
                                                  gender: _genderController.text,
                                                  dateOfBirth: _dateOfBirthController.text,
                                                  bloodGroup: _bloodGroupController.text,
                                                  weight: _weightController.text,
                                                  heightFt: _feetController.text,
                                                  heightIn: _inchesController.text,
                                                  address: _addressController.text,
                                                ),
                                              ),
                                            );
                                          }

                                          if(selectedMedia!=null){
                                            context.read<UserProfileUpdateBloc>().add(OnPickedImage(imagePicked: selectedMedia!));
                                            context.read<UserProfileUpdateBloc>().add(UserProfileUpdateApiCall());
                                          }else{
                                            context.flushBarErrorMessage(message: 'Pick An Image');
                                          }

                                        },
                                      );
                              },
                            ),
                            SizedBox(
                                height: ScreenUtil().screenHeight * 0.05.h),
                          ],
                        ),
                      ),
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

  Widget _credentialText(String information) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: AppColors.primary, width: 2.h),
            )),
        child: Text(
          information,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
