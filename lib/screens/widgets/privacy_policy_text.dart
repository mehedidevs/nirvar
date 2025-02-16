import 'package:flutter/material.dart';
import 'package:nirvar/routes/navigation_helper.dart';

import '../../routes/routes_name.dart';
import 'clickable_text.dart';

class PrivacyPolicyText extends StatelessWidget {
  const PrivacyPolicyText({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClickableText(
        regularText: 'By using Nirvar, you agree to our',
        clickableText: ' Privacy Policy',
        onTap: () {
          context.pushNamed(routeName: RoutesName.privacyPolicyScreen);
        },
      ),
    );
  }
}
