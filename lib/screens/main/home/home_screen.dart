import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/material.dart';
import 'package:flutter_app_badge_control/flutter_app_badge_control.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:nirvar/models/blood_pressure_last_seven_days/blood_pressure_history_for_last_7_days.dart';
import 'package:nirvar/repository/blood_pressure/blood_pressure_repository.dart';
import 'package:nirvar/repository/diabetes/diabetes_repository.dart';
import 'package:nirvar/routes/navigation_helper.dart';
import 'package:nirvar/routes/routes_name.dart';
import 'package:nirvar/screens/main/home/components/blood_glucose_card.dart';
import 'package:nirvar/screens/main/home/components/blood_pressure_card.dart';
import 'package:nirvar/screens/main/home/components/daily_blood_glucose_health_item.dart';
import 'package:nirvar/screens/main/home/components/user_profile_picture.dart';
import 'package:nirvar/screens/notification/firebase/firebase_api.dart';
import 'package:nirvar/screens/utils/app_colors.dart';
import 'package:nirvar/screens/utils/assets_path.dart';
import 'package:nirvar/screens/utils/theme_helper.dart';
import 'package:nirvar/screens/widgets/custom_chasing_dots.dart';
import 'package:nirvar/screens/widgets/file_card.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../bloc/patient_folder/patient_folder_bloc.dart';
import '../../../core/resources/api_exception.dart';
import '../../../injection_container.dart';
import '../../../models/patient_folder/patient_folder.dart';
import '../../../repository/notification/notification_repository.dart';
import '../../../repository/patient_folder/patient_folder_repository.dart';
import '../../utils/helper.dart';
import '../../widgets/health_card.dart';
import 'components/daily_blood_pressure_health_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final patientFolderRepository = sl<PatientFolderRepository>();
  FirebaseApi firebaseApi = FirebaseApi();
  int _selectedIndex = 0;

  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    firebaseApi.setupInteractMessageWhenTerminated();
    context.read<PatientFolderBloc>().add(GetPatientFolderFromApi());
    _sendDeviceInfo();
    super.initState();
  }

  Future<void> _sendDeviceInfo() async {
    // Check if device info is already sent for the session
    bool isDeviceInfoSent = await _isDeviceInfoAlreadySent();
    if (isDeviceInfoSent) return;

    // Call the API to send device information
    final result = await sl<NotificationRepository>().sendDeviceCredentials();

    result.fold(
          (error) {
        // Handle the error, maybe show a message or log it
        print('Error sending device info: ${error.message}');
        // Optionally retry if needed
      },
          (message) async {
        print('Device info sent successfully');
        await _markDeviceInfoAsSent();
      },
    );
  }

  Future<bool> _isDeviceInfoAlreadySent() async {
    // Check SharedPreferences (or any persistent storage) for device info sent status
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isDeviceInfoSent') ?? false;
  }

  Future<void> _markDeviceInfoAsSent() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDeviceInfoSent', true);
  }

  @override
  void didChangeDependencies() {
    context.read<PatientFolderBloc>().add(GetPatientFolderFromApi());
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant HomeScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if(sl<PatientFolderBloc>().state.status == PatientFolderStatus.initial){
      context.read<PatientFolderBloc>().add(GetPatientFolderFromApi());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: AppColors.white,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _headerSection(context),
                  SizedBox(height: 16.h),
                  _welcomeText(context),
                   8.verticalSpace,
                  _healthStatus(),
                  4.verticalSpace,
                  _tabBarSection(context),
                  16.verticalSpace,
                  _tabBarViewSection(),
                  SizedBox(height: ScreenUtil().screenHeight * .15.h),
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
          style: context.textTheme.bodySmall?.copyWith(color: Colors.grey,fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 10.h),
        _customTabBar(context),
      ],
    );
  }

  Widget _customTabBar(BuildContext context) {
    return Row(
      children: [
        _buildTabItem('My Files', 0,context),
        SizedBox(width: 16.w),
        _buildTabItem('My Health', 1,context),
      ],
    );
  }

  Widget _buildTabItem(String title, int index, BuildContext context) {
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
          style: context.textTheme.bodyMedium?.copyWith(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: isSelected ? FontWeight.w600 :  FontWeight.w500 ,
          )
        ),
      ),
    );
  }

  Widget _tabBarViewSection() {
    return IndexedStack(
      index: _selectedIndex,
      children: [
        _myFilesSectionAlternative(),
        _myHealthTab(),
      ],
    );
  }

  //Going to implement BLOC in this section
  Widget _myFilesSectionAlternative() {
    return BlocBuilder<PatientFolderBloc, PatientFolderState>(
      builder: (context, state) {
        if (state.status == PatientFolderStatus.loading) {
          return SizedBox(
            height: ScreenUtil().screenHeight * 0.2,
            child: Center(
                child: SpinKitChasingDots(color: AppColors.primary, size: 50.sp)),
          );
        } else if (state.status == PatientFolderStatus.failure) {
          // Show an error message if data fetching fails
          return SizedBox(
            height: ScreenUtil().screenHeight * 0.2,
            child: Center(
                child: Text('Error: ${state.errorMessage}',
                    style: const TextStyle(color: AppColors.primary))),
          );
        } else if (state.status == PatientFolderStatus.success) {
          return state.folderList.isEmpty
              ? SizedBox(
            height: ScreenUtil().screenHeight * 0.2,
                child: const Center(
                    child: Text(
                    'No folders available',
                    style: TextStyle(color: AppColors.primary),
                  )),
              )
              : GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.w,
                  mainAxisSpacing: 16.h,
                  childAspectRatio: 1,
                  physics: const NeverScrollableScrollPhysics(),
                  children: state.folderList.map((folder) {
                    return FileCard(
                      patientFolder: folder,
                      onUpdateSuccess: () async {
                        context
                            .read<PatientFolderBloc>()
                            .add(GetPatientFolderFromApi());
                      },
                      onDeleteSuccess: () async {
                        context
                            .read<PatientFolderBloc>()
                            .add(GetPatientFolderFromApi());
                      },
                      onComingBack: () async {
                        context
                            .read<PatientFolderBloc>()
                            .add(GetPatientFolderFromApi());
                      },
                    );
                  }).toList(),
                );
        } else {
          // Default UI when no action is happening
          return const SizedBox();
        }
      },
    );
  }

  //Going To Be replaced by BLOC
  Widget _myFilesTab() {
    return StreamBuilder<dartz.Either<ApiException, List<PatientFolder>>>(
      stream: patientFolderRepository.getAllFolders(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child: SpinKitChasingDots(
                  color: AppColors.primary,
                  size: 50
                      .sp)); // Show a loading indicator while waiting for data
        }

        if (snapshot.hasData) {
          return snapshot.data!.fold(
            (error) => Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 8.w),
              child: Center(
                  child: Text(
                error.message,
                style: const TextStyle(color: AppColors.primary),
              )),
            ), // Display error if there's an issue
            (folders) {
              if (folders.isEmpty) {
                return const Center(
                    child: Text(
                  'No folders available',
                  style: TextStyle(color: AppColors.primary),
                )); // Handle empty list
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
                    onUpdateSuccess: () async {
                      setState(() {});
                      print("API CALLED AGAIN");
                    },
                    onDeleteSuccess: () async {
                      setState(() {});
                      print("API CALLED AGAIN");
                    },
                    onComingBack: () async {
                      setState(() {});
                    },
                  );
                }).toList(),
              );
            },
          );
        }

        return Center(
            child: Text(
                'Something went wrong')); // Fallback if no data is available
      },
    );
  }

  //NEED TO WORK ON THAT
  Widget _myHealthTab() {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        DailyBloodPressureHealthItem(),
        DailyBloodGlucoseHealthItem(),
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
      UserProfilePicture(),
      const Spacer(),
      IconButton(
          onPressed: () {
            context.pushNamed(routeName: RoutesName.notificationScreen);
          },
          icon: SvgPicture.asset(AssetsPath.notificationWithBadgeSvg))
    ],
  );
}

