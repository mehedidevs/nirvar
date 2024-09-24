import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nirvar/models/patient_folder/patient_folder.dart';
import 'package:nirvar/screens/auth/change_password.dart';
import 'package:nirvar/screens/details/report_screen.dart';
import 'package:nirvar/screens/utils/app_colors.dart';
import 'package:nirvar/screens/utils/assets_path.dart';
import 'package:nirvar/screens/utils/helper.dart';
import 'package:nirvar/screens/widgets/labeled_text_form_field.dart';

import '../../injection_container.dart';
import '../../repository/patient_folder/patient_folder_repository.dart';
import '../main/my_files/scanner/qr_code_screen.dart';
import 'custom_button.dart';
import 'edit_delete_menu.dart';

class FileCard extends StatelessWidget {
  final PatientFolder patientFolder;


 const FileCard({required this.patientFolder});



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ReportScreen(title: patientFolder.name)));
      },
      child: Container(
        padding: EdgeInsets.all(12.w),  // Responsive padding
        decoration: BoxDecoration(
          color: AppColors.pale,
          borderRadius: BorderRadius.circular(16.r), // Responsive corner radius
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8.r,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Image.asset(
                    AssetsPath.fileCardPng,
                    width: 48.sp,
                    height: 48.sp,
                  ),

                  const Spacer(),  // Responsive spacing
                  Text(
                    patientFolder.name,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    '${patientFolder.fileCount ?? 0} Files',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 8.h),
                ],
              ),
            ),
            Flexible(
              child: Column(
                children: [
                  // GestureDetector(
                  //   onTap:(){
                  //     _showPopupMenu(context);
                  //   },
                  //   child: Icon(
                  //     Icons.more_vert,
                  //     size: 20.sp,
                  //     color: Colors.grey,
                  //   ),
                  // ),

                  EditDeleteMenu(
                      onEdit: (){
                        showDialog(
                          context: context,
                          builder: (context){
                          final _formKey = GlobalKey<FormState>();
                          TextEditingController _folderNameController = TextEditingController();
                          _folderNameController.text = patientFolder.name;
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
                                      patientFolder.name,
                                      style: TextStyle(
                                        fontSize: 24.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(height: 32.h),
                                    LabeledTextFormField(
                                        label: 'Edit Folder Name',
                                        hint: '',
                                        controller: _folderNameController,
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
                                             final response = await patientFolderRepository.updateFolder(patientFolder.id, _folderNameController.text);
                                             if(context.mounted){
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
                      onDelete: (){
                        showDialog(
                          context: context,
                          builder: (context){
                            final patientFolderRepository = sl<PatientFolderRepository>();
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(16.w),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SvgPicture.asset(AssetsPath.deleteLogoSvg),
                                    SizedBox(height: 16.h),
                                    Text(
                                      'Are you sure you want to delete this folder?',
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                      maxLines: 2,
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(height: 32.h),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 0.h, horizontal: 16.w),
                                      child: CustomButton(
                                        text: 'Delete',
                                        onPressed: () async {
                                          patientFolderRepository.deleteFolder(patientFolder.id);
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
                            );
                          },);
                      },
                  ),

                  const Spacer(),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => QrCodeScreen()));
                    },
                    child: Icon(
                      Icons.share,
                      size: 20.sp,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }



  void _deleteAction(BuildContext context, int folderId) {

  }

  void _showPopupMenu(BuildContext context) {
    showMenu(
      context: context,
      color: AppColors.white,
      position: const RelativeRect.fromLTRB(200.0, 200.0, 0.0, 0.0),
      items: <PopupMenuEntry>[
        PopupMenuItem(
          value: 'edit',
          child: Row(
            children: [
              Text('Edit', style: TextStyle(fontSize: 16.sp)),
              Spacer(),
              const Icon(Icons.edit, color: Colors.black),
            ],
          ),
        ),
        PopupMenuDivider(),
        PopupMenuItem(
          value: 'delete',
          child: Row(
            children: [
              Text('Delete', style: TextStyle(fontSize: 16.sp, color: Color(0xFFE39087))),
              Spacer(),
              Icon(Icons.delete, color: Color(0xFFE39087)),
            ],
          ),
        ),
      ],
    ).then((value) {
      if (value != null) {
        switch (value) {
          case 'edit':

            break;
          case 'delete':

            break;
        }
      }
    });
  }
}
