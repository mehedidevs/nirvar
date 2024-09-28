import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nirvar/screens/utils/helper.dart';
import '../../../../injection_container.dart';
import '../../../../repository/patient_file/patient_file_repository.dart';
import '../../../notification/notification_screen.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/assets_path.dart';
import '../../../utils/file_type.dart';
import '../../../widgets/custom_button.dart';
import 'package:path/path.dart' as path;
import '../../../widgets/disabled_button.dart';

class PrescriptionUploadScreen extends StatefulWidget {
  final  int folderId;
  const PrescriptionUploadScreen({super.key, required this.folderId});

  @override
  State<PrescriptionUploadScreen> createState() => _PrescriptionUploadScreenState();
}

class _PrescriptionUploadScreenState extends State<PrescriptionUploadScreen> {

  File? _selectedFile;
  final _repository = sl<PatientFileRepository>();
  String? _fileName;

  Future<void> _pickFile(ImageSource source) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _selectedFile = File(pickedFile.path);
        _fileName = path.basename(pickedFile.path);
      });
    }
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
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
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
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DottedBorder(
                  color: AppColors.primary.withOpacity(0.5),
                  borderType: BorderType.RRect,
                  radius: Radius.circular(12.r),
                  dashPattern: [6, 3],
                  strokeWidth: 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(12.r)),
                    child: Container(
                      color: AppColors.primary.withOpacity(.2),
                      width: double.infinity,
                      padding: EdgeInsets.all(20.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          SizedBox(height: 20.h),

                          SvgPicture.asset(
                            AssetsPath.scanNewSvg, // Replace with your actual asset path
                            height: 60.h,
                            width: 60.w,
                          ),
                          SizedBox(height: 20.h),
                          GestureDetector(
                            onTap: (){
                              _pickFile(ImageSource.camera);
                            },
                            child: Text(
                              'Scan',
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.black.withOpacity(0.4),
                              ),
                            ),
                          ),
                          SizedBox(height: 20.h),
                        ],
                      ),
                    ),
                  ),
                ),
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
                          AssetsPath.uploadSvg, // Replace with your actual asset path
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
                            _pickFile(ImageSource.gallery);
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: AppColors.paleLight,
                            side: BorderSide(color: Colors.grey.withOpacity(0.5)),
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
          _selectedFile != null
              ? Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 32.w, vertical: 16.h),
            child: Center(
              child: CustomButton(
                text: 'Upload',
                onPressed: () async {
                  final response =   await _repository.uploadFile(
                    folderId: widget.folderId.toString(),
                    file: _selectedFile!,
                    type: FileType.prescription.value,
                    fileName: _fileName!,
                  );
                  response.fold((failure){
                    context.flushBarErrorMessage(message: failure.message);
                  }, (success){
                    context.flushBarSuccessMessage(message: success);
                    setState(() {
                      _fileName = null;
                      _selectedFile = null;});
                  },);
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

            trailing: const Text(
              'Rename',
              style: TextStyle(color: AppColors.red),
            ),
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
