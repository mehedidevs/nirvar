import 'package:flutter/material.dart';
import 'package:nirvar/models/patient_folder/patient_folder.dart';
import 'package:nirvar/screens/main/my_files/upload/prescription_upload_screen.dart';
import 'package:nirvar/screens/main/my_files/upload/test_report_upload_screen.dart';

import '../utils/app_colors.dart';
import 'custom_button.dart';
import 'disabled_button.dart';

class UploadDialog extends StatefulWidget {

  final PatientFolder folder;

  const UploadDialog({super.key, required this.folder});

  @override
  _UploadDialogState createState() => _UploadDialogState();
}

class _UploadDialogState extends State<UploadDialog> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.cloud_upload, size: 40, color: AppColors.primary),
            SizedBox(height: 16),
            Text(
              'Upload',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            _buildOptionButton(
              icon: Icons.description,
              label: 'Test Reports',
              selected: selectedOption == 'Test Reports',
              onTap: () {
                setState(() {
                  selectedOption = 'Test Reports';
                });
              },
            ),
            SizedBox(height: 12),
            _buildOptionButton(
              icon: Icons.medical_services,
              label: 'Prescription',
              selected: selectedOption == 'Prescription',
              onTap: () {
                setState(() {
                  selectedOption = 'Prescription';
                });
              },
            ),
            SizedBox(height: 24),
            _buildProceedButton(),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text(
                'Cancel',
                style: TextStyle(color: Colors.teal),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionButton({
    required IconData icon,
    required String label,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: selected ? Colors.teal : Colors.grey[300]!,
          ),
          color: selected ? Colors.teal[50] : Colors.transparent,
        ),
        child: Row(
          children: [
            Icon(icon, color: selected ? Colors.teal : Colors.black),
            SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                color: selected ? Colors.teal : Colors.black,
              ),
            ),
            Spacer(),
            if (selected)
              Icon(Icons.check, color: Colors.teal),
          ],
        ),
      ),
    );
  }

  Widget _buildProceedButton() {
    return selectedOption!=null
        ? CustomButton(
      text: 'Proceed',
      onPressed: (){
        if( selectedOption == 'Test Reports'){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TestReportUploadScreen(folderId: widget.folder.folderId, folderName: widget.folder.name ?? "",)));
        } else if( selectedOption == 'Prescription'){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PrescriptionUploadScreen(folderId: widget.folder.folderId,)));
        }
      },)
        : const DisabledButton(buttonText: 'Proceed');
  }
}


