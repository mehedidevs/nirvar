import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nirvar/bloc/glucose_average_daily/glucose_average_daily_bloc.dart';
import '../../../utils/assets_path.dart';
import 'health_item_widget.dart';

class DailyBloodGlucoseHealthItem extends StatefulWidget {
  const DailyBloodGlucoseHealthItem({super.key});

  @override
  State<DailyBloodGlucoseHealthItem> createState() => _DailyBloodGlucoseHealthItemState();
}

class _DailyBloodGlucoseHealthItemState extends State<DailyBloodGlucoseHealthItem> {

  @override
  void initState() {
    super.initState();
    context.read<GlucoseAverageDailyBloc>().add(GetGlucoseAverageDailyFromApi());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlucoseAverageDailyBloc,GlucoseAverageDailyState>(builder: (context,state){
      return switch(state.status){
        GlucoseAverageDailyStatus.initial => _defaultHealthItem(),
        GlucoseAverageDailyStatus.loading => _defaultHealthItem(),
        GlucoseAverageDailyStatus.refreshing => _successHealthItem(state.dailyGlucoseLevel),
        GlucoseAverageDailyStatus.success => _successHealthItem(state.dailyGlucoseLevel),
        GlucoseAverageDailyStatus.failure => _defaultHealthItem(),
      };
    });
  }

  Widget _defaultHealthItem(){
    return HealthItemWidget(
      title: 'Diabetes',
      value: 'N/A',
      svgAsset: AssetsPath.bloodPressureSvg,
      onMenuPressed: () {
        // Handle menu action
        print('Menu pressed for Blood Pressure');
      },
    );
  }

  Widget _successHealthItem(String glucoseLevel) {
    return HealthItemWidget(
      title: 'Diabetes',
      value: glucoseLevel,
      svgAsset: AssetsPath.bloodPressureSvg,
      onMenuPressed: () {
        print('Menu pressed for Blood Pressure');
      },
    );
  }
}
