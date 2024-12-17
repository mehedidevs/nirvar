import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nirvar/bloc/blood_pressure_average_last_seven_days/blood_pressure_average_last_seven_days_bloc.dart';
import 'package:nirvar/models/blood_pressure_last_seven_days/blood_pressure_history_for_last_7_days.dart';

import '../../../widgets/custom_chasing_dots.dart';
import '../../../widgets/health_card.dart';

class BloodPressureCard extends StatefulWidget {
  const BloodPressureCard({super.key});

  @override
  State<BloodPressureCard> createState() => _BloodPressureCardState();
}

class _BloodPressureCardState extends State<BloodPressureCard> {

  @override
  void initState() {
    super.initState();
    context.read<BloodPressureAverageLastSevenDaysBloc>().add(GetBloodPressureAverageLastSevenDaysFromApi());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BloodPressureAverageLastSevenDaysBloc,BloodPressureAverageLastSevenDaysState>(builder: (context,state){
      return switch(state.status){
        BloodPressureAverageLastSevenDaysStatus.initial =>_defaultHealthCard(),
        BloodPressureAverageLastSevenDaysStatus.loading => Center(child: CustomChasingDots(size: 50.sp)),
        BloodPressureAverageLastSevenDaysStatus.refreshing => _successHealthCard(state.bloodPressureHistoryForLast7Days),
        BloodPressureAverageLastSevenDaysStatus.success => _successHealthCard(state.bloodPressureHistoryForLast7Days),
        BloodPressureAverageLastSevenDaysStatus.failure => _defaultHealthCard(),
      };
    });
  }

  Widget _defaultHealthCard(){
    return HealthCard(
      value: 'N/A',
      average: 'Last 7 days Avg',
      label: 'Blood Pressure',
      onPressed: () {
        // Define the action when the button is pressed
      },
    );
  }

  Widget _successHealthCard(BloodPressureHistoryForLast7Days bloodPressureHistoryForLast7Days){
    final systole = (bloodPressureHistoryForLast7Days.avgSystolic ?? 0) > 0
        ? bloodPressureHistoryForLast7Days.avgSystolic.toString()
        : 'N/A';
    final diastole = (bloodPressureHistoryForLast7Days.avgDiastolic ?? 0) > 0
        ? bloodPressureHistoryForLast7Days.avgDiastolic.toString()
        : '';
    return HealthCard(
      value: '$systole/$diastole',
      average: 'Last 7 days Avg',
      label: 'Blood Pressure',
      onPressed: () {},
    );
  }
}
