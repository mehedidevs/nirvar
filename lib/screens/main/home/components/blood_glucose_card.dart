import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nirvar/bloc/glucose_average_last_seven_days/glucose_average_last_seven_days_bloc.dart';
import 'package:nirvar/models/glucose_level_last_seven_days/glucose_level_for_past_seven_days.dart';

import '../../../widgets/custom_chasing_dots.dart';
import '../../../widgets/health_card.dart';

class BloodGlucoseCard extends StatefulWidget {
  const BloodGlucoseCard({super.key});

  @override
  State<BloodGlucoseCard> createState() => _BloodGlucoseCardState();
}

class _BloodGlucoseCardState extends State<BloodGlucoseCard> {
  @override
  void initState() {
    super.initState();
    context
        .read<GlucoseAverageLastSevenDaysBloc>()
        .add(GetGlucoseAverageLastSevenDaysFromApi());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlucoseAverageLastSevenDaysBloc,
        GlucoseAverageLastSevenDaysState>(
      builder: (context, state) {
        return switch(state.status){
          GlucoseAverageLastSevenDaysStatus.initial => _defaultHealthCard(),
          GlucoseAverageLastSevenDaysStatus.loading => Center(child: CustomChasingDots(size: 50.sp)),
          GlucoseAverageLastSevenDaysStatus.refreshing => _successHealthCard(state.glucoseLevelForPastSevenDays),
          GlucoseAverageLastSevenDaysStatus.success => _successHealthCard(state.glucoseLevelForPastSevenDays),
          GlucoseAverageLastSevenDaysStatus.failure => _defaultHealthCard(),
        };
      },
    );
  }

  Widget _defaultHealthCard(){
    return HealthCard(
      value: 'N/A',
      average: 'Last 7 days Avg',
      label: 'Blood Glucose',
      onPressed: () {},
    );
  }

  Widget _successHealthCard(GlucoseLevelForPastSevenDays glucoseLevelForPastSevenDays){
    String glucoseLevel =
    (glucoseLevelForPastSevenDays.avgLevel != null) ? glucoseLevelForPastSevenDays.avgLevel.toString() : 'N/A';
    return HealthCard(
      value: glucoseLevel,
      average: 'Last 7 days Avg',
      label: 'Blood Glucose',
      onPressed: () {},
    );

  }
}
