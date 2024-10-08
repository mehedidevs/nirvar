import 'dart:io';
import 'dart:math';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nirvar/repository/patient_folder/patient_folder_repository.dart';
import 'package:nirvar/screens/utils/helper.dart';
import 'package:nirvar/screens/widgets/custom_chasing_dots.dart';
import 'package:path/path.dart' as path;

import '../../../../injection_container.dart';
import '../../../../models/selected_folder/selected_folder.dart';
import '../../../../repository/patient_file/patient_file_repository.dart';
import '../../../notification/notification_screen.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/assets_path.dart';
import '../../../utils/file_type.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/disabled_button.dart';
import '../../../widgets/labeled_text_form_field.dart';
import '../../../widgets/or_separator.dart';
import 'ocr/ocr_helper.dart';

class RandomlyPrescriptionUploadScreen extends StatefulWidget {
  const RandomlyPrescriptionUploadScreen({super.key});

  @override
  State<RandomlyPrescriptionUploadScreen> createState() =>
      _RandomlyPrescriptionUploadScreenState();
}

class _RandomlyPrescriptionUploadScreenState
    extends State<RandomlyPrescriptionUploadScreen> {
  final _folderRepository = sl<PatientFolderRepository>();
  final _fileRepository = sl<PatientFileRepository>();

  //File Handling
  File? _selectedFile;
  String? _fileName;
  int? _fileSize;

  //Folder Handling
  int? folderId;
  String? folderName;

  //Several Loading Handling
  bool _loading = false;
  bool _initialLoading = true;
  bool _isDialogShown = false;

  List<String> medicalDepartments = [
    "Anesthesiology",
    "Cardiology",
    "Dermatology",
    "Emergency Medicine",
    "Endocrinology",
    "Gastroenterology",
    "General Surgery",
    "Hematology",
    "Infectious Disease",
    "Internal Medicine",
    "Neonatology",
    "Nephrology",
    "Neurology",
    "Neurosurgery",
    "Gynecology",
    "Obstetrics",
    "Oncology",
    "Ophthalmology",
    "Orthopedics",
    "Otolaryngology (ENT)",
    "Pediatrics",
    "Plastic Surgery",
    "Psychiatry",
    "Pulmonology",
    "Radiology",
    "Rheumatology",
    "Urology",
    "Vascular Surgery",
    "Pathology",
    "Immunology",
    "Geriatrics",
    "Pain Management",
    "Rehabilitation Medicine",
    "Palliative Care",
    "Dentistry",
    "Sports Medicine",
    "Allergy and Immunology",
    "Family Medicine",
    "Nuclear Medicine",
    "Occupational Medicine",
    "Orthodontics",
    "Prosthodontics",
    "Oral and Maxillofacial Surgery",
    "Public Health",
    "Traumatology",
    "Thoracic Surgery",
    "Hepatology",
    "Audiology",
    "Sleep Medicine",
    "Medical Genetics",
    "Transplant Surgery",
    "Gynecology", // Explicitly mentioned separately
    "Andrology",
    "Bariatric Surgery",
    "Colorectal Surgery",
    "Critical Care Medicine",
    "Endodontics",
    "Gastrointestinal Surgery",
    "Hand Surgery",
    "Maxillofacial Surgery",
    "Nephrology",
    "Orthopedic Oncology",
    "Phlebology",
    "Proctology",
    "Psychosomatic Medicine",
    "Sexology",
    "Spine Surgery",
    "Trauma Surgery",
    "Vascular Medicine",
    "Clinical Immunology",
    "Addiction Medicine",
    "Hyperbaric Medicine",
    "Medical Toxicology",
    "Perinatology",
    "Forensic Medicine",
    "Genomic Medicine",
    "Laboratory Medicine",
    "Preventive Medicine",
    "Telemedicine",
    "Neurocritical Care",
    "Sleep Disorders Medicine",
    "Dermatopathology",
    "Pediatric Surgery",
    "Neonatal Surgery",
    "Hematologic Oncology",
    "Infectious Disease and Immunology",
    "Interventional Radiology"
  ];

  List<SelectedFolder> existingFolder = [];

  Future<void> _fetchSelectedFolder() async {
    try {
      final response = await _folderRepository.selectFolder();

      response.fold((error) {
        context.flushBarErrorMessage(message: error.message);
        setState(() {
          _initialLoading = false;
        });
      }, (success) {
        setState(() {
          existingFolder = success;
          _initialLoading = false;
        });
      });
    } catch (e) {
      print('ERROR : ${e.toString()}');
      setState(() {
        _initialLoading = false;
      });
    }
  }

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

  Stream<String?> processText(List<String> words) async* {
    for (String word in words) {
      // Perform binary search for exact match
      int exactMatchIndex =
          binarySearch(medicalDepartments, word.toLowerCase());
      if (exactMatchIndex != -1) {
        yield medicalDepartments[exactMatchIndex]; // Exact match found
        continue;
      }

      // Fuzzy matching for words that don't have an exact match
      double threshold = 0.65; // Set similarity threshold to 75%
      String? closestDepartment;
      double maxSimilarity = 0.0;

      for (String department in medicalDepartments) {
        double similarity =
            calculateSimilarity(word.toLowerCase(), department.toLowerCase());

        if (similarity >= threshold && similarity > maxSimilarity) {
          maxSimilarity = similarity;
          closestDepartment = department;
        }
      }

      // Yield the closest matching department if found
      if (closestDepartment != null) {
        yield closestDepartment;
      }
    }

    yield "No matching department found"; // Yield if no matches were found
  }

  //Work on the OCR
  Future<List<String>?> _extractText(String file) async {
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
    final InputImage inputImage = InputImage.fromFilePath(file);
    final RecognizedText recognizedText =
        await textRecognizer.processImage(inputImage);

    List<String> words = [];
    for (TextBlock block in recognizedText.blocks) {
      for (TextLine line in block.lines) {
        words.addAll(line.text.split(RegExp(r'\s+')));
        //need to find out the doctor name
      }
    }
    print(words);
    return words;
  }

  Stream<String?> processTextStream() async* {
    if (_selectedFile != null) {
      final extractedText = await _extractText(_selectedFile!.path);
      if (extractedText != null) {
        yield* processText(extractedText);
      }
    }
  }

  bool getExistingFolder(String folderName) {
    final folder = existingFolder.firstWhere(
      (folder) => folder.name?.toLowerCase() == folderName.toLowerCase(),
      orElse: () => const SelectedFolder(id: 0, name: 'N/A'),
    );

    if (folder.name != 'N/A') {
      //folderId = folder.id;
      setState(() {
        folderId = folder.id;
      });
      return true; // Folder exists, return true.
    } else {
      return false; // Folder does not exist, return false.
    }
  }

  //The Main Widget To Get The Folder ID
  void _showDepartmentDialog(BuildContext context, String department) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        final _formKey = GlobalKey<FormState>();
        TextEditingController _folderNameController = TextEditingController();
        _folderNameController.text = department;

        return Dialog(
          backgroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isKeyboardVisible =
                  MediaQuery.of(context).viewInsets.bottom > 0;
              return SizedBox(
                height: isKeyboardVisible
                    ? ScreenUtil().screenHeight *
                        0.45.h // Adjust height when keyboard is visible
                    : ScreenUtil().screenHeight * 0.45.h, // Default height

                child: Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Form(
                    key: _formKey,
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        Text(
                          'Confirm Folder Name',
                          style: TextStyle(
                            fontSize: 20.sp,
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
                              vertical: 0.h, horizontal: 16.w),
                          child: CustomButton(
                            text: 'Confirm',
                            onPressed: () async {
                              if (_formKey.currentState?.validate() ?? false) {
                                //Need to check in the existing folder Or Create New

                                if (getExistingFolder(
                                    _folderNameController.text)) {
                                  if (context.mounted) {
                                    Navigator.of(context).pop();
                                  }
                                } else {
                                  final response = await _folderRepository
                                      .createFolderForPrescription(
                                          _folderNameController.text);

                                  response.fold((failure) {}, (success) {
                                    folderId = success.id;

                                    if (context.mounted) {
                                      Navigator.of(context).pop();
                                    }
                                  });
                                }
                              }
                            },
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
  }

  @override
  void initState() {
    super.initState();
    _fetchSelectedFolder();
    medicalDepartments.sort((a, b) => a.compareTo(b));
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
      body: _initialLoading
          ? CustomChasingDots(size: 50.sp)
          : SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildCameraWidget(context),
                      SizedBox(height: 10.h),
                      OrSeparator(),
                      SizedBox(height: 10.h),
                      _buildGalleryWidget(context),

                      _buildCustomSpacer(),

                      _extractTextView(),

                      // (_selectedFile != null && folderId != null) ? _getUploadFile(context) : const SizedBox(),
                      _selectedFile != null
                          ? _getUploadFile(context)
                          : const SizedBox(),

                      _buildCustomSpacer(),
                      // Upload button

                      // (_selectedFile != null && folderId != null) ? Padding(
                      //                   padding: EdgeInsets.symmetric(
                      //                       horizontal: 32.w, vertical: 16.h),
                      //                   child: Center(
                      //                     child: _loading ? const CustomChasingDots() : _buildUploadButton(context),
                      //                   ),
                      //                 ) : _getDisabledButton(),
                      _selectedFile != null
                          ? Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 32.w, vertical: 16.h),
                              child: Center(
                                child: _loading
                                    ? const CustomChasingDots()
                                    : _buildUploadButton(context),
                              ),
                            )
                          : _getDisabledButton(),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Widget _extractTextView() {
    if (_selectedFile == null) {
      return const SizedBox();
    }

    return StreamBuilder<String?>(
      stream: processTextStream(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox();
        } else if (snapshot.hasError) {
          print('Error: ${snapshot.error}');
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData && snapshot.data != null) {
          if (!_isDialogShown) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              _showDepartmentDialog(context, snapshot.data!);
              _isDialogShown = true; // Mark as shown
            });
          }
          return const SizedBox();
        } else {
          return const SizedBox();
        }
      },
    );
  }

  Widget _buildUploadButton(BuildContext context) {
    return CustomButton(
      text: 'Upload',
      onPressed: () async {
        if (folderId != null || folderId != 0) {
          final response = await _fileRepository.uploadFile(
            folderId: folderId.toString(),
            file: _selectedFile!,
            type: FileType.prescription.value,
            fileName: _fileName!,
          );
          response.fold(
            (failure) {
              context.flushBarErrorMessage(message: failure.message);
            },
            (success) {
              context.flushBarSuccessMessage(message: success);
              setState(() {
                _fileName = null;
                _selectedFile = null;
              });
            },
          );
        }
      },
    );
  }

  Widget _getUploadFile(BuildContext context) {
    return Stack(
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
            contentPadding:
                EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
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
            trailing: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      final _formKey = GlobalKey<FormState>();
                      TextEditingController _fileReNameController =
                          TextEditingController();
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
                                    onPressed: () {
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
                                    Navigator.of(context)
                                        .pop(); // Close the dialog
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
    );
  }

  Widget _buildGalleryWidget(BuildContext context) {
    return DottedBorder(
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
                if (_selectedFile == null) {
                  _pickFile(ImageSource.gallery);
                } else {
                  context.flushBarErrorMessage(
                      message: 'You Have already Uploaded');
                }
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
    );
  }

  Widget _buildCameraWidget(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_selectedFile == null) {
          _pickFile(ImageSource.camera);
        } else {
          context.flushBarErrorMessage(message: 'You Have already Uploaded');
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
                  AssetsPath.scanNewSvg, // Replace with your actual asset path
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
    );
  }

  Widget _getDisabledButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      child: const Center(child: DisabledButton(buttonText: 'Upload')),
    );
  }

  Widget _buildCustomSpacer() =>
      SizedBox(height: ScreenUtil().screenHeight * .02.h);
}
