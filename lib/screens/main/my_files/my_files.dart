import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nirvar/bloc/patient_folder/patient_folder_bloc.dart';
import 'package:nirvar/screens/search/search_screen.dart';
import 'package:nirvar/screens/utils/assets_path.dart';
import 'package:nirvar/screens/utils/helper.dart';
import 'package:nirvar/screens/widgets/action_menu_button.dart';
import 'package:nirvar/screens/widgets/custom_alert_dialog.dart';
import 'package:nirvar/screens/widgets/custom_chasing_dots.dart';
import '../../../core/resources/api_exception.dart';
import '../../../injection_container.dart';
import '../../../models/patient_folder/patient_folder.dart';
import '../../../repository/patient_folder/patient_folder_repository.dart';
import '../../notification/notification_screen.dart';
import '../../utils/app_colors.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/file_card.dart';
import '../../widgets/labeled_text_form_field.dart';

class MyFiles extends StatefulWidget {
  const MyFiles({super.key});
  @override
  State<MyFiles> createState() => _MyFilesState();
}

class _MyFilesState extends State<MyFiles> {

  @override
  void initState() {
    super.initState();
    context.read<PatientFolderBloc>().add(GetPatientFolderFromApi());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<PatientFolderBloc>().add(GetPatientFolderFromApi());
  }

  @override
  void didUpdateWidget(covariant MyFiles oldWidget) {
    super.didUpdateWidget(oldWidget);

    if(sl<PatientFolderBloc>().state.status == PatientFolderStatus.initial){
      context.read<PatientFolderBloc>().add(GetPatientFolderFromApi());
    }

  }

  @override
  Widget build(BuildContext context) {

    // return Scaffold(
    //   backgroundColor: AppColors.white,
    //   resizeToAvoidBottomInset: false,
    //   body: SafeArea(
    //     child: SingleChildScrollView(
    //       child: Padding(
    //         padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           mainAxisAlignment: MainAxisAlignment.start,
    //           children: [
    //             _searchAndNotification(context),
    //             SizedBox(height: 16.h),
    //             _headerSection(context,
    //                 onCreateSuccess:()async{}),
    //             SizedBox(height: 16.h),
    //
    //             _myFilesSectionAlternative(),
    //
    //             SizedBox(height: ScreenUtil().screenHeight * .15.h),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );

    return  BlocListener<PatientFolderBloc, PatientFolderState>(
        listener: (context, state) {
          if (state.status == PatientFolderStatus.success) {
            // Success state: Trigger any additional UI updates or side effects here
            print("Folders updated successfully");
          }
          if(state.status == PatientFolderStatus.initial){
            context.read<PatientFolderBloc>().add(GetPatientFolderFromApi());
          }
        },
        child:Scaffold(
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

                    _myFilesSectionAlternative(),

                    SizedBox(height: ScreenUtil().screenHeight * .15.h),
                  ],
                ),
              ),
            ),
          ),
        ),
    );
  }

  //Going to implement BLOC in this section
  Widget _myFilesSectionAlternative(){
    return BlocBuilder<PatientFolderBloc,PatientFolderState>(
      builder: (context,state){
        if (state.status == PatientFolderStatus.loading) {
          return Center(child: CustomChasingDots(size: 50.sp));
        }else if (state.status == PatientFolderStatus.failure) {
          // Show an error message if data fetching fails
          return Center(child: Text('Error: ${state.errorMessage}', style: const TextStyle(color: AppColors.primary)));
        }else if(state.status == PatientFolderStatus.success){

          print( "Folder Details: ${state.folderList}");

          return state.folderList.isEmpty ? const Center(
              child: Text(
                'No folders available',
                style: TextStyle(color: AppColors.primary),
              ))
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
                  context.read<PatientFolderBloc>().add(GetPatientFolderFromApi());
                },
                onDeleteSuccess: () async {
                  context.read<PatientFolderBloc>().add(DeletePatientFolderList(folder.folderId.toString()));
                  context.read<PatientFolderBloc>().add(GetPatientFolderFromApi());
                },
                onComingBack: () async {
                  context.read<PatientFolderBloc>().add(GetPatientFolderFromApi());
                },
              );
            }).toList(),
          );
        }else {
          // Default UI when no action is happening
          return const SizedBox();
        }
      },
    );
  }

  Widget _searchAndNotification(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () async {
            bool? result;
           result = await Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchScreen()));
             if(result == true){
               if(context.mounted){
                 context.read<PatientFolderBloc>().add(GetPatientFolderFromApi());
               }
             }
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
                    const NotificationScreen(isComingFromNotification: true),
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

  Widget _headerSection(BuildContext context, {required Future<void> Function() onCreateSuccess}) {
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

        ActionMenuButton(
          onCreateFolder: (){
          showDialog(
            context: context,
            builder: (context) {
              final _formKey = GlobalKey<FormState>();
              TextEditingController _folderNameController = TextEditingController();
              final patientFolderRepository = sl<PatientFolderRepository>();

              return Dialog(
                backgroundColor: AppColors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;
                    return SizedBox(
                      height: isKeyboardVisible
                          ? ScreenUtil().screenHeight * 0.45.h // Adjust height when keyboard is visible
                          : ScreenUtil().screenHeight * 0.45.h, // Default height

                      child: Padding(
                        padding: EdgeInsets.all(16.w),
                        child: Form(
                          key: _formKey,
                          child: ListView(
                           shrinkWrap: true,
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
                              SizedBox(height: 16.h),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 0.h,
                                    horizontal: 16.w
                                ),
                                child: CustomButton(
                                  text: 'Save',
                                  onPressed: () async {
                                    if (_formKey.currentState?.validate() ?? false) {
                                      final response = await patientFolderRepository.createFolderForPrescription(_folderNameController.text);
                                      response.fold((failure){
                                        if (context.mounted) {
                                          Navigator.of(context).pop();
                                        }
                                      }, (success){
                                        final newFolder = success.toPatientFolder();
                                        context.read<PatientFolderBloc>().add(UpdatePatientFolderList(newFolder));
                                        if (context.mounted) {
                                          Navigator.of(context).pop();
                                        }
                                      });

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
                                    color: AppColors.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          );

        },
          onFileUpload: () async {
        final result = await  showDialog(context: context, builder: (context){
            return CustomAlertDialog();
          });

        if(result == true){
           if(context.mounted){
             context.read<PatientFolderBloc>().add(GetPatientFolderFromApi());
           }
        }
        },),
      ],
    );
  }
}
