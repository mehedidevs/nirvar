import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nirvar/screens/utils/app_colors.dart';
import 'package:nirvar/screens/utils/assets_path.dart';

class FloatingBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  FloatingBottomNavigationBar({
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14.r),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 3,
              blurRadius: 10,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(14.r),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: AppColors.deepPale,
            unselectedItemColor: Colors.grey,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: selectedIndex,
            onTap: onItemTapped,
            items: [
              _buildBottomNavigationBarItem(AssetsPath.homeSvg, 'Home', 0),
              _buildBottomNavigationBarItem(AssetsPath.folderSvg, 'Files', 1),
              _buildBottomNavigationBarItem(AssetsPath.chartSvg, 'Stats', 2),
              _buildBottomNavigationBarItem(AssetsPath.settingsSvg, 'Settings', 3),
            ],
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(
      String iconPath, String label, int index) {
    return BottomNavigationBarItem(
      icon: Stack(
        children: [
          SvgPicture.asset(
            iconPath,
            colorFilter: ColorFilter.mode(
                selectedIndex == index ? AppColors.deepPale : Colors.grey,
                BlendMode.srcIn),
            height: 24.h,
            width: 24.w,
          ),
        ],
      ),
      label: label,
    );
  }
}
