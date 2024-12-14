import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nirvar/bloc/user_profile_details/user_profile_details_bloc.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/assets_path.dart';
import '../../../widgets/custom_chasing_dots.dart';
import 'health_card_widget.dart';

class UserWeightCard extends StatefulWidget {
  const UserWeightCard({super.key});

  @override
  State<UserWeightCard> createState() => _UserWeightCardState();
}

class _UserWeightCardState extends State<UserWeightCard> {

  @override
  void initState() {
    super.initState();
    context.read<UserProfileDetailsBloc>().add(GetUserProfileDetailsFromApi());
  }

  @override
  Widget build(BuildContext context) {

    String weightValue = 'N/A';
    String weightUnit = '';

    return BlocBuilder<UserProfileDetailsBloc, UserProfileDetailsState>(
      builder: (context, state) {
        return switch (state.status) {
          UserProfileDetailsStatus.initial =>  _buildHealthCardOfWeight(weightValue, weightUnit),
          UserProfileDetailsStatus.loading => Center(child: CustomChasingDots()),
          UserProfileDetailsStatus.success => _buildHealthCardOfWeight( state.userProfile.weight ?? weightValue, 'kg'),
          UserProfileDetailsStatus.refreshing =>  _buildHealthCardOfWeight( state.userProfile.weight ??  weightValue, 'kg'),
          UserProfileDetailsStatus.failure =>  _buildHealthCardOfWeight(weightValue, weightUnit),
        };
      },
      buildWhen: (previous, current) =>
      previous.userProfile != current.userProfile ||
          previous.status != current.status,
    );
  }

  Widget _buildHealthCardOfWeight(String value, String unit) {
    return HealthCardWidget(
      backgroundColor: AppColors.yellowLight,
      title: 'Weight',
      value: value,
      svgPath: AssetsPath.weightSvg,
      unit: unit,
    );
  }
}
