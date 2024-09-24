import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';

class CustomDropdown extends StatelessWidget {
  final String hintText;
  final Widget icon;
  final List<String> items;
  final String? selectedValue;
  final ValueChanged<String?>? onChanged;

  const CustomDropdown({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.items,
    this.selectedValue,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primary, width: 1.0),
        borderRadius: BorderRadius.circular(15.r),
        color: Colors.white,
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 5.w, vertical: 0),
        child: Row(
          children: [
            Container(
              child: icon,
            ),
            5.horizontalSpace,
            Expanded(
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  hint: Text(
                    hintText,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.grey,
                        ),
                  ),
                  value: selectedValue,
                  items: items.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.grey,
                            ),
                      ),
                    );
                  }).toList(),
                  onChanged: onChanged,
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
