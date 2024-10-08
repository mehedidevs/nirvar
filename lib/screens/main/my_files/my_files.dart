import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nirvar/screens/main/my_files/upload/test_report_upload_screen.dart';
import 'package:nirvar/screens/utils/assets_path.dart';
import 'package:nirvar/screens/widgets/action_menu_button.dart';
import 'package:nirvar/screens/widgets/custom_alert_dialog.dart';
import 'package:popover/popover.dart';
import '../../../core/resources/api_exception.dart';
import '../../../injection_container.dart';
import '../../../models/patient_folder/patient_folder.dart';
import '../../../repository/patient_folder/patient_folder_repository.dart';
import '../../notification/notification_screen.dart';
import '../../utils/app_colors.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/edit_delete_menu.dart';
import '../../widgets/file_card.dart';
import '../../widgets/labeled_text_form_field.dart';

class MyFiles extends StatefulWidget {
  const MyFiles({super.key});

  @override
  State<MyFiles> createState() => _MyFilesState();
}

class _MyFilesState extends State<MyFiles> {



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _searchAndNotification(context),
                SizedBox(height: 16.h),
                _headerSection(context,
                    onCreateSuccess:()async{}),
                SizedBox(height: 16.h),
                _myFilesSection(),
                SizedBox(height: ScreenUtil().screenHeight * .1.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _searchAndNotification(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
                  child: SvgPicture.asset(AssetsPath.notificationWithBadgeSvg)),
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
    );
  }

  Widget _myFilesSection() {
    final patientFolderRepository = sl<PatientFolderRepository>();
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
            ),
            // Display error if there's an issue // Display error if there's an issue
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
                    },
                    onDeleteSuccess: () async {
                      setState(() {});
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

  Widget _headerSection(context, {required Future<void> Function() onCreateSuccess}) {
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

        ActionMenuButton(onCreateFolder: (){
          showDialog(
            context: context,
            builder: (context) {
              final _formKey = GlobalKey<FormState>();
              TextEditingController _folderNameController =
              TextEditingController();
              final patientFolderRepository = sl<PatientFolderRepository>();
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Create Folder',
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 32.h),
                        LabeledTextFormField(
                          label: 'Enter Folder Name',
                          hint: '',
                          controller: _folderNameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Folder Name';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 32.h),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 0.h, horizontal: 16.w),
                          child: CustomButton(
                            text: 'Save',
                            onPressed: () async {
                              if (_formKey.currentState?.validate() ?? false) {
                                print(_folderNameController.text);
                                final response = await patientFolderRepository.createFolder(_folderNameController.text);
                                setState(() {});
                                if (context.mounted) {
                                  Navigator.of(context).pop();
                                }
                              }
                            },
                          ),
                        ),
                        SizedBox(height: 8.h),
                        // Cancel Button
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Close the dialog
                          },
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors
                                  .primary, // Adjust the color as needed
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }, onFileUpload: (){
          showDialog(context: context, builder: (context){
            return CustomAlertDialog();
          });
        }),
      ],
    );
  }
}
