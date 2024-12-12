import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nirvar/bloc/health_status_notification/health_status_notification_bloc.dart';
import 'package:nirvar/models/health_notification/health_notification.dart';
import 'package:nirvar/screens/main/main_screen.dart';
import 'package:nirvar/screens/notification/components/notification_list_view.dart';
import 'package:nirvar/screens/utils/assets_path.dart';
import 'package:nirvar/screens/widgets/error_message_display.dart';
import 'package:nirvar/screens/widgets/initial_state_display.dart';
import 'package:nirvar/screens/widgets/loading_state_display.dart';

import '../utils/app_colors.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});
  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {

  @override
  void initState() {
    super.initState();
    context.read<HealthStatusNotificationBloc>().add(GetNotificationFromApi());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HealthStatusNotificationBloc, HealthStatusNotificationState>(
      builder: (context, state) {
        return switch (state.status) {
          NotificationStatus.initial => const InitialStateDisplay(),
          NotificationStatus.loading => const LoadingStateDisplay(),
          NotificationStatus.success => _buildUI(context,state.notificationList),
          NotificationStatus.failure => ErrorMessageDisplay(message: state.errorMessage),
        };
      },
    );
  }

  Widget _buildUI(BuildContext context, List<HealthNotification> notificationList) {
    return PopScope(
      canPop: false,
      child: Scaffold(
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
            // if(widget.isComingFromNotification == true){
            //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainScreen()));
            // }else{
            //   Navigator.of(context).pop();
            // }
          },
        ),
      ),
      body: SafeArea(child: notificationList.isNotEmpty ? NotificationListView(notificationList: notificationList) : _buildNoNotificationView()),
        ),
    );
  }

  Widget _buildNotificationList(List<HealthNotification> notificationList) {
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


