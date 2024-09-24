import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nirvar/screens/utils/assets_path.dart';

import '../utils/app_colors.dart';

class NotificationScreen extends StatelessWidget {
  final bool hasNotification;

  const NotificationScreen({Key? key, required this.hasNotification}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          'Notifications',
          style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SafeArea(child: hasNotification ? _buildNotificationList() : _buildNoNotificationView()),
    );
  }

  Widget _buildNotificationList() {
    final notifications = [
      {'title': 'Reports', 'subtitle': 'Check your schedule Today', 'icon': AssetsPath.reportNotificationSvg},
      {'title': 'Prescriptions', 'subtitle': 'Check your schedule Today', 'icon': AssetsPath.prescriptionNotificationSvg},
      {'title': 'App Update', 'subtitle': 'Check your schedule Today', 'icon': AssetsPath.appUpdateSvg},
    ];

    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal:  16.w,vertical: 16.h),
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        final notification = notifications[index];
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 4.h),
          child: Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
            elevation: 2,
            child: ListTile(
              leading: SvgPicture.asset( notification['icon'] as String,height: 40.h,width: 40.w,),
              title: Text(
                notification['title'] as String,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
              ),
              subtitle: Text(
                notification['subtitle'] as String,
                style: TextStyle(fontSize: 12.sp, color: Colors.grey[600]),
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              onTap: () {
                // Handle notification click
              },
            ),
          ),
        );
      },
    );
  }

  Widget _buildNoNotificationView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(AssetsPath.bellSvg,height: 150.h,width: 150.w,),
          SizedBox(height: 16.h),
          Text(
            'Oops, no notification yet!',
            style: TextStyle(fontSize: 16.sp, color: Colors.grey.shade300),
          ),
        ],
      ),
    );
  }
}


