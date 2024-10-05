import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nirvar/screens/utils/helper.dart';
import 'package:path/path.dart' as path;

import '../../../../injection_container.dart';
import '../../../../repository/patient_file/patient_file_repository.dart';
import '../../../notification/notification_screen.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/assets_path.dart';
import '../../../utils/file_type.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/disabled_button.dart';
import 'ocr/ocr_helper.dart';

class RandomlyPrescriptionUploadScreen extends StatefulWidget {
  const RandomlyPrescriptionUploadScreen({super.key});

  @override
  State<RandomlyPrescriptionUploadScreen> createState() => _RandomlyPrescriptionUploadScreenState();
}

class _RandomlyPrescriptionUploadScreenState extends State<RandomlyPrescriptionUploadScreen> {

  File? _selectedFile;
  final _repository = sl<PatientFileRepository>();
  String? _fileName;
  int? folderId;
  String? folderName;

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

  Stream<String?> processText(List<String> words) async* {
    for (String word in words) {
      // Perform binary search for exact match
      int exactMatchIndex = binarySearch(medicalDepartments, word.toLowerCase());
      if (exactMatchIndex != -1) {
        yield medicalDepartments[exactMatchIndex]; // Exact match found
        continue;
      }

      // Fuzzy matching for words that don't have an exact match
      double threshold = 0.65; // Set similarity threshold to 75%
      String? closestDepartment;
      double maxSimilarity = 0.0;

      for (String department in medicalDepartments) {
        double similarity = calculateSimilarity(word.toLowerCase(), department.toLowerCase());

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
    final RecognizedText recognizedText = await textRecognizer.processImage(inputImage);

    List<String> words = [];
    for (TextBlock block in recognizedText.blocks) {
      for (TextLine line in block.lines) {
        words.addAll(line.text.split(RegExp(r'\s+')));
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


  void _showDepartmentDialog(BuildContext context, String department) {
    TextEditingController departmentController = TextEditingController();
    departmentController.text = department;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text('Detected Department'),
          content: TextField(
            controller: departmentController,
            decoration: const InputDecoration(
              labelText: 'Department Name',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  folderName = departmentController.text;
                });
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }


  @override
  void initState() {
    super.initState();
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
                (_selectedFile != null && folderId != null)
                    ? Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 32.w, vertical: 16.h),
                  child: Center(
                    child: CustomButton(
                      text: 'Upload',
                      onPressed: () async {
                        if(folderId != null || folderId == 0){
                          final response =   await _repository.uploadFile(
                            folderId: folderId.toString(),
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
                        }
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

                SizedBox(height: ScreenUtil().screenHeight * .02.h),
                // Upload button
                (_selectedFile != null && folderId != null)
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
