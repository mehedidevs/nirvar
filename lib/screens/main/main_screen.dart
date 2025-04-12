import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_badge_control/flutter_app_badge_control.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nirvar/screens/main/profile/profile_screen.dart';
import 'package:nirvar/screens/main/status/stats_screen.dart';

import '../floating_bottom_navigation_bar.dart';
import '../utils/helper.dart';
import 'home/home_screen.dart';
import 'my_files/my_files.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}


class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  DateTime? _lastBackPressed;

  final List<Widget> _screens = [
    HomeScreen(),
    MyFiles(),
    StatsScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<bool> _onWillPop() async {
    if (_selectedIndex != 0) {
      setState(() {
        _selectedIndex = 0;
      });
      return false;
    }

    final now = DateTime.now();
    if (_lastBackPressed == null ||
        now.difference(_lastBackPressed!) <= Duration(seconds: 1)) {
      _lastBackPressed = now;

      context.flushBarErrorMessage(message: 'Press again to exit');

      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //     content: Text('Press back again to exit'),
      //     duration: Duration(seconds: 2),
      //   ),
      // );
      return false;
    }

    return true; // Let system pop (exit app)
  }

  @override
  void initState() {
    super.initState();
    FlutterAppBadgeControl.removeBadge();
  }

  @override
  Widget build(BuildContext context) {
    statusBarSetup();

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Stack(
          children: [
            IndexedStack(
              index: _selectedIndex,
              children: _screens,
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 4.h, // Assuming you're using ScreenUtil
              child: Center(
                child: FloatingBottomNavigationBar(
                  selectedIndex: _selectedIndex,
                  onItemTapped: _onItemTapped,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

