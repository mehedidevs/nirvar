import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nirvar/repository/blood_pressure/blood_pressure_repository.dart';
import 'package:nirvar/screens/utils/app_colors.dart';
import 'package:nirvar/screens/utils/assets_path.dart';
import 'package:nirvar/screens/utils/helper.dart';
import 'package:nirvar/screens/widgets/custom_app_bar.dart';
import 'package:nirvar/screens/widgets/custom_button.dart';
import 'package:nirvar/screens/widgets/custom_textInput.dart';

import '../../../../../injection_container.dart';

class BloodPressureInput extends StatefulWidget {
  const BloodPressureInput({super.key});

  @override
  State<BloodPressureInput> createState() => _BloodPressureInputState();
}

class _BloodPressureInputState extends State<BloodPressureInput> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _systolicController = TextEditingController();
  final TextEditingController _diastolicController = TextEditingController();
  final BloodPressureRepository _repository = sl<BloodPressureRepository>();

  @override
  void dispose() {
    _systolicController.dispose();
    _diastolicController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const CustomAppBar(title: 'Daily Input'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8.h),
                  Center(
                    child: FittedBox(
                      child: Image.asset(
                        AssetsPath.bloodPressurePng,
                        height: 250.h,
                        width: 250.w,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Enter Your Today’s Blood Pressure',
                    style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'Systolic',
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 8.h),
                  CustomTextField(
                    hint: 'Ex. 140',
                    keyboardType: TextInputType.number,
                    controller: _systolicController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Systolic is Required';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    'Diastolic',
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 8.h),
                  CustomTextField(
                    hint: 'Ex. 140',
                    keyboardType: TextInputType.number,
                    controller: _diastolicController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Diastolic is Required';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 32.h),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 0.h),
                    child: CustomButton(
                      text: 'Submit',
                      onPressed: () async {
                        if (_formKey.currentState?.validate() ?? false) {
                          final response = await _repository.storeBloodPressure(
                              int.parse(_systolicController.text),
                              int.parse(_diastolicController.text),
                          );

                          response.fold((failure){
                            context.flushBarErrorMessage(message: failure.message);
                          }, (success){
                            _systolicController.clear();
                            _diastolicController.clear();
                            context.flushBarSuccessMessage(message: success);
                          },);
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
