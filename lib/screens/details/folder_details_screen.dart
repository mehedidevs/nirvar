import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nirvar/models/patient_files/patient_file.dart';
import 'package:nirvar/models/patient_folder/patient_folder.dart';
import 'package:nirvar/repository/patient_file/patient_file_repository.dart';
import 'package:nirvar/screens/details/file_details_screen.dart';


import '../../core/resources/api_exception.dart';
import '../../injection_container.dart';
import '../notification/notification_screen.dart';
import '../utils/app_colors.dart';
import '../utils/assets_path.dart';

class FolderDetailsScreen extends StatefulWidget {
  final PatientFolder folder;

  const FolderDetailsScreen({super.key, required this.folder});

  @override
  State<FolderDetailsScreen> createState() => _FolderDetailsScreenState();
}

class _FolderDetailsScreenState extends State<FolderDetailsScreen> {

  int _selectedIndex = 0;
  final PatientFileRepository _repository = sl<PatientFileRepository>();

  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          elevation: 0,
          actions: [
            GestureDetector(
              onTap: () {
                print('Search icon tapped');
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Icon(
                  Icons.search,
                  color: Colors.grey,
                  size: 24.sp,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                    const NotificationScreen(hasNotification: true),
                  ),
                );

                print('Notification icon tapped');
              },
              child: Stack(
                children: [
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: SvgPicture.asset(
                          AssetsPath.notificationWithBadgeSvg)),
                  // Positioned(
                  //   right: 4.w,
                  //   top: 4.h,
                  //   child: CircleAvatar(
                  //     radius: 4.r,
                  //     backgroundColor: Colors.teal, // Badge color
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _headerSection(context,widget.folder.name ?? ''),
                  SizedBox(height: 16.h),
                  _tabBarSection(),
                  SizedBox(height: 16.h),
                  _tabBarViewSection(),
                  SizedBox(height: ScreenUtil().screenHeight * .1.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _tabBarSection() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.h),
        _customTabBar(),
      ],
    );
  }

  Widget _customTabBar() {
    return Row(
      children: [
        _buildTabItem('Test Report', 0),
        SizedBox(width: 16.w),
        _buildTabItem('Prescription', 1),
      ],
    );
  }

  Widget _buildTabItem(String title, int index) {
    bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => _onTabSelected(index),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 16.w),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.pale,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16.sp,
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _tabBarViewSection() {
    return IndexedStack(
      index: _selectedIndex,
      children: [
       _myTestReportTab(),
       _myPrescriptionTab(),
      ],
    );
  }



  Widget _myTestReportTab() {
    return StreamBuilder<dartz.Either<ApiException, List<PatientFile>>>(
      stream: _repository.getAllTestReports(widget.folder.folderId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: SpinKitChasingDots(
              color: AppColors.primary, size: 50.sp)); // Show a loading indicator while waiting for data
        }

        if (snapshot.hasData) {
          return snapshot.data!.fold(
                (error) => Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h,horizontal: 8.w),
              child: Center(child: Text(error.message,style: const TextStyle(color: AppColors.primary),)),
            ), // Display error if there's an issue
                (testReports) {
              if (testReports.isEmpty) {
                return const Center(child: Text('No Test Report is available',style: TextStyle(color: AppColors.primary),)); // Handle empty list
              }
              return ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: testReports.map((file) {
                  return _healthItem(context,file);
                }).toList(),
              );
            },
          );
        }

        return const Center(child: Text('Something went wrong')); // Fallback if no data is available
      },
    );
  }

 Widget _myPrescriptionTab() {
   return StreamBuilder<dartz.Either<ApiException, List<PatientFile>>>(
     stream: _repository.getAllPrescriptions(widget.folder.folderId),
     builder: (context, snapshot) {
       if (snapshot.connectionState == ConnectionState.waiting) {
         return Center(child: SpinKitChasingDots(
             color: AppColors.primary, size: 50.sp)); // Show a loading indicator while waiting for data
       }

       if (snapshot.hasData) {
         return snapshot.data!.fold(
               (error) => Padding(
             padding: EdgeInsets.symmetric(vertical: 16.h,horizontal: 8.w),
             child: Center(child: Text(error.message,style: const TextStyle(color: AppColors.primary),)),
           ), // Display error if there's an issue
               (prescriptions) {
             if (prescriptions.isEmpty) {
               return const Center(child: Text('No Prescription is available',style: TextStyle(color: AppColors.primary),)); // Handle empty list
             }
             return ListView(
               shrinkWrap: true,
               physics: const NeverScrollableScrollPhysics(),
               children: prescriptions.map((file) {
                 return _healthItem(context,file);
               }).toList(),
             );
           },
         );
       }

       return const Center(child: Text('Something went wrong')); // Fallback if no data is available
     },
   );
 }

  Widget _healthItem(BuildContext context,PatientFile file) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ReportDetailsScreen(file: file,)));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
        decoration: BoxDecoration(
          color: AppColors.pale, // Light background color
          borderRadius: BorderRadius.circular(20.r), // Rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5.r,
              offset: Offset(0, 4.h),
            ),
          ],
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.network(
              file.path!,
              height: 50.h,
              width: 50.w,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(
            file.name ?? '',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF2C3E50),

            ),
            maxLines: 1,
            overflow: TextOverflow.fade,
          ),
          subtitle:Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                file.folderName ?? "",
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.grey.shade400,
                ),
                maxLines: 1,
                overflow: TextOverflow.fade,
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 8.w),
                child: Container(
                  height: 5.sp,
                  width: 5.sp,
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Text(
                file.createdAt ?? "",
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.grey.shade400,
                ),
              ),
            ],
          ),

          trailing: Icon(
            Icons.more_vert,
            color: Colors.black38,
          ),
        ),
      ),
    );
  }

  Widget _headerSection(BuildContext context,String folderName) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            folderName,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: AppColors.deepBlue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Row(
          children: [
            // Scanner Button
            CircleAvatar(
              radius: 16.r,
              backgroundColor: AppColors.primary,
              child: Center(
                child: SvgPicture.asset(
                  AssetsPath.scannerSvg,
                  width: 16.w,
                  height: 16.h,
                ),
              ),
            ),
            SizedBox(width: 10.w), // Add some spacing between the buttons

            // Upload Button
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.add, size: 16.sp, color: Colors.white),
              label: Text(
                "Upload",
                style: TextStyle(fontSize: 14.sp, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              ),
            ),
          ],
        ),
      ],
    );
  }


























}
