import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/glucose_average_daily/glucose_average_daily_bloc.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/assets_path.dart';
import 'health_card_widget.dart';

class BloodGlucoseAverageDailyCard extends StatefulWidget {
  const BloodGlucoseAverageDailyCard({super.key});

  @override
  State<BloodGlucoseAverageDailyCard> createState() => _BloodGlucoseAverageDailyCardState();
}

class _BloodGlucoseAverageDailyCardState extends State<BloodGlucoseAverageDailyCard> {

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
   return _buildHealthCardWidgetOfDiabetes('N/A','Avg.');
  }

  Widget _successHealthItem(String glucoseLevel) {
  return  _buildHealthCardWidgetOfDiabetes(glucoseLevel,'Avg.');
  }


  Widget _buildHealthCardWidgetOfDiabetes(String value,String unit) {
    return HealthCardWidget(
      backgroundColor: AppColors.purpleLight,
      title: 'Blood Glucose',
      value: value,
      svgPath: AssetsPath.bloodDropSvg,
      unit: unit,
    );
  }
}
