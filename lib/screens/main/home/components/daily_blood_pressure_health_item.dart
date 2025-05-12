import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../bloc/blood_pressure_average_daily/blood_pressure_average_daily_bloc.dart';
import '../../../utils/assets_path.dart';
import 'health_item_widget.dart';

class DailyBloodPressureHealthItem extends StatefulWidget {
  const DailyBloodPressureHealthItem({super.key});

  @override
  State<DailyBloodPressureHealthItem> createState() =>
      _DailyBloodPressureHealthItemState();
}

class _DailyBloodPressureHealthItemState
    extends State<DailyBloodPressureHealthItem> {
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
    return HealthItemWidget(
      title: 'Blood Pressure',
      value: 'Insert BP data',
      svgAsset: AssetsPath.bloodPressureSvg,
      onMenuPressed: () {
        // Handle menu action
        print('Menu pressed for Blood Pressure');
      },
    );
  }

  Widget _successHealthItem(String systolic, String diastolic) {
    return HealthItemWidget(
      title: 'Blood Pressure',
      value: '$systolic/$diastolic',
      svgAsset: AssetsPath.bloodPressureSvg,
      onMenuPressed: () {
        print('Menu pressed for Blood Pressure');
      },
    );
  }


}
