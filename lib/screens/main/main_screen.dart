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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _screens = [
    HomeScreen(),
    MyFiles(),
    StatsScreen(),
    ProfileScreen()
  ];

  // @mustCallSuper
  // void _onPopInvokedWithResult(bool didPop, dynamic result) {
  //   // Handle back press behavior here
  //   if (_selectedIndex <= _screens.length) {
  //     // Allow app to exit if
  //     return;
  //   } else {
  //     setState(() {
  //       _selectedIndex = 0; // Navigate back to HomeScreen if not on it
  //     });
  //   }
  // }

  @mustCallSuper
  void _onPopInvokedWithResult(bool didPop, dynamic result) {
    // If back navigation was already handled by the system, do nothing
    if (didPop) return;

    // If we're not on the home screen, navigate back to home
    if (_selectedIndex != 0) {
      setState(() {
        _selectedIndex = 0; // Navigate to HomeScreen
      });

      // Optional: Show a snackbar to inform the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Press back again to exit'),
          duration: Duration(seconds: 2),
        ),
      );
    }
    // If we're already on home screen, let system handle exit
    else {
      SystemNavigator.pop(); // Or let the default back behavior work
    }
  }

  @override
  void initState() {
    super.initState();
    FlutterAppBadgeControl.removeBadge();
    statusBarSetup();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (bool didPop, dynamic result) {
        _onPopInvokedWithResult(didPop, result); // Custom back press logic
      },
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
              bottom: 4.h, // Adjust as needed
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
