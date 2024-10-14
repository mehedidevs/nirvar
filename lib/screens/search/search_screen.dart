import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nirvar/models/patient_folder/patient_folder.dart';
import 'package:nirvar/repository/patient_file/patient_file_repository.dart';
import 'package:nirvar/screens/utils/helper.dart';
import 'package:nirvar/screens/widgets/custom_chasing_dots.dart';

import '../../injection_container.dart';
import '../../models/patient_files/patient_file.dart';
import '../../models/search_response/search_response_data.dart';
import '../../repository/patient_folder/patient_folder_repository.dart';
import '../details/file_details_screen.dart';
import '../utils/app_colors.dart';
import '../utils/assets_path.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textInput.dart';
import '../widgets/edit_delete_menu.dart';
import '../widgets/file_card.dart';
import '../widgets/labeled_text_form_field.dart';



class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final _repository = sl<PatientFolderRepository>();

  SearchResponseData? _searchData;
  bool _isLoading = false;
  String? _errorMessage;

  void _onSearch() async {
    if (_searchController.text.isNotEmpty) {
      setState(() {
        _isLoading = true;
        _errorMessage = null;
      });

      try {
        final response = await _repository.getSearchData(_searchController.text);

        response.fold((failure){
                  setState(() {
                    _errorMessage = failure.toString();
                    _isLoading = false;
                  });
        }, (success){
          setState(() {
            _searchData = success;
            _isLoading = false;
          });
        });

      } catch (e) {
        setState(() {
          _errorMessage = 'Error fetching data: $e';
          _isLoading = false;
        });
      }
    } else {
      context.flushBarErrorMessage(message: 'Search input cannot be empty');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const CustomAppBar(title: 'Search'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomTextField(
                  hint: 'Enter search data...',
                  keyboardType: TextInputType.text,
                  controller: _searchController,
                  prefixIcon: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Icon(
                      Icons.search,
                      color: AppColors.primary,
                      size: 24.sp,
                    ),
                  ),
                  onFieldSubmitted: (value) {
                    _onSearch();
                  },
                ),
                SizedBox(height: 16.h),
                if (_isLoading)
                  Center(child: CustomChasingDots(size: 50.sp)) // A custom loading widget
                else if (_errorMessage != null)
                  Text(
                    _errorMessage!,
                    style: TextStyle(color: Colors.red),
                  )
                else if (_searchData != null)
                    _buildSearchResults(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSearchResults() {
    final folders = _searchData?.folders ?? [];
    final files = _searchData?.files ?? [];

    if (folders.isEmpty && files.isEmpty) {
      return _nothingFound();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (folders.isNotEmpty) ...[
          Text( '${folders.length} Folder${folders.length > 1 ? 's' : ''} Found', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold,color: AppColors.grey)),
          10.verticalSpace,
          _foundedFolders(folders),
          SizedBox(height: 16.h),
        ],
        if (files.isNotEmpty) ...[
          Text( '${files.length} File${files.length > 1 ? 's' : ''} Found', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold,color: AppColors.grey)),
          10.verticalSpace,
          _foundedFiles(files)
        ],
      ],
    );
  }

  Widget _nothingFound() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('0 Results found.',style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold,color: AppColors.grey)),
        SizedBox(height: ScreenUtil().screenHeight * .15.h),
        Center(
          child: Image.asset(
            AssetsPath.noResultPng, // Your image path
            height: 150.h,  // Adjust height for responsiveness
            width: 150.w,   // Adjust width for responsiveness
            fit: BoxFit.contain, // Ensure the image fits within the given size
          ),
        ),
      ],
    );
  }

  Widget _foundedFolders(List<PatientFolder> folders) {
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
  }

  Widget _foundedFiles(List<PatientFile> files) {
    return ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: files.map((file) {
            return _healthItem(context,file,
                onDeleteSuccess:(String message)async{
                  setState(() {});
                },
                onRenameSuccess:(String message)async{
                  setState(() {});
                },
                fileType: file.type ?? ''
            );
          }).toList(),
        );
  }

  Widget _healthItem(BuildContext context,PatientFile file,
      {required Future<void> Function(String message)onDeleteSuccess,
        required Future<void> Function(String message)onRenameSuccess,
        required String fileType,
      }) {
    return GestureDetector(
      onTap: () async {
        final result = await  Navigator.push(context, MaterialPageRoute(builder: (context) => ReportDetailsScreen(file: file,)));
        if(result!=null && result == true){
          setState(() {

          });
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
        decoration: BoxDecoration(
          color: AppColors.pale, // Light background color
          borderRadius: BorderRadius.circular(20.r), // Rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5.r,
              offset: Offset(0, 4.h),
            ),
          ],
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.network(
              file.path!,
              height: 50.h,
              width: 50.w,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(
            file.name ?? '',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF2C3E50),

            ),
            maxLines: 1,
            overflow: TextOverflow.fade,
          ),
          subtitle:Wrap(
            children: [
              Text(
                file.folderName ?? "",
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.grey.shade400,
                ),
                maxLines: 1,
                overflow: TextOverflow.fade,
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 8.w,vertical: 8.h),
                child: Container(
                  height: 5.sp,
                  width: 5.sp,
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Text(
                file.createdAt ?? "",
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.grey.shade400,
                ),
              ),
            ],
          ),

          trailing: EditDeleteMenu(
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
                                final response = await sl<PatientFileRepository>().deleteFile(file.fileId);
                                response.fold((failure){
                                  if(context.mounted){
                                    Navigator.of(context).pop();
                                  }
                                }, (success){
                                  onDeleteSuccess(success);
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
            onEdit: (){
              showDialog(
                context: context,
                builder: (context){
                  final _formKey = GlobalKey<FormState>();
                  TextEditingController _fileReNameController = TextEditingController();
                  _fileReNameController.text = file.rename ?? '';
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
                              file.name ?? '',
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
                                    final response = await sl<PatientFileRepository>().renameFile(file.folderId, file.fileId, fileType, _fileReNameController.text);
                                    response.fold((failure){
                                      if(context.mounted){
                                        Navigator.of(context).pop();
                                      }
                                    }, (success){
                                      onRenameSuccess(success);
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
          ),
        ),
      ),
    );
  }
}
