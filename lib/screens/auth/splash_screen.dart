import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nirvar/data/preference/token_storage.dart';
import 'package:nirvar/routes/navigation_helper.dart';
import 'package:nirvar/routes/routes_name.dart';
import 'package:nirvar/screens/utils/assets_path.dart';

import '../../injection_container.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    super.initState();
    _moveToNextScreen();
  }

  Future<void> _moveToNextScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    try {
      final token = await sl<TokenStorage>().getToken();
      if (mounted) {
        Navigator.of(context).pushNamedAndRemoveUntil(
          token == null || token.isEmpty ? RoutesName.animatedSplashScreen : RoutesName.mainScreen,
              (route) => false,
        );
      }
    } catch (error) {
      if (mounted) {
        print("Error during navigation: $error");
        Navigator.of(context).pushNamedAndRemoveUntil(RoutesName.animatedSplashScreen,
              (route) => false,
        );
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SvgPicture.asset(
        AssetsPath.entryNewSvg,
        height: double.infinity,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
