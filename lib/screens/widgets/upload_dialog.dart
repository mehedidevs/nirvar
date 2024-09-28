import 'package:flutter/material.dart';
import 'package:nirvar/models/patient_folder/patient_folder.dart';
import 'package:nirvar/screens/main/my_files/upload/prescription_upload_screen.dart';
import 'package:nirvar/screens/main/my_files/upload/test_report_upload_screen.dart';

import '../utils/app_colors.dart';
import 'custom_button.dart';

class UploadDialog extends StatefulWidget {

  final PatientFolder folder;

  const UploadDialog({super.key, required this.folder});



  @override
  _UploadDialogState createState() => _UploadDialogState();
}

class _UploadDialogState extends State<UploadDialog> {
  bool isTestReportSelected = true; // Default to Test Reports

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.cloud_upload, size: 40, color: AppColors.primary),
            const SizedBox(height: 16),
            const Text(
              'Upload',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            Row(
              children: [
                Expanded(
                  child: _buildSelectionButton(
                    icon: Icons.insert_drive_file,
                    label: 'Test Reports',
                    isSelected: isTestReportSelected,
                    onTap: () {
                      setState(() {
                        isTestReportSelected = true;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _buildSelectionButton(
                    icon: Icons.medical_services,
                    label: 'Prescription',
                    isSelected: !isTestReportSelected,
                    onTap: () {
                      setState(() {
                        isTestReportSelected = false;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              child: CustomButton(
                text: 'Proceed',
                onPressed: () {
                  if (isTestReportSelected) {
                     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TestReportUploadScreen(folderId: widget.folder.folderId, folderName: widget.folder.name ?? "",)));
                  } else {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PrescriptionUploadScreen(folderId: widget.folder.folderId,)));
                  }
                },
              ),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text(
                'Cancel',
                style: TextStyle(fontSize: 14, color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method for building selection buttons
  Widget _buildSelectionButton({
    required IconData icon,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey,
          ),
          borderRadius: BorderRadius.circular(16),
          color: isSelected ? Colors.blue.shade100 : Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: isSelected ? Colors.blue : Colors.grey),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.blue : Colors.grey,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            if (isSelected)
              const Icon(Icons.check_circle, color: Colors.blue, size: 16),
          ],
        ),
      ),
    );
  }
}


