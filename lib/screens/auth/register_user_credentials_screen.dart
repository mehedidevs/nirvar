import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:nirvar/bloc/register_user_credentials/register_user_credentials_bloc.dart';
import 'package:nirvar/models/user_credentials/user_credentials.dart';
import 'package:nirvar/screens/main/main_screen.dart';
import 'package:nirvar/screens/utils/helper.dart';
import 'package:nirvar/screens/utils/validation_utils.dart';

import '../../data/preference/user_id_storage.dart';
import '../../injection_container.dart';
import '../utils/app_colors.dart';
import '../widgets/custom_button.dart';
import '../widgets/labeled_dropdown.dart';
import '../widgets/labeled_text_form_field.dart';

class RegisterUserCredentialsScreen extends StatefulWidget {
  const RegisterUserCredentialsScreen({super.key});

  @override
  State<RegisterUserCredentialsScreen> createState() =>
      _RegisterUserCredentialsScreenState();
}

class _RegisterUserCredentialsScreenState
    extends State<RegisterUserCredentialsScreen> {
  final _formKey = GlobalKey<FormState>();

  final UserIdStorage userIdStorage = sl<UserIdStorage>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final TextEditingController _dateOfBirthController = TextEditingController();

  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  final TextEditingController _feetController = TextEditingController();
  final TextEditingController _inchesController = TextEditingController();

  bool _isNewPasswordObscured = true;
  bool _isConfirmPasswordObscured = true;

  String? _selectedGender;
  String? _selectedBloodGroup;

  bool _isChecked = false;

  void _toggleCheckbox() {
    setState(() {
      _isChecked = !_isChecked;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _confirmPasswordController.dispose();
    _newPasswordController.dispose();
    _weightController.dispose();
    _addressController.dispose();
    _feetController.dispose();
    _inchesController.dispose();
    _dateOfBirthController.dispose();
  }

  void clearAllFields() {
    _nameController.clear();
    _emailController.clear();
    _newPasswordController.clear();
    _confirmPasswordController.clear();
    _dateOfBirthController.clear();
    _weightController.clear();
    _addressController.clear();
    _feetController.clear();
    _inchesController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<RegisterUseCredentialsBloc>(),
      child: _buildUI(context),
    );
  }

  Widget _buildUI(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: SingleChildScrollView(
            child: BlocConsumer<RegisterUseCredentialsBloc,
                RegisterUserCredentialsState>(
              listener: (context, state) {
                if (state.status == RegisterUserCredentialsStatus.success) {
                  context.flushBarSuccessMessage(message: state.successMessage);
                  clearAllFields();
                  Future.delayed(const Duration(seconds: 2), () {
                    if (context.mounted) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MainScreen()));
                    }
                  });
                } else if (state.status ==
                    RegisterUserCredentialsStatus.failure) {
                  context.flushBarErrorMessage(message: state.errorMessage);
                }
              },
              builder: (context, state) {
                return Form(
                  key: _formKey,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 0, horizontal: 24.w),
                    child: Column(
                      children: [
                        _credentialText(),
                        SizedBox(height: 16.h),
                        LabeledTextFormField(
                          label: 'Name*',
                          hint: 'Esmail khalifa',
                          controller: _nameController,
                          obscureText: false,
                          hasToggle: false,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your Name';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 8.h),
                        LabeledTextFormField(
                          label: 'Email Address',
                          hint: 'esmailkhalifa010@gmail.com',
                          controller: _emailController,
                          obscureText: false,
                          hasToggle: false,
                          validator: (value) => ValidationUtils.optionalEmailValidation(value),
                        ),
                        SizedBox(height: 8.h),
                        LabeledTextFormField(
                          label: 'Password*',
                          hint: '********',
                          controller: _newPasswordController,
                          obscureText: _isNewPasswordObscured,
                          hasToggle: true,
                          onVisibilityToggle: () {
                            setState(() {
                              _isNewPasswordObscured = !_isNewPasswordObscured;
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a password';
                            } else if (value.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 8.h),
                        LabeledTextFormField(
                          label: 'Confirm Password*',
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
                              return 'Please confirm your password';
                            } else if (value != _newPasswordController.text) {
                              return 'Passwords do not match';
                            } else if (value.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                        ),
                        _generalInformationText(),
                        LabeledDropdown(
                          label: 'Gender*',
                          hint: 'ex. Male, Female',
                          value: _selectedGender,
                          items: genders,
                          onChanged: (value) {
                            _selectedGender = value;
                          },
                          validator: (value) =>
                              ValidationUtils.validateRequiredField(value,
                                  fieldName: 'gender'),
                        ),
                        SizedBox(height: 8.h),
                        LabeledTextFormField(
                          label: 'Date of Birth*',
                          hint: '2000-01-31',
                          readOnly: true,
                          controller: _dateOfBirthController,
                          obscureText: false,
                          hasToggle: false,
                          suffixIcon: IconButton(
                            icon: Icon(Icons.calendar_today,
                                color: AppColors.primary),
                            onPressed: () async {
                              final selectedDate = await pickDate(context);
                              if (!selectedDate.contains('No Date Is Found')) {
                                _dateOfBirthController.text = selectedDate;
                              }
                            },
                          ),
                          validator: (value) =>
                              ValidationUtils.validateRequiredField(value,
                                  fieldName: 'Date Of Birth'),
                        ),
                        SizedBox(height: 8.h),
                        LabeledDropdown(
                          label: 'Blood Group*',
                          hint: 'A+',
                          value: _selectedBloodGroup,
                          items: bloodGroups,
                          onChanged: (value) {
                            _selectedBloodGroup = value;
                          },
                          validator: (value) => ValidationUtils.validateRequiredField(value, fieldName: 'blood group'),
                        ),
                        SizedBox(height: 8.h),
                        LabeledTextFormField(
                          label: 'Weight',
                          hint: '72Kgs',
                          controller: _weightController,
                          keyboardType: TextInputType.number,
                          obscureText: false,
                          hasToggle: false,
                          validator: (value) => ValidationUtils.optionalWeightValidation(value),
                        ),
                        SizedBox(height: 8.h),
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
                                validator: (value) => ValidationUtils.optionalHeightInchesValidation(value),
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
                                validator: (value) => ValidationUtils.optionalHeightInchesValidation(value),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        LabeledTextFormField(
                          label: 'Address',
                          hint: 'ex. House-442, Road-15, Bashundhara R/A',
                          controller: _addressController,
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
                        Row(
                          children: [
                            Flexible(
                              flex: 1,
                              child: Checkbox(
                                value: _isChecked,
                                onChanged: (_) => _toggleCheckbox(),
                                activeColor: AppColors.primary,
                              ),
                            ),
                            Flexible(
                              flex: 2,
                              child: GestureDetector(
                                onTap: _toggleCheckbox,
                                child: Text(
                                  'Accept Terms of Service and Data Policy.',
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primary,
                                  ),
                                  maxLines: 2,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 32.h),
                        (state.status == RegisterUserCredentialsStatus.loading)
                            ? SpinKitChasingDots(
                                color: AppColors.primary, size: 25.sp)
                            : CustomButton(
                                text: 'Verify',
                                onPressed: () async {
                                  FocusManager.instance.primaryFocus?.unfocus();

                                  if (_formKey.currentState?.validate() ??
                                      false) {
                                    int? userId =
                                        await userIdStorage.getUserID();
                                    if (userId == null) {
                                      if (context.mounted) {
                                        context.flushBarErrorMessage(
                                            message: 'User ID is missing');
                                      }
                                    }

                                    if (userId != null) {
                                      if (context.mounted &&
                                          _isChecked == true) {
                                        context
                                            .read<RegisterUseCredentialsBloc>()
                                            .add(
                                              GetUserCredentials(
                                                credentials: UserCredentials(
                                                  userId: userId,
                                                  name: _nameController.text,
                                                  gender: _selectedGender ?? '',
                                                  dateOfBirth:
                                                      _dateOfBirthController
                                                          .text,
                                                  bloodGroup:
                                                      _selectedBloodGroup ?? '',
                                                  heightIn:
                                                      _inchesController.text,
                                                  heightFt:
                                                      _feetController.text,
                                                  address:
                                                      _addressController.text,
                                                  weight:
                                                      _weightController.text,
                                                  email: _emailController.text,
                                                  password:
                                                      _confirmPasswordController
                                                          .text,
                                                ),
                                              ),
                                            );
                                        context
                                            .read<RegisterUseCredentialsBloc>()
                                            .add(
                                                RegisterUserCredentialsApiCall());
                                      } else if (context.mounted &&
                                          _isChecked == false) {
                                        context.flushBarErrorMessage(
                                            message:
                                                'Accept Terms and Conditions');
                                      }
                                    }
                                  }
                                },
                              ),
                        SizedBox(height: 16.h),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _generalInformationText() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
              border: Border(
            bottom: BorderSide(color: AppColors.primary, width: 2.h),
          )),
          child: Text(
            'General Information',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _credentialText() {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            border: Border(
          bottom: BorderSide(color: AppColors.primary, width: 2.h),
        )),
        child: Text(
          'Credential Information',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
