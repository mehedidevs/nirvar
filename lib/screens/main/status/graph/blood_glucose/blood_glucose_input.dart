import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nirvar/app.dart';
import 'package:nirvar/bloc/glucose_average_last_seven_days/glucose_average_last_seven_days_bloc.dart';
import 'package:nirvar/repository/diabetes/diabetes_repository.dart';
import 'package:nirvar/routes/navigation_helper.dart';
import 'package:nirvar/screens/utils/helper.dart';
import 'package:nirvar/screens/widgets/custom_chasing_dots.dart';

import '../../../../../injection_container.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/assets_path.dart';
import '../../../../widgets/custom_app_bar.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_textInput.dart';

class BloodGlucoseInput extends StatefulWidget {
  const BloodGlucoseInput({super.key});

  @override
  State<BloodGlucoseInput> createState() => _BloodGlucoseInputState();
}

class _BloodGlucoseInputState extends State<BloodGlucoseInput> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _bloodGlucoseController = TextEditingController();
  final DiabetesRepository _repository = sl<DiabetesRepository>();
  bool _isLoading = false;

  @override
  void dispose() {
    _bloodGlucoseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, dynamic result) {
        if(!didPop){
          context.pop(true);
        }
      },
      child: Scaffold(
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
                          AssetsPath.bloodTransfusionPng,
                          height: 150.h,
                          width: 250.w,
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Enter Your Today’s Glucose Points',
                      style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'Points',
                      style:
                          TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 8.h),
                    CustomTextField(
                      hint: 'Ex. 5.5',
                      keyboardType: TextInputType.number,
                      controller: _bloodGlucoseController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Glucose Point is Required';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 32.h),

                    _isLoading ? const CustomChasingDots()
                        :Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.w, vertical: 0.h),
                      child: CustomButton(
                        text: 'Submit',
                        onPressed: () async {
                          if (_formKey.currentState?.validate() ?? false) {

                            FocusManager.instance.primaryFocus?.unfocus();

                            setState(() {
                              _isLoading = true;
                            });

                            final response = await _repository.storeDiabetes(
                                double.parse(_bloodGlucoseController.text));
                            response.fold(
                              (failure) {
                                setState(() {
                                  _isLoading = false;
                                });
                                context.flushBarErrorMessage(
                                    message: failure.message);

                              },
                              (success) {
                                _bloodGlucoseController.clear();
                                setState(() {
                                  _isLoading = false;
                                });
                                context.read<GlucoseAverageLastSevenDaysBloc>().add(RefreshGlucoseAverageLastSevenDays());
                                context.flushBarSuccessMessage(message: success);
                              },
                            );
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
      ),
    );
  }
}
