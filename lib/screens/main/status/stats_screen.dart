import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nirvar/screens/main/status/graph/blood_glucose/blood_glucose_bottom_sheet.dart';
import 'package:nirvar/screens/utils/app_colors.dart';

import '../../notification/notification_screen.dart';
import '../../utils/assets_path.dart';
import 'components/blood_pressure_widget.dart';
import 'components/health_card_widget.dart';
import 'components/report_item.dart';
import 'graph/blood_pressure/blood_pressure_bottom_sheet.dart';

class StatsScreen extends StatefulWidget {
  const StatsScreen({super.key});

  @override
  State<StatsScreen> createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final List<ReportItem> reports = [
      ReportItem(title: 'Kidney Tests', numberOfFiles: 8),
      ReportItem(title: 'Heart Tests', numberOfFiles: 8),
      // Add more items here
    ];

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 8.h),
                _headerSection(context),
                SizedBox(height: 16.h),
                InkWell(
                    onTap: _showBpGraph,
                    child: BloodPressureWidget(bloodPressure: '80/120')),
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (context) => const BloodGlucoseBottomSheet(),
                        );
                      },
                      child: HealthCardWidget(
                        backgroundColor: AppColors.purpleLight,
                        title: 'Diabetes',
                        value: '11',
                        svgPath: AssetsPath.bloodDropSvg,
                        unit: 'Avg.',
                      ),
                    ),
                    HealthCardWidget(
                      backgroundColor: AppColors.yellowLight,
                      title: 'Weight',
                      value: '80',
                      svgPath: AssetsPath.weightSvg,
                      unit: 'kg',
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                Text(
                  'Latest Report',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.h),
                ReportListView(reports: reports),
                SizedBox(height: ScreenUtil().screenHeight * .1.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showBpGraph() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const BloodPressureBottomSheet(),
    );
  }
}

Widget _headerSection(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        'My Health',
        style: Theme.of(context)
            .textTheme
            .titleLarge
            ?.copyWith(color: AppColors.black),
        textAlign: TextAlign.center,
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  const NotificationScreen(hasNotification: false),
            ),
          );
        },
        child: SvgPicture.asset(AssetsPath.notificationWithBadgeSvg),
      ),
    ],
  );
}
