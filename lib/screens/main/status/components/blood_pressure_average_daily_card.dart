import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/blood_pressure_average_daily/blood_pressure_average_daily_bloc.dart';
import 'blood_pressure_widget.dart';

class BloodPressureAverageDailyCard extends StatefulWidget {
  const BloodPressureAverageDailyCard({super.key});

  @override
  State<BloodPressureAverageDailyCard> createState() => _BloodPressureAverageDailyCardState();
}

class _BloodPressureAverageDailyCardState extends State<BloodPressureAverageDailyCard> {

  @override
  void initState() {
    super.initState();
    context
        .read<BloodPressureAverageDailyBloc>()
        .add(GetBloodPressureAverageDailyFromApi());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BloodPressureAverageDailyBloc,
        BloodPressureAverageDailyState>(builder: (context, state) {
      return switch(state.status){
        BloodPressureAverageDailyStatus.initial =>  _defaultHealthItem(),
        BloodPressureAverageDailyStatus.loading =>  _defaultHealthItem(),
        BloodPressureAverageDailyStatus.refreshing => _successHealthItem(state.systolic, state.diastolic),
        BloodPressureAverageDailyStatus.success => _successHealthItem(state.systolic, state.diastolic),
        BloodPressureAverageDailyStatus.failure =>  _defaultHealthItem(),
      };
    });
  }

  Widget _defaultHealthItem(){
    return BloodPressureWidget(bloodPressure: 'N/A');
  }

  Widget _successHealthItem(String systolic, String diastolic) {
    return BloodPressureWidget(bloodPressure: '$systolic/$diastolic');
  }
}
