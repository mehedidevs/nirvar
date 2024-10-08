import 'dart:io';
import 'dart:math';
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
import '../../../widgets/custom_chasing_dots.dart';
import '../../../widgets/disabled_button.dart';
import '../../../widgets/labeled_text_form_field.dart';
import '../../../widgets/or_separator.dart';

class PrescriptionUploadScreen extends StatefulWidget {
  final int folderId;
  const PrescriptionUploadScreen({super.key, required this.folderId});
  @override
  State<PrescriptionUploadScreen> createState() =>
      _PrescriptionUploadScreenState();
}

class _PrescriptionUploadScreenState extends State<PrescriptionUploadScreen> {
  File? _selectedFile;
  final _repository = sl<PatientFileRepository>();
  String? _fileName;
  int? _fileSize;

  bool _loading = false;

  Future<void> _pickFile(ImageSource source) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _selectedFile = File(pickedFile.path);
        _fileName = path.basename(pickedFile.path);
        _fileSize = File(pickedFile.path).lengthSync();
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
          onPressed: () => Navigator.of(context).pop(),
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
                GestureDetector(
                  onTap: () {
                    if(_selectedFile == null){
                      _pickFile(ImageSource.camera);
                    }else{
                      context.flushBarErrorMessage(
                          message: 'You Have already Uploaded');
                    }
                  },
                  child: DottedBorder(
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
                              AssetsPath.scanNewSvg,
                              // Replace with your actual asset path
                              height: 60.h,
                              width: 60.w,
                            ),
                            SizedBox(height: 20.h),
                            Text(
                              'Scan',
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.black.withOpacity(0.4),
                              ),
                            ),
                            SizedBox(height: 20.h),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                OrSeparator(),
                SizedBox(height: 10.h),
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
                            if(_selectedFile == null){
                              _pickFile(ImageSource.gallery);
                            }else{
                              context.flushBarErrorMessage(
                                  message: 'You Have already Uploaded');
                            }

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

                SizedBox(height: ScreenUtil().screenHeight * .02.h),

                _selectedFile != null
                    ? Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.pale,
                        borderRadius: BorderRadius.circular(20.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 5.r,
                            offset: Offset(0, 4.h),
                          ),
                        ],
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
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
                        trailing:  InkWell(
                          onTap: (){
                            showDialog(
                                context: context,
                                builder: (context){
                                  final _formKey = GlobalKey<FormState>();
                                  TextEditingController _fileReNameController = TextEditingController();
                                  _fileReNameController.text = _fileName ?? ' ';
                                  return Dialog(
                                    backgroundColor: AppColors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16.r),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(16.w),
                                      child: Form(
                                        key: _formKey,
                                        child: ListView(
                                          shrinkWrap: true,
                                          children: [
                                            Text(
                                              _fileName ?? '',
                                              style: TextStyle(
                                                fontSize: 24.sp,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                              textAlign: TextAlign.center,
                                              maxLines: 1,
                                              overflow: TextOverflow.fade,
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
                                                onPressed: ()  {
                                                  setState(() {
                                                    _fileName = _fileReNameController.text;
                                                  });
                                                  Navigator.of(context).pop();
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
                                });
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SvgPicture.asset(AssetsPath.penSvg),
                              2.horizontalSpace,
                              const Text(
                                'Rename',
                                style: TextStyle(color: AppColors.softCoral),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Add the circular red cross button here
                    Positioned(
                      top: -10.h,
                      right: -10.w,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedFile = null;
                            _fileName = null;
                          });
                        },
                        child: Container(
                          width: 24.w,
                          height: 24.h,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 4.r,
                                offset: Offset(0, 2.h),
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.close,
                            size: 16.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
                    : const SizedBox(),

                SizedBox(height: ScreenUtil().screenHeight * .02.h),
                // Upload button

                _selectedFile != null
                    ? Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 32.w, vertical: 16.h),
                        child: Center(
                          child:  _loading ? const CustomChasingDots()
                              :CustomButton(
                            text: 'Upload',
                            onPressed: () async {
                              setState(() {
                                _loading = true;
                              });
                              final response = await _repository.uploadFile(
                                folderId: widget.folderId.toString(),
                                file: _selectedFile!,
                                type: FileType.prescription.value,
                                fileName: _fileName!,
                              );
                              response.fold(
                                (failure) {
                                  context.flushBarErrorMessage(
                                      message: failure.message);
                                  setState(() {
                                    _loading = false;
                                  });
                                },
                                (success) {
                                  context.flushBarSuccessMessage(
                                      message: success);
                                  setState(() {
                                    _fileName = null;
                                    _selectedFile = null;
                                    _loading = false;
                                  });
                                },
                              );
                            },
                          ),
                        ),
                      )
                    : Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 4.h),
                        child:
                            const Center(child: DisabledButton(buttonText: 'Upload')),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
