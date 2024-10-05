import 'dart:io';
import 'dart:math';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nirvar/models/selected_folder/selected_folder.dart';
import 'package:nirvar/repository/patient_folder/patient_folder_repository.dart';
import 'package:nirvar/screens/auth/change_password.dart';
import 'package:nirvar/screens/utils/helper.dart';
import 'package:path/path.dart' as path;

import '../../../../injection_container.dart';
import '../../../../repository/patient_file/patient_file_repository.dart';
import '../../../notification/notification_screen.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/assets_path.dart';
import '../../../utils/file_type.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_dropdown.dart';
import '../../../widgets/disabled_button.dart';
import '../../../widgets/labeled_text_form_field.dart';

class RandomlyTestReportUploadScreen extends StatefulWidget {
  const RandomlyTestReportUploadScreen({super.key});

  @override
  State<RandomlyTestReportUploadScreen> createState() =>
      _RandomlyTestReportUploadScreenState();
}

class _RandomlyTestReportUploadScreenState
    extends State<RandomlyTestReportUploadScreen> {
  String? _selectedCategory;

  File? _selectedFile;
  String? _fileName;
  int? _fileSize;

  final _fileRepository = sl<PatientFileRepository>();
  final _folderRepository = sl<PatientFolderRepository>();
  List<SelectedFolder> selectedFolder = [];
  int? folderId;

  Future<void> _pickFile() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _selectedFile = File(image.path);
        _fileName = path.basename(image.path);
        _fileSize = File(image.path).lengthSync();
      });
    }
  }

  String getFileSizeString({required int bytes, int decimals = 0}) {
    if (bytes <= 0) return "0 Bytes";
    const suffixes = [" Bytes", "KB", "MB", "GB", "TB"];
    var i = (log(bytes) / log(1024)).floor();
    return ((bytes / pow(1024, i)).toStringAsFixed(decimals)) + suffixes[i];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          'Upload',
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(true),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const NotificationScreen(hasNotification: true),
                  ),
                );
              },
              icon: SvgPicture.asset(AssetsPath.notificationWithBadgeSvg))
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30.h),
                DottedBorder(
                  color: AppColors.primary.withOpacity(0.5),
                  borderType: BorderType.RRect,
                  radius: Radius.circular(12.r),
                  dashPattern: [6, 3],
                  strokeWidth: 1,
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(20.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          AssetsPath.uploadSvg,
                          // Replace with your actual asset path
                          height: 60.h,
                          width: 60.w,
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          'Select your file(s) to upload',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.black.withOpacity(0.4),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        ElevatedButton(
                          onPressed: () {
                            _pickFile();
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: AppColors.paleLight,
                            side:
                                BorderSide(color: Colors.grey.withOpacity(0.5)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                          child: Text(
                            'Browse Files',
                            style: TextStyle(fontSize: 14.sp),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 30.h),
                Text(
                  'Select Category',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10.h),

                FutureBuilder(
                    future: _folderRepository.selectFolder(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return SizedBox();
                      }

                      if (!snapshot.hasData) {
                        return SizedBox();
                      }

                      return snapshot.data!.fold((failure) {
                        context.flushBarErrorMessage(message: failure.message);
                        return CustomDropdown(
                          hintText: 'Choose a Category',
                          icon: SvgPicture.asset(
                            AssetsPath.stackSvg,
                            fit: BoxFit.scaleDown,
                          ),
                          items: const ['No Folder Found'],
                          selectedValue: _selectedCategory,
                          onChanged: (newValue) {},
                        );
                      }, (success) {
                        selectedFolder = success;
                        List<String> folderNames = selectedFolder
                            .map((folder) => folder.name ?? '')
                            .toList();
                        return CustomDropdown(
                          hintText: 'Choose a Category',
                          icon: SvgPicture.asset(
                            AssetsPath.stackSvg,
                            fit: BoxFit.scaleDown,
                          ),
                          items: folderNames,
                          selectedValue: _selectedCategory,
                          onChanged: (newValue) {
                            setState(() {
                              _selectedCategory = newValue;

                              final selectedFolderObject =
                                  selectedFolder.firstWhere(
                                      (folder) => folder.name == newValue);
                              folderId = selectedFolderObject.id ?? 0;
                              print("SELECTED FOLDER ID : $folderId");
                            });
                          },
                        );
                      });
                    }),

                _selectedFile != null
                    ? Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 32.w, vertical: 16.h),
                        child: Center(
                          child: CustomButton(
                            text: 'Upload',
                            onPressed: () async {
                              if (_selectedCategory == null ||
                                  _selectedFile == null ||
                                  folderId == null) {
                                context.flushBarErrorMessage(
                                    message: 'Select A Folder');
                              } else {
                                final response =
                                    await _fileRepository.uploadFile(
                                  folderId: folderId.toString(),
                                  file: _selectedFile!,
                                  type: FileType.testReport.value,
                                  fileName: _fileName!,
                                );
                                response.fold(
                                  (failure) {
                                    context.flushBarErrorMessage(
                                        message: failure.message);
                                  },
                                  (success) {
                                    context.flushBarSuccessMessage(
                                        message: success);
                                    setState(() {
                                      _fileName = null;
                                      _selectedFile = null;
                                      folderId = null;
                                    });
                                  },
                                );
                              }
                            },
                          ),
                        ),
                      )
                    : Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 4.h),
                        child:
                            Center(child: DisabledButton(buttonText: 'Upload')),
                      ),

                SizedBox(height: ScreenUtil().screenHeight * .02.h),
                // Upload button
                _selectedFile != null
                    ? ListTile(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 4.h),
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(12.r),
                          child: Image.file(
                            _selectedFile!,
                            height: 50.h,
                            width: 50.w,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(
                          _fileName ?? '',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF2C3E50),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                        ),
                        subtitle: Text(
                          getFileSizeString(
                            bytes: _fileSize ?? 0,
                          ),
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.grey,
                          ),
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context){
                                final _formKey = GlobalKey<FormState>();
                                TextEditingController _fileReNameController = TextEditingController();
                                _fileReNameController.text = _fileName ?? '';
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
                                           _fileName ?? '',
                                            style: TextStyle(
                                              fontSize: 24.sp,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(height: 32.h),
                                          LabeledTextFormField(
                                            label: 'Edit File Name',
                                            hint: '',
                                            controller: _fileReNameController,
                                            validator: (value){
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
                                                if(_formKey.currentState?.validate() ?? false){
                                                  setState(() {
                                                    _fileName = _fileReNameController.text;
                                                  });
                                                  Navigator.of(context).pop();
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
                                                color: AppColors.primary, // Adjust the color as needed
                                              ),
                                            ),
                                          ),
                                        ],

                                      ),
                                    ),
                                  ),
                                );
                              },);
                          },
                          icon: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.edit, // Use the icon you want for the rename action
                                color: AppColors.red,
                              ),
                              SizedBox(width: 4), // Add some space between icon and text
                              Text(
                                'Rename',
                                style: TextStyle(color: AppColors.red),
                              ),
                            ],
                          ),
                        )
                  ,
                        // trailing: Icon(
                        //   Icons.more_vert,
                        //   color: Colors.black38,
                        // ),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