Widget _welcomeText(BuildContext context) {
  DateTime now = DateTime.now();
  //String formattedDate = DateFormat('EEEE, MMMM yyyy').format(now);
  String formattedDate = formatCustomDate(now);

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text(
        "How is your health today?",
        style: context.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w600),
      ),
      SizedBox(height: 4.h),
      Text(
        formattedDate,
        style: context.textTheme.bodySmall?.copyWith(color: Colors.grey,fontWeight: FontWeight.w500),
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
          child: BloodPressureCard(),
        ),
        SizedBox(width: 8.w),
        Expanded(
          flex: 1,
          child: BloodGlucoseCard(),
        ),
      ],
    ),
  );
}

Widget _getBloodGlucoseAverage() {
  final patientGlucoseRepository = sl<DiabetesRepository>();

  return FutureBuilder(
    future: patientGlucoseRepository.getBloodGlucoseOfLast7Days(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(child: CustomChasingDots(size: 50.sp));
      }
      if (!snapshot.hasData) {
        return HealthCard(
          value: 'N/A',
          average: 'Last 7 days Avg',
          label: 'Blood Glucose',
          onPressed: () {},
        );
      }

      return snapshot.data!.fold((error) {
        return HealthCard(
          value: 'N/A',
          average: 'Last 7 days Avg',
          label: 'Blood Glucose',
          onPressed: () {},
        );
      }, (success) {
        String glucoseLevel =
            (success.avgLevel != null) ? success.avgLevel.toString() : 'N/A';
        return HealthCard(
          value: '$glucoseLevel/10',
          average: 'Last 7 days Avg',
          label: 'Blood Glucose',
          onPressed: () {},
        );
      });
    },
  );
}

Widget _getBloodPressureAverage() {
  final patientBloodPressureRepository = sl<BloodPressureRepository>();

  return FutureBuilder<
      dartz.Either<ApiException, BloodPressureHistoryForLast7Days>>(
    future: patientBloodPressureRepository.getBloodPressureOfLast7Days(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return CustomChasingDots(size: 50.sp);
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
        (error) {
          return HealthCard(
            value: 'N/A',
            average: 'Last 7 days Avg',
            label: 'Blood Pressure',
            onPressed: () {
              // Define the action when the button is pressed
            },
          );
        },
        (success) {
          final systole = (success.avgSystolic ?? 0) > 0
              ? success.avgSystolic.toString()
              : 'N/A';
          final diastole = (success.avgDiastolic ?? 0) > 0
              ? success.avgDiastolic.toString()
              : '';
          return HealthCard(
            value: '$systole/$diastole',
            average: 'Last 7 days Avg',
            label: 'Blood Pressure',
            onPressed: () {},
          );
        },
      );
    },
  );
}
