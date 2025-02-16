import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nirvar/routes/navigation_helper.dart';
import 'package:nirvar/routes/routes_name.dart';
import '../../../models/health_notification/health_notification.dart';
import '../../utils/assets_path.dart';

enum NotificationType {
  new_prescription,
  weekly_report_diabetes,
  weekly_report_blood_pressure,
  monthly_report_diabetes,
  monthly_report_blood_pressure,
}

class NotificationListView extends StatelessWidget {
  final List<HealthNotification> notificationList;

  const NotificationListView({super.key, required this.notificationList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      itemCount: notificationList.length,
      itemBuilder: (context, index) {
        final notification = notificationList[index];
        return _buildNotificationCard(context, notification);
      },
    );
  }

  Widget _buildNotificationCard(BuildContext context, HealthNotification notification) {
    final type = _convertToNotificationType(notification.type);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        elevation: 2,
        child: ListTile(
          leading: SvgPicture.asset(
            _getNotificationIcon(type),
            height: 40.h,
            width: 40.w,
          ),
          title: Text(
            notification.title ?? 'No Title',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
          ),
          subtitle: Text(
            notification.data ?? 'No Data',
            style: TextStyle(fontSize: 12.sp, color: Colors.grey[600]),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          onTap: () => _handleNotification(context, type),
        ),
      ),
    );
  }

  NotificationType _convertToNotificationType(String? type) {
    return NotificationType.values.firstWhere(
          (e) => e.toString().split('.').last == type,
      orElse: () => NotificationType.new_prescription, // Default value
    );
  }

  String _getNotificationIcon(NotificationType type) {
    switch (type) {
      case NotificationType.new_prescription:
        return AssetsPath.prescriptionNotificationSvg;
      case NotificationType.weekly_report_diabetes:
        return AssetsPath.reportNotificationSvg;
      case NotificationType.weekly_report_blood_pressure:
        return AssetsPath.reportNotificationSvg;
      case NotificationType.monthly_report_diabetes:
        return AssetsPath.reportNotificationSvg;
      case NotificationType.monthly_report_blood_pressure:
        return AssetsPath.reportNotificationSvg;
    }
  }

  void _handleNotification(BuildContext context, NotificationType type) {
    switch (type) {
      case NotificationType.new_prescription:
        print('Handle new prescription notification');
        break;
      case NotificationType.weekly_report_blood_pressure:
        context.pushReplacementNamed(routeName: RoutesName.bloodPressureInput);
        break;
      case NotificationType.weekly_report_diabetes:
        context.pushReplacementNamed(routeName: RoutesName.bloodGlucoseInput);
        break;
      case NotificationType.monthly_report_blood_pressure:
        print('Handle monthly blood pressure report');
        break;
      case NotificationType.monthly_report_diabetes:
        print('Handle monthly diabetes report');
        break;
    }
  }
}
