import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:nirvar/models/patient_blood_pressure/patient_blood_pressure.dart';
import 'package:nirvar/repository/blood_pressure/blood_pressure_repository.dart';
import 'package:nirvar/screens/utils/app_colors.dart';
import 'package:nirvar/screens/utils/assets_path.dart';
import 'package:nirvar/screens/widgets/file_card.dart';
import 'package:path/path.dart';
import '../../../core/resources/api_exception.dart';
import '../../../injection_container.dart';
import '../../../models/patient_folder/patient_folder.dart';
import '../../../repository/patient_folder/patient_folder_repository.dart';
import '../../notification/notification_screen.dart';
import '../../utils/blood_pressure_utils.dart';
import '../../widgets/health_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final patientFolderRepository = sl<PatientFolderRepository>();
  int _selectedIndex = 0;

  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
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
                ), // Display error if there's an issue
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
                  return FileCard(
                    patientFolder: folder,
                    onUpdateSuccess: ()async {
                      setState(() {});
                      print("API CALLED AGAIN");
                  },
                    onDeleteSuccess: ()async {
                      setState(() {});
                      print("API CALLED AGAIN");
                  },
                    onComingBack: ()async{
                      setState(() {

                    });},
                  );
                }).toList(),
              );
            },
          );
        }

        return Center(child: Text('Something went wrong')); // Fallback if no data is available
      },
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
          child: _getBloodPressureAverage(),
        ),
        SizedBox(width: 8.w),
        Expanded(
          flex: 1,
          child: _getBloodGlucoseAverage(),
        ),
      ],
    ),
  );
}

Widget _getBloodGlucoseAverage() {

  return HealthCard(
          value: '11/10',
          average: 'Last 7 days Avg',
          label: 'Blood Glucose',
          onPressed: () {
            // Define the action when the button is pressed
          },
        );
}

Widget _getBloodPressureAverage() {

  final patientBloodPressureRepository = sl<BloodPressureRepository>();
  List<PatientBloodPressure> bloodPressureList = [];
  String? systole;
  String? diastole;

  return StreamBuilder<dartz.Either<ApiException,List<PatientBloodPressure>>>(
      stream: patientBloodPressureRepository.getBloodPressureOfLast7Days(),
      builder: (context,snapshot){
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: SpinKitChasingDots(
              color: AppColors.primary, size: 50.sp)); // Show a loading indicator while waiting for data
        }
        if (!snapshot.hasData) {
          return HealthCard(
            value: 'N/A',
            average: 'Last 7 days Avg',
            label: 'Blood Pressure',
            onPressed: () {},
          );
        }

        return snapshot.data!.fold(
              (error){
          return HealthCard(
            value: 'N/A',
            average: 'Last 7 days Avg',
            label: 'Blood Pressure',
            onPressed: () {
              // Define the action when the button is pressed
            },
          );
        },
              (success){
          bloodPressureList = success;
          if(bloodPressureList.isEmpty){
            return HealthCard(
              value: 'N/A',
              average: 'Last 7 days Avg',
              label: 'Blood Pressure',
              onPressed: () {
                // Define the action when the button is pressed
              },
            );
          }else{
            final average = BloodPressureUtils.calculateAverage(bloodPressureList);
            systole = average['systolic']?.toStringAsFixed(0);
            diastole  = average['diastolic']?.toStringAsFixed(0);
            return HealthCard(
              value: '$systole/$diastole',
              average: 'Last 7 days Avg',
              label: 'Blood Pressure',
              onPressed: () {
                // Define the action when the button is pressed
              },
            );
          }
        },);

        },
  );
}




























