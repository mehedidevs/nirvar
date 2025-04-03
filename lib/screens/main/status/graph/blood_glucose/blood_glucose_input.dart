import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nirvar/bloc/glucose_average_daily/glucose_average_daily_bloc.dart';
import 'package:nirvar/bloc/glucose_average_last_seven_days/glucose_average_last_seven_days_bloc.dart';
import 'package:nirvar/data/preference/blood_glucose_status_storage.dart';
import 'package:nirvar/repository/diabetes/diabetes_repository.dart';
import 'package:nirvar/routes/navigation_helper.dart';
import 'package:nirvar/screens/utils/helper.dart';
import 'package:nirvar/screens/widgets/custom_chasing_dots.dart';

import '../../../../../injection_container.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/assets_path.dart';
import '../../../../utils/validation_utils.dart';
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
  String hint = ' ';

  @override
  void initState() {
    super.initState();
    statusBarSetup();
    _loadHint();
  }

  @override
  void dispose() {
    _bloodGlucoseController.dispose();
    super.dispose();
  }

  Future<void> _loadHint() async {
    String loadedHint = await getHint();
    if (mounted) {
      setState(() {
        hint = loadedHint;
      });
    }
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
                      hint: hint,
                      keyboardType: TextInputType.number,
                      controller: _bloodGlucoseController,
                      validator: (value)=> ValidationUtils.validateGlucosePoint(value),
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return 'Glucose Point is Required';
                      //   }
                      //   return null;
                      // },
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
                              (success) async {
                                _bloodGlucoseController.clear();

                                // Get the current status
                                final status = await sl<BloodGlucoseStatusStorage>().getStatus();

                                // If status is "After Meal" (1), reset to "Before Meal" (0)
                                if (status == 1) {
                                  await sl<BloodGlucoseStatusStorage>().saveStatus(0); // Set to 0 (Before Meal)
                                }
                                // If status is "Before Meal" (0), set to "After Meal" (1)
                                else if (status == 0) {
                                  await sl<BloodGlucoseStatusStorage>().saveStatus(1); // Set to 1 (After Meal)
                                }
                                // If no status exists, default to "Before Meal"
                                else {
                                  await sl<BloodGlucoseStatusStorage>().saveStatus(0);
                                }

                                // Load the updated hint
                                await _loadHint();

                                setState(() {
                                  _isLoading = false;
                                });

                                if(context.mounted){
                                  context.read<GlucoseAverageLastSevenDaysBloc>().add(RefreshGlucoseAverageLastSevenDays());
                                  context.read<GlucoseAverageDailyBloc>().add(RefreshGlucoseAverageDaily());
                                  context.flushBarSuccessMessage(message: success);
                                }

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
