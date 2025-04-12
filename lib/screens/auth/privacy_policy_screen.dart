import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nirvar/screens/utils/theme_helper.dart';

import '../utils/app_colors.dart';
import '../utils/helper.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    statusBarSetup();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          'Privacy Policy Of Nirvar',
          style: context.textTheme.titleLarge?.copyWith(
            color: AppColors.appBarColor,
            fontWeight: FontWeight.w700,
          ),
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
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          _buildSectionTitle("1. Scope and Purpose",context),
          _buildSectionContent(
            "Our Privacy Policy helps you understand the following:\n\n"
                "• The types of Personal Information (including Sensitive Personal Data) that we collect from users.\n"
                "• The purpose, means, and modes of usage of such Personal Information by Nirvar.\n"
                "• To whom we may disclose this information.\n"
                "• How we protect Personal Information and ensure confidentiality.\n"
                "• How you can access and modify your Personal Information.\n",context
          ),
          _buildSectionTitle("2. Information Collection and Usage",context),
          _buildSectionContent(
            "To provide our Services, Nirvar collects and securely stores certain data and information from users, including Personal and Sensitive Personal Data.\n\n"
                "Personal Information We Collect Includes:\n\n"
                "• Account Details: Phone number, email, and password required for sign-up and login.\n"
                "• Health Information: Medical prescriptions, test reports, blood pressure, and blood glucose metrics stored in the My Files and My Health sections.\n"
                "• Personal Details: Name, blood group, weight, height, age, gender, and financial information required for transactions.\n"
                "• Voluntary Data: Additional information you may choose to provide within the app.\n\n"
                "We collect this information to offer personalized services, manage your health records, and enable sharing functionalities within the app. We take all reasonable precautions to protect and maintain the confidentiality of your information.\n",
         context ),
          _buildSectionTitle("3. Use of Collected Information",context),
          _buildSectionContent(
            "The information collected is used for the following purposes:\n\n"
                "• Account Management: Verifying user identity and managing accounts.\n"
                "• Health Data Management: Storing and organizing medical records, prescriptions, and health metrics.\n"
                "• Data Sharing Features: Facilitating the sharing of selected files from My Files via temporary links (QR codes).\n"
                "• Service Improvement: Enhancing user experience, app functionality, and data security.\n\n"
                "Nirvar does not use your information for any purposes beyond those stated, without your explicit consent.\n", context
          ),
          _buildSectionTitle("4. Disclosure of Information",context),
          _buildSectionContent(
            "We may disclose information to:\n\n"
                "• User-Controlled Sharing: Allowing you to share specific files via temporary QR code links with individuals of your choosing.\n"
                "• Trusted Third-Party Providers: Engaging with carefully vetted service providers to support our operations. These providers are bound by confidentiality obligations.\n"
                "• Compliance with Legal Requirements: Adhering to Bangladesh’s data protection regulations and medical confidentiality laws, including the Bangladesh Medical and Dental Council Telemedicine Guidelines and the Code of Conduct.\n",
         context ),
          _buildSectionTitle("5. Protection of Personal Information",context),
          _buildSectionContent(
            "Nirvar values patient privacy and follows strict security protocols to ensure the confidentiality and integrity of your data:\n\n"
                "• Technical Measures: Industry-standard encryption and secure servers protect stored and transmitted data.\n"
                "• Administrative Safeguards: Our team is trained to handle Personal Information with the highest level of discretion.\n"
                "• Regulatory Compliance: We operate in accordance with applicable laws and guidelines, including the Bangladesh Medical and Dental Council’s privacy standards.\n",
          context),
          _buildSectionTitle("6. Data Access and Permissions",context),
          _buildSectionContent(
            "To deliver essential features, Nirvar may request access to:\n\n"
                "• Camera and Storage: For capturing and saving prescriptions and health reports in the My Files section.\n\n"
                "Permissions can be adjusted in your device settings, although certain functionalities may be limited without full access.\n",
         context ),
          _buildSectionTitle("7. Data Retention and Deletion",context),
          _buildSectionContent(
            "We retain your data as long as your account is active or as needed to fulfill the purposes outlined in this policy.\n\n"
                "• Data Deletion: You may delete specific files or health records. If you choose to delete your account, all related data will be permanently erased from our systems.\n",
         context ),
          _buildSectionTitle("8. User Rights and Choices",context),
          _buildSectionContent(
            "• Access and Modification: You have the right to access, modify, or delete your Personal Information in the app settings.\n\n"
                "• Account Switching: Nirvar provides the option to manage multiple accounts within the app. Each account is kept separate and secure.\n\n"
                "• Data Deletion Requests: In addition to account deletion, you may request data removal for specific health records or Personal Information stored within Nirvar.\n",
         context ),
          _buildSectionTitle("9. Security of Health Information",context),
          _buildSectionContent(
            "Your health data is treated with utmost confidentiality in line with general laws, ethical standards, and the Bangladesh Medical and Dental Council’s Telemedicine Guidelines and Code of Conduct. Nirvar continuously seeks to protect your health information through comprehensive administrative, physical, and technical safeguards.\n",
context),
          _buildSectionTitle("10. Children’s Privacy",context),
          _buildSectionContent(
            "Nirvar is not intended for use by individuals under the age of 13. We do not knowingly collect information from children without verified parental consent. If we discover unauthorized data collection from a minor, it will be promptly deleted.\n",
          context),
          _buildSectionTitle("11. Updates to this Privacy Policy",context),
          _buildSectionContent(
            "We may update this Privacy Policy periodically. If there are material changes, we will notify you through the app. We encourage you to review this policy regularly.\n",
         context ),
          _buildSectionTitle("12. Contact Us",context),
          _buildSectionContent(
            "If you have any questions, concerns, or feedback about this Privacy Policy or Nirvar’s data practices, please contact us at team.nirvartech@gmail.com.\n\n"
                "By using Nirvar, you acknowledge that you have read and understood this Privacy Policy and agree to the terms herein.\n",
         context ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: context.textTheme.labelLarge?.copyWith(
          color: AppColors.appBarColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildSectionContent(String content, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        content,
        style: context.textTheme.labelSmall?.copyWith(
          color: AppColors.black,
          fontWeight: FontWeight.w400,
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }
}
