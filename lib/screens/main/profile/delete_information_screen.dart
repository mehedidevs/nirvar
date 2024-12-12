import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nirvar/data/network/authentication/auth_api_service.dart';
import 'package:nirvar/screens/utils/helper.dart';
import 'package:path/path.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/app_colors.dart';


class DeleteInformationScreen extends StatelessWidget {
  const DeleteInformationScreen({super.key});

  // Email function to launch the default email app
  void _sendEmail(BuildContext context) async {
    String? encodeQueryParameters(Map<String, String> params) {
      return params.entries
          .map((MapEntry<String, String> e) =>
      '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
          .join('&');
    }

    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'teamnirvar@gmail.com',
      query: encodeQueryParameters(<String, String>{
        'subject': 'Delete My Information',
        'body': 'Dear Nirvar Team,\n\n'
            'I would like to request the deletion of all my personal data associated with my account on Nirvar. '
            'Please find my account details below:\n\n'
            'Name: [Your Name]\n'
            'Email: [Your Email Address]\n'
            'Phone Number: [Your Phone Number]\n\n'
            'If you need any further information to process this request, please let me know. '
            'I would appreciate a confirmation once the deletion process is completed.\n\n'
            'Thank you for your assistance.\n\n'
            'Best regards,\n[Your Name]',
      }),
    );


    try {
      if (await canLaunchUrl(emailLaunchUri)) {
        await launchUrl(
          emailLaunchUri,
          mode: LaunchMode.externalApplication,
        );
      } else {
        throw 'Could not launch email client.';
      }
    } catch (e) {
      if(context.mounted){
        context.flushBarErrorMessage(message: 'Could not open the email client. Please ensure you have an email app installed and try again.');
      }
      debugPrint('Error launching email: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          title: Text(
            'Manage Data',
            style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: 'At Nirvar, we respect your privacy and are committed to providing you with full control over your personal information. '
                      'If you wish to delete all the data associated with your account, we offer a simple process to ensure your request is handled promptly. '
                      'Please send an email to ',
                  style: TextStyle(
                    fontSize: 18.sp,
                    height: 1.5,
                    color: Colors.black, // Default text color
                  ),
                  children: [
                    TextSpan(
                      text: 'teamnirvar@gmail.com',
                      style: TextStyle(
                        color: AppColors.primary, // Highlighted color for the email
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async { _sendEmail(context); },
                    ),
                    const TextSpan(
                      text: ' with the subject line "Delete My Information," along with your account details. '
                          'Our team will review your request and ensure that all your data is permanently removed in accordance with our privacy policy. '
                          'For more details on how we handle user data, please review our full privacy policy below.',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),
              Center(
                child: ElevatedButton.icon(
                  onPressed: () async {
                    _sendEmail(context);
                  },
                  icon: const Icon(Icons.mail_outline),
                  label: const Text('Send Email'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    elevation: 8, // Increase the shadow depth
                    shadowColor: Colors.black54, // Set a shadow color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // Rounded corners for better aesthetics
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
