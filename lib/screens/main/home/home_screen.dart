import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:nirvar/screens/utils/app_colors.dart';
import 'package:nirvar/screens/utils/assets_path.dart';
import 'package:nirvar/screens/widgets/file_card.dart';

import '../../notification/notification_screen.dart';
import '../../widgets/health_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

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
                  _welcomeText(context),
                  SizedBox(height: 16.h),
                  _healthStatus(),
                  SizedBox(height: 16.h),
                  _tabBarSection(context),
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

  Widget _tabBarSection(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Recent Activities",
          style: TextStyle(fontSize: 14.sp, color: Colors.grey),
        ),
        SizedBox(height: 10.h),
        _customTabBar(),
      ],
    );
  }

  Widget _customTabBar() {
    return Row(
      children: [
        _buildTabItem('My Files', 0),
        SizedBox(width: 16.w),
        _buildTabItem('My Health', 1),
      ],
    );
  }

  Widget _buildTabItem(String title, int index) {
    bool isSelected = _selectedIndex  == index;
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

  Widget _tabBarViewSection(){
    return IndexedStack(
      index: _selectedIndex,
      children: [
        _myFilesTab(),
        _myHealthTab(),
      ],
    );
  }

  Widget _myFilesTab() {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      crossAxisSpacing: 16.w,
      mainAxisSpacing: 16.h,
      childAspectRatio: 1,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        FileCard(folderName: 'Medicine', fileCount: 2,),
        FileCard(folderName: 'Heart', fileCount: 2,),
        FileCard(folderName: 'Eye', fileCount: 2,),
        FileCard(folderName: 'Blood Glucose', fileCount: 2,),
        FileCard(folderName: 'Blood Glucose', fileCount: 2,),
        FileCard(folderName: 'Blood Glucose', fileCount: 2,),
        FileCard(folderName: 'Blood Glucose', fileCount: 2,),
      ],
    );
  }

  Widget _myHealthTab() {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        _healthItem('Blood Pressure', '80/120'),
        _healthItem('Blood Glucose', '11/10'),
        _healthItem('Heart Rate', '72 bpm'),
      ],
    );
  }

  Widget _healthItem(String title, String value) {
    return Container(
      margin: EdgeInsets.all(8.w),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.pale, // Background color of the card
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Icon Container
          SvgPicture.asset(AssetsPath.bloodPressureSvg),
          SizedBox(width: 16.w), // Space between icon and text
          // Text Column
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                    color: const Color(0xFF2B3A4B), // Text color
                  ),
                ),
                SizedBox(height: 4.h), // Space between title and subtitle
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: const Color(0xFF8A8A8A), // Subtext color
                  ),
                ),
              ],
            ),
          ),
          // Overflow Menu Icon
          IconButton(
            icon: const Icon(
              Icons.more_vert,
              color: Color(0xFF2B3A4B), // Overflow icon color
            ),
            onPressed: () {
              // Add your action here
            },
          ),
        ],
      ),
    );
  }
}

Widget _headerSection(BuildContext context) {
  return Row(
    children: [
      Container(
        padding: EdgeInsets.all(4.w), // Border width
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColors.primary, // Border color
            width: 4.w, // Border thickness
          ),
        ),
        child: CircleAvatar(
          radius: 25.r, // Adjust the radius as needed
          backgroundColor: Colors.transparent,
          child: Icon(Icons.person,size: 25.r,),
        ),
      ),
      const Spacer(),
      IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const NotificationScreen(hasNotification: true),
            ),
          );
        },
        icon: SvgPicture.asset(AssetsPath.notificationWithBadgeSvg)
      )
    ],
  );
}

Widget _welcomeText(BuildContext context) {
  DateTime now = DateTime.now();
  String formattedDate = DateFormat('EEEE, MMMM yyyy').format(now);

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text(
        "How is your health today?",
        style: Theme.of(context).textTheme.titleLarge,
      ),
      SizedBox(height: 4.h),
      Text(
        formattedDate,
        style: TextStyle(fontSize: 16.sp, color: Colors.grey),
      ),
    ],
  );
}

Widget _healthStatus() {
  return SizedBox(
    height: ScreenUtil().screenHeight * .2.h,
    child: Row(
      children: [
        Expanded(
          flex: 1,
          child: HealthCard(
            value: '80/120',
            average: 'Last 7 days Avg',
            label: 'Blood Pressure',
            onPressed: () {
              // Define the action when the button is pressed
            },
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          flex: 1,
          child: HealthCard(
            value: '11/10',
            average: 'Last 7 days Avg',
            label: 'Blood Glucose',
            onPressed: () {
              // Define the action when the button is pressed
            },
          ),
        ),
      ],
    ),
  );
}






