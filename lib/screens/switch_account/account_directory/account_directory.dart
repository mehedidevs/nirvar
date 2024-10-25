import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nirvar/data/local/entity/account_holder.dart';
import 'package:nirvar/repository/account_holder/account_holder_repository.dart';
import 'package:nirvar/screens/switch_account/switch_account_screen.dart';

import '../../../injection_container.dart';
import '../../utils/app_colors.dart';
import '../../utils/assets_path.dart';
import '../../widgets/custom_button.dart';

class AccountDirectory extends StatelessWidget {
  final AccountHolder accountHolder;
  final VoidCallback? onDelete;

  const AccountDirectory({super.key, required this.accountHolder, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SwitchAccountScreen(accountHolder: accountHolder)),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
        decoration: BoxDecoration(
          color: AppColors.pale, // Light background color
          borderRadius: BorderRadius.circular(20.r), // Rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5.r,
              offset: Offset(0, 4.h),
            ),
          ],
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.network(
              accountHolder.photo!,
              height: 50.h,
              width: 50.w,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(
            accountHolder.name ?? '',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF2C3E50),

            ),
            maxLines: 1,
            overflow: TextOverflow.fade,
          ),
          subtitle:Text(
            accountHolder.number ?? "",
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.grey.shade400,
            ),
            maxLines: 1,
            overflow: TextOverflow.fade,
          ),

          trailing: GestureDetector(
            onTap: (){
              showDialog(
                context: context,
                builder: (context){
                  return Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16.w),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(AssetsPath.deleteLogoSvg),
                          SizedBox(height: 16.h),
                          Text(
                            'Are you sure you want to delete this folder?',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            maxLines: 2,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 32.h),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 0.h, horizontal: 16.w),
                            child: CustomButton(
                              text: 'Delete',
                              onPressed: () async {
                               await sl<AccountHolderRepository>().deleteAccountHolder(accountHolder);
                                if(context.mounted){
                                  Navigator.of(context).pop(true);
                                  onDelete?.call();
                                }
                              },
                            ),
                          ),
                          SizedBox(height: 8.h),
                          // Cancel Button
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(false); // Close the dialog
                            },
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColors.primary, // Adjust the color as needed
                              ),
                            ),
                          ),
                        ],

                      ),
                    ),
                  );
                },);
            },
              child: SvgPicture.asset(AssetsPath.deleteLogoSvg),),
          ),

        ),
      );
  }
}
