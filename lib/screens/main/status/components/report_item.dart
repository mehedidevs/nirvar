import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nirvar/models/latest_uploaded_files/latest_uploaded_file.dart';
import 'package:nirvar/repository/patient_file/patient_file_repository.dart';
import 'package:nirvar/screens/utils/app_colors.dart';
import 'package:nirvar/screens/widgets/edit_delete_menu.dart';

import '../../../../injection_container.dart';
import '../../../utils/assets_path.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/labeled_text_form_field.dart';

class ReportListView extends StatefulWidget {
  final List<LatestUploadedFile> reports;
  final Future<void> Function() onRenameSuccess;
  final Future<void> Function() onDeleteSuccess;

  const ReportListView({Key? key, required this.reports, required this.onRenameSuccess, required this.onDeleteSuccess}) : super(key: key);

  @override
  State<ReportListView> createState() => _ReportListViewState();
}

class _ReportListViewState extends State<ReportListView> {
  final _repository = sl<PatientFileRepository>();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: widget.reports.length,
      itemBuilder: (context, index) {
        final report = widget.reports[index];
        final bool isEven = index % 2 == 0;
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 2.h),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
            elevation: 2,
            child: ListTile(
              leading: Container(
                height: 50.h,
                width: 60.w,
                decoration: BoxDecoration(
                  color: isEven ?  AppColors.blueLight : AppColors.greenLight,
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: Padding(
                  padding:  EdgeInsets.symmetric(vertical: 8.h,horizontal: 4.w),
                  child: Center(
                    child: Image.network(
                      report.path,
                      height: 30.h,
                      width: 40.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              title: Text(
                report.name,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.fade,
              ),
              subtitle: Text(
                report.createdAt,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.black.withOpacity(0.6),
                ),
              ),
              trailing: EditDeleteMenu(
                  onEdit: (){
                    showDialog(
                      context: context,
                      builder: (context){
                        final _formKey = GlobalKey<FormState>();
                        TextEditingController _fileReNameController = TextEditingController();
                        _fileReNameController.text = report.rename ?? '';
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
                                    report.name ?? '',
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
                                    label: 'Edit Folder Name',
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
                                          final response = await _repository.renameFile(report.folderId, report.id, report.type, _fileReNameController.text);
                                          response.fold((failure){
                                            if(context.mounted){
                                              Navigator.of(context).pop();
                                            }
                                          }, (success){
                                           widget.onRenameSuccess();
                                            if(context.mounted){
                                              Navigator.of(context).pop();
                                            }
                                          }
                                            ,);

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
                                    final response = await _repository.deleteFile(report.id);
                                    response.fold((failure){
                                      if(context.mounted){
                                        Navigator.of(context).pop();
                                      }
                                    }, (success){
                                      widget.onDeleteSuccess();
                                      if(context.mounted){
                                        Navigator.of(context).pop();
                                      }
                                    },
                                    );
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
              tileColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            ),
          ),
        );
      },
    );
  }
}
