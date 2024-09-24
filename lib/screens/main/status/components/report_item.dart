import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nirvar/screens/utils/app_colors.dart';
import 'package:nirvar/screens/utils/assets_path.dart';

class ReportItem {
  final String title;
  final int numberOfFiles;

  ReportItem({required this.title, required this.numberOfFiles});
}

class ReportListView extends StatelessWidget {
  final List<ReportItem> reports;

  const ReportListView({Key? key, required this.reports}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: reports.length,
      itemBuilder: (context, index) {
        final report = reports[index];
        final bool isEven = index % 2 == 0;
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 2.h),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
            elevation: 2,
            child: ListTile(
              leading: Container(
                height: 50.h,
                width: 60.w,
                decoration: BoxDecoration(
                  color: isEven ?  AppColors.blueLight : AppColors.greenLight,
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: Padding(
                  padding:  EdgeInsets.symmetric(vertical: 8.h,horizontal: 4.w),
                  child: Center(
                    child: SvgPicture.asset(
                      isEven ? AssetsPath.fileBlueSvg: AssetsPath.fileGreenSvg  ,
                      height: 30.h,
                      width: 40.w,
                    ),
                  ),
                ),
              ),
              title: Text(
                report.title,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                '${report.numberOfFiles} files',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.black.withOpacity(0.6),
                ),
              ),
              trailing: Icon(
                Icons.more_horiz,
                size: 24.sp,
              ),
              tileColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            ),
          ),
        );
      },
    );
  }
}
