import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:nirvar/screens/details/report_details_screen.dart';
import 'package:nirvar/screens/details/report_screen.dart';
import 'package:nirvar/screens/main/my_files/scanner/qr_code_screen.dart';
import 'package:nirvar/screens/main/my_files/upload/upload_screen.dart';
import 'package:nirvar/screens/utils/assets_path.dart';

import '../../../core/resources/api_exception.dart';
import '../../../injection_container.dart';
import '../../../models/patient_folder/patient_folder.dart';
import '../../../repository/patient_folder/patient_folder_repository.dart';
import '../../notification/notification_screen.dart';
import '../../utils/app_colors.dart';
import '../../widgets/file_card.dart';

class MyFiles extends StatefulWidget {
  const MyFiles({super.key});

  @override
  State<MyFiles> createState() => _MyFilesState();
}

class _MyFilesState extends State<MyFiles> {
  int _selectedIndex = 0;

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
                  _headerSection(context),
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
        _myFilesTab(),
        _myFilesTab(),
      ],
    );
  }

  Widget _myFilesTab() {
    final patientFolderRepository = sl<PatientFolderRepository>();
    return StreamBuilder<dartz.Either<ApiException, List<PatientFolder>>>(
      stream: patientFolderRepository.getAllFolders(),
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
                ), // Display error if there's an issue // Display error if there's an issue
                (folders) {
              if (folders.isEmpty) {
                return const Center(child: Text('No folders available',style: TextStyle(color: AppColors.primary),)); // Handle empty list
              }
              return GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 16.w,
                mainAxisSpacing: 16.h,
                childAspectRatio: 1,
                physics: const NeverScrollableScrollPhysics(),
                children: folders.map((folder) {
                  return FileCard(patientFolder: folder,);
                }).toList(),
              );
            },
          );
        }

        return Center(child: Text('Something went wrong')); // Fallback if no data is available
      },
    );
  }

  // Widget _myTestReportTab() {
  //   return GridView.count(
  //     shrinkWrap: true,
  //     crossAxisCount: 2,
  //     crossAxisSpacing: 16.w,
  //     mainAxisSpacing: 16.h,
  //     childAspectRatio: 1,
  //     physics: const NeverScrollableScrollPhysics(),
  //     children: [
  //       FileCard(
  //         folderName: 'Medicine',
  //         fileCount: 2,
  //       ),
  //       FileCard(
  //         folderName: 'Heart',
  //         fileCount: 2,
  //       ),
  //       FileCard(
  //         folderName: 'Eye',
  //         fileCount: 2,
  //       ),
  //       FileCard(
  //         folderName: 'Blood Glucose',
  //         fileCount: 2,
  //       ),
  //       FileCard(
  //         folderName: 'Dental',
  //         fileCount: 2,
  //       ),
  //       FileCard(
  //         folderName: 'Medicine',
  //         fileCount: 2,
  //       ),
  //       FileCard(
  //         folderName: 'Medicine',
  //         fileCount: 2,
  //       ),
  //     ],
  //   );
  // }
  //
  // Widget _myPrescriptionTab() {
  //   DateTime now = DateTime.now();
  //   String formattedDate = DateFormat('EEEE, MMMM yyyy').format(now);
  //
  //   return GridView.count(
  //     shrinkWrap: true,
  //     crossAxisCount: 2,
  //     crossAxisSpacing: 16.w,
  //     mainAxisSpacing: 16.h,
  //     childAspectRatio: 1,
  //     physics: const NeverScrollableScrollPhysics(),
  //     children: [
  //       FileCard(
  //         folderName: 'Dr Jubaer - prescription',
  //         fileCount: 2,
  //       ),
  //       FileCard(
  //         folderName: 'Dr Yousuf - prescription',
  //         fileCount: 2,
  //       ),
  //       FileCard(
  //         folderName: 'Dr Imran - prescription',
  //         fileCount: 2,
  //       ),
  //       FileCard(
  //         folderName: 'Dr Jahirul - prescription',
  //         fileCount: 2,
  //       ),
  //       FileCard(
  //         folderName: 'Dr Yousuf - prescription',
  //         fileCount: 2,
  //       ),
  //       FileCard(
  //         folderName: 'Dr Jubaer - prescription',
  //         fileCount: 2,
  //       ),
  //       FileCard(
  //         folderName: 'Dr Imran - prescription',
  //         fileCount: 2,
  //       ),
  //     ],
  //   );
  //
  //   // return ListView(
  //   //   shrinkWrap: true,
  //   //   physics: const NeverScrollableScrollPhysics(),
  //   //   children: [
  //   //     _healthItem('Dr Jubaer - prescription', formattedDate,
  //   //         AssetsPath.prescriptionPng),
  //   //     _healthItem('Dr Yousuf - prescription', formattedDate,
  //   //         AssetsPath.prescriptionPng),
  //   //     _healthItem('Dr Imran - prescription', formattedDate,
  //   //         AssetsPath.prescriptionPng),
  //   //     _healthItem('Dr Jahirul - prescription', formattedDate,
  //   //         AssetsPath.prescriptionPng),
  //   //   ],
  //   // );
  // }

  Widget _healthItem(String title, String subtitle, String imageUrl) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ReportDetailsScreen(
                      imageUrl: imageUrl,
                      title: title,
                    )));
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
            child: Image.asset(
              imageUrl,
              height: 50.h,
              width: 50.w,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(
            title,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF2C3E50), // Dark text color
            ),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.grey.shade400,
            ),
          ),
          trailing: Icon(
            Icons.more_vert,
            color: Colors.black38,
          ),
        ),
      ),
    );
  }
}

Widget _headerSection(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        flex: 2,
        child: Text(
          "My Files",
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => UploadScreen()));
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

// Widget _headerSection(BuildContext context) {
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: [
//       Expanded(
//         flex: 2,
//         child: Text(
//           "My Files",
//           style: Theme.of(context)
//               .textTheme
//               .titleLarge
//               ?.copyWith(color: AppColors.deepBlue),
//         ),
//       ),
//       Row(
//         children: [
//           InkWell(
//             onTap: () {
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => QrCodeScreen()));
//             },
//             child: CircleAvatar(
//               radius: 20.r,
//               backgroundColor: AppColors.primary,
//               child: Center(child: SvgPicture.asset(AssetsPath.scannerSvg)),
//             ),
//           ),
//         ],
//       )
//     ],
//   );
// }
