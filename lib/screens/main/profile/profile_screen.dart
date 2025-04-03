import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nirvar/bloc/account_holder/account_holder_bloc.dart';
import 'package:nirvar/data/local/entity/account_holder.dart';
import 'package:nirvar/data/preference/user_id_storage.dart';
import 'package:nirvar/models/user_profile/user_profile.dart';
import 'package:nirvar/routes/navigation_helper.dart';
import 'package:nirvar/routes/routes_name.dart';
import 'package:nirvar/screens/auth/sign_in_screen.dart';
import 'package:nirvar/screens/main/profile/components/user_profile_details.dart';
import 'package:nirvar/screens/main/profile/delete_information_screen.dart';
import 'package:nirvar/screens/main/profile/edit_profile_screen.dart';
import 'package:nirvar/screens/switch_account/account_holders_screen.dart';
import 'package:nirvar/screens/utils/app_colors.dart';
import 'package:nirvar/screens/utils/assets_path.dart';
import 'package:nirvar/screens/widgets/custom_button.dart';
import 'package:nirvar/screens/widgets/custom_chasing_dots.dart';
import '../../../bloc/patient_folder/patient_folder_bloc.dart';
import '../../../injection_container.dart';
import '../../../repository/account_holder/account_holder_repository.dart';
import '../../../repository/authentication/auth_repository.dart';
import '../../utils/helper.dart';
import 'account_settings_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  void initState() {
    super.initState();
    statusBarSetup();
  }

  @override
  Widget build(BuildContext context) {
    return _buildUI(context);
  }

  Widget _buildUI(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Top background and profile info
          Container(
            height: ScreenUtil().screenHeight,
            color: AppColors.primary,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  right: 0,
                  child: SvgPicture.asset(AssetsPath.profileDesignSvg),
                ),
                // Positioned(
                //   top: 20.h,
                //   left: 16.w,
                //   child: IconButton(
                //     icon: SvgPicture.asset(AssetsPath.backArrowSvg),
                //     onPressed: () {
                //       // Navigator.of(context).pop();
                //     },
                //   ),
                // ),
                // Positioned(
                //   top: 20.h,
                //   right: 16.w,
                //   child: IconButton(
                //     icon:
                //         SvgPicture.asset(AssetsPath.notificationWithBadgeSvg),
                //     onPressed: () {
                //       // Handle notification click
                //     },
                //   ),
                // ),
                Positioned(
                  top: 25.h,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Text(
                      'Settings',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: AppColors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                  ),
                ),
                Positioned(
                  top: ScreenUtil().screenHeight * .1.h,
                  left: 0,
                  right: 0,
                  child: UserProfileDetails(),
                ),
              ],
            ),
          ),

          // White rounded container with list items
          Positioned(
            top: ScreenUtil().screenHeight * 0.35.h,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.r),
                  topRight: Radius.circular(40.r),
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: SingleChildScrollView(
                child: Column(
                mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      leading: const Icon(Icons.person_outline,
                          color: AppColors.black),
                      title: Text('Edit Profile',
                          style: TextStyle(fontSize: 16.sp)),
                      trailing: Icon(Icons.arrow_forward_ios, size: 16.sp),
                      onTap: () async {
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditProfileScreen()),
                        );
                        if (result) {
                          setState(() {});
                        }
                      },
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(Icons.settings_outlined,
                          color: AppColors.black),
                      title: Text('Account settings',
                          style: TextStyle(fontSize: 16.sp)),
                      trailing: Icon(Icons.arrow_forward_ios, size: 16.sp),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AccountSettingsScreen()),
                        );
                      },
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(Icons.switch_account_outlined,
                          color: AppColors.black),
                      title: Text('Switch Account',
                          style: TextStyle(fontSize: 16.sp)),
                      trailing: Icon(Icons.arrow_forward_ios, size: 16.sp),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AccountHoldersScreen()),
                        );
                      },
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(Icons.privacy_tip_outlined, color: AppColors.red),
                      title: Text(
                        'Clear Personal Data',
                        style: TextStyle(fontSize: 16.sp),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios, size: 16.sp),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DeleteInformationScreen(),
                          ),
                        );
                      },
                    ),
                    const Divider(),
                    ListTile(
                      leading: SvgPicture.asset(AssetsPath.logoutSvg,
                          colorFilter: const ColorFilter.mode(
                              AppColors.red, BlendMode.srcIn)),
                      title: Text(
                        'Logout',
                        style: TextStyle(color: AppColors.red, fontSize: 16.sp),
                      ),
                      onTap: () {
                        bool? result;
                        WidgetsBinding.instance.addPostFrameCallback((_) async {
                          result = await _showLogoutDialogAlternative(context);
                          print("CAll Back Result : $result");
                          if (result == true) {
                            print("CAll Back Result For success : $result");
                            if (context.mounted) {
                              // Somewhere in your logout button's onPressed or logout logic
                              BlocProvider.of<PatientFolderBloc>(context).add(LogoutEvent());
                              BlocProvider.of<AccountHolderBloc>(context).add(LogOutAccountEvent());

                              context.pushNamedAndRemoveUntil(routeName: RoutesName.signInScreen);

                              // Navigator.of(context, rootNavigator: true)
                              //     .pushReplacement(MaterialPageRoute(
                              //         builder: (context) =>
                              //             const SignInScreen()));
                            }
                          }
                        });
                      },
                    ),
                    SizedBox(height: ScreenUtil().screenHeight * .1.h),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<bool> _showLogoutDialogAlternative(BuildContext context) async {
    bool isLoading = false;

    final result = await showDialog<bool>(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(AssetsPath.logoutDialogueSvg),
                SizedBox(height: 16.h),
                Text(
                  'Are you sure you want to log out of your account?',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24.h),

                isLoading
                    ? const CustomChasingDots()
                    : Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 0.h, horizontal: 16.w),
                        child: CustomButton(
                          text: 'Log Out',
                          onPressed: () async {
                            setState(() {
                              isLoading = true;
                            });

                            final result =
                                await sl<AuthRepository>().logoutUser();

                            result.fold(
                              (failure) {
                                setState(() {
                                  isLoading = false;
                                });
                                Navigator.of(context).pop(false);
                              },
                              (success) {
                                setState(() {
                                  isLoading = false;
                                });
                                Navigator.of(context).pop(true);
                              },
                            );
                          },
                        ),
                      ),
                SizedBox(height: 8.h),
                // Cancel Button
                isLoading
                    ? const SizedBox()
                    : TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pop(false); // Return false when canceled
                        },
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color:
                                AppColors.primary, // Adjust the color if needed
                          ),
                        ),
                      ),
              ],
            ),
          ),
        );
      },
    );

    return result ??
        false; // If the dialog is dismissed without a return value, return false
  }

  // Widget _getUserInformation() {
  //   final authRepository = sl<AuthRepository>();
  //   return FutureBuilder(
  //     future: authRepository.getUserProfile(),
  //     builder: (context, snapshot) {
  //       if (snapshot.connectionState == ConnectionState.waiting) {
  //         return Center(
  //             child: SpinKitChasingDots(
  //                 color: AppColors.white,
  //                 size: 50.sp));
  //       }
  //
  //       if (!snapshot.hasData) {
  //         return Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             Stack(
  //               children: [
  //                 CircleAvatar(
  //                   radius: 50.r,
  //                   backgroundColor: AppColors.white,
  //                   child: Icon(Icons.person, size: 60.sp),
  //                 ),
  //                 // Positioned Camera Icon Button
  //                 // Positioned(
  //                 //   bottom: 2,
  //                 //   right: 0,
  //                 //   child: SvgPicture.asset(
  //                 //     AssetsPath.cameraSvg,
  //                 //     height: 25.h,
  //                 //     width: 25.w,
  //                 //   ),
  //                 // ),
  //               ],
  //             ),
  //             SizedBox(height: 12.h),
  //             // Text(
  //             //   'N/A',
  //             //   style: TextStyle(
  //             //     fontSize: 20.sp,
  //             //     fontWeight: FontWeight.bold,
  //             //   ),
  //             // ),
  //           ],
  //         );
  //       }
  //
  //       return snapshot.data!.fold((error) {
  //         return Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             Stack(
  //               children: [
  //                 CircleAvatar(
  //                   radius: 50.r,
  //                   backgroundColor: AppColors.white,
  //                   child: Icon(Icons.person, size: 60.sp),
  //                 ),
  //                 // Positioned Camera Icon Button
  //                 // Positioned(
  //                 //   bottom: 2,
  //                 //   right: 0,
  //                 //   child: SvgPicture.asset(
  //                 //     AssetsPath.cameraSvg,
  //                 //     height: 25.h,
  //                 //     width: 25.w,
  //                 //   ),
  //                 // ),
  //               ],
  //             ),
  //             SizedBox(height: 12.h),
  //             // Text(
  //             //   error.message,
  //             //   style: TextStyle(
  //             //     fontSize: 20.sp,
  //             //     fontWeight: FontWeight.bold,
  //             //   ),
  //             // ),
  //           ],
  //         );
  //       }, (success) {
  //         _updateTheAccountHolder(success);
  //
  //         return Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             Stack(
  //               children: [
  //                 (success.photo == null || success.photo!.isEmpty)
  //                     ? CircleAvatar(
  //                         radius: 50.r,
  //                         backgroundColor: AppColors.white,
  //                         child: Icon(Icons.person, size: 60.sp),
  //                       )
  //                     : CircleAvatar(
  //                         radius: 50.r,
  //                         backgroundColor: AppColors.white,
  //                         child: ClipOval(
  //                           child: Image.network(
  //                             success.photo ?? " ",
  //                             fit: BoxFit.cover,
  //                             height:  50.r * 2.sp,
  //                             width: 50.r * 2.sp,
  //                             errorBuilder: (context, error, stackTrace) {
  //                               // Fallback widget when image fails to load
  //                               return Icon(
  //                                 Icons.person,
  //                                 size:  50.r,
  //                                 color: AppColors.grey,
  //                               );
  //                             },
  //                           ),
  //                         ),
  //                       ),
  //                 // Positioned Camera Icon Button
  //                 // Positioned(
  //                 //   bottom: 2,
  //                 //   right: 0,
  //                 //   child: SvgPicture.asset(
  //                 //     AssetsPath.cameraSvg,
  //                 //     height: 25.h,
  //                 //     width: 25.w,
  //                 //   ),
  //                 // ),
  //               ],
  //             ),
  //             SizedBox(height: 12.h),
  //             Text(
  //               success.name ?? "N/A",
  //               style: TextStyle(
  //                 fontSize: 20.sp,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //             ),
  //             Text(
  //               success.email ?? 'N/A',
  //               style: TextStyle(
  //                 fontSize: 14.sp,
  //                 color: Colors.white.withOpacity(0.7),
  //               ),
  //             ),
  //           ],
  //         );
  //       });
  //     },
  //   );
  // }

  Future<void> _updateTheAccountHolder(UserProfile userProfile) async {
    try {
      // Get the user ID from storage
      int? userId = await sl<UserIdStorage>().getUserID();
      // Fetch the account holder by ID using the Bloc
      final bloc = sl<AccountHolderBloc>();
      if (userId != null || userId != 0) {
        var user = await sl<AccountHolderRepository>().findAccountHolderById(userId!);
        if(user != null){
          AccountHolder accountHolder = AccountHolder(
              id: user.id,
              role: user.role,
              password: user.password,
              email: userProfile.email,
              number: user.number,
              photo: userProfile.photo,
              name: userProfile.name,
          );
          bloc.add(AccountHolderUpdated(accountHolder: accountHolder));

          print('User Updated');
        }
      }
    } catch (e) {
      // Handle any errors
      print("Error updating the account holder: $e");
    }
  }
}
