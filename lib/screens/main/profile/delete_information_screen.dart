import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nirvar/routes/navigation_helper.dart';
import '../../../routes/routes_name.dart';
import '../../utils/app_colors.dart';
import '../../utils/helper.dart';
import '../../widgets/clickable_text.dart';

class DeleteInformationScreen extends StatelessWidget {
  const DeleteInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, dynamic result) {
        if (!didPop) {
          context.pop(true);
        }
      },
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text:
                        'At Nirvar, we respect your privacy and are committed to providing you with full control over your personal information. '
                        'If you wish to delete all data associated with your account, we offer a simple process to ensure your request is handled promptly. '
                        'Please send an email to ',
                    style: TextStyle(
                      fontSize: 18.sp,
                      height: 1.5,
                      color: Colors.black, // Default text color
                    ),
                    children: [
                      TextSpan(
                        text: 'team.nirvartech@gmail.com', //need to change in here
                        style: TextStyle(
                          color: AppColors.primary,
                          // Highlighted color for the email
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            sendEmail(context);
                          },
                      ),
                      TextSpan(
                        text: ' with the subject line ',
                        style: const TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                        text: '"Delete My Information"',
                        style: const TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Colors.black,
                        ),
                      ),
                      const TextSpan(
                        text:
                            ', along with your account details (e.g., email and phone number). '
                            'Our team will review your request and ensure that all your data is permanently removed in accordance with our privacy policy. '
                            'We guarantee that all user data will be completely deleted from our backend within 40 days of receiving the request. '
                            'For more details on how we handle user data, please review our full privacy policy below.',
                      ),
                    ],
                  ),
                ),
                25.verticalSpace,
                Center(
                  child: ElevatedButton.icon(
                    onPressed: () async {
                      sendEmail(context);
                    },
                    icon: const Icon(Icons.mail_outline),
                    label: const Text('Send Email'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                      elevation: 8, // Increase the shadow depth
                      shadowColor: Colors.black54, // Set a shadow color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            8), // Rounded corners for better aesthetics
                      ),
                    ),
                  ),
                ),
                20.verticalSpace,
                Center(
                  child: ClickableText(
                    regularText: '',
                    clickableText: ' Privacy Policy',
                    onTap: () {
                      context.pushNamed(
                          routeName: RoutesName.privacyPolicyScreen);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
