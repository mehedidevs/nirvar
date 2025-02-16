import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../bloc/account_holder/account_holder_bloc.dart';
import '../../../../bloc/user_profile_details/user_profile_details_bloc.dart';
import '../../../../data/local/entity/account_holder.dart';
import '../../../../data/preference/user_id_storage.dart';
import '../../../../injection_container.dart';
import '../../../../models/user_profile/user_profile.dart';
import '../../../../repository/account_holder/account_holder_repository.dart';
import '../../../utils/app_colors.dart';

class UserProfileDetails extends StatefulWidget {
  const UserProfileDetails({super.key});

  @override
  State<UserProfileDetails> createState() => _UserProfileDetailsState();
}

class _UserProfileDetailsState extends State<UserProfileDetails> {

  @override
  void initState() {
    super.initState();
    context.read<UserProfileDetailsBloc>().add(GetUserProfileDetailsFromApi());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserProfileDetailsBloc, UserProfileDetailsState>(
      listenWhen: (previous, current) =>
      previous.status != current.status &&
          current.status == UserProfileDetailsStatus.success,
      listener: (context, state) {
        _updateTheAccountHolder(state.userProfile);
      },
      child: BlocBuilder<UserProfileDetailsBloc, UserProfileDetailsState>(
        buildWhen: (previous, current) =>
        previous.userProfile != current.userProfile ||
            previous.status != current.status,
        builder: (context, state) {
          return switch (state.status) {
            UserProfileDetailsStatus.initial => _buildDefaultProfilePicture(),
            UserProfileDetailsStatus.loading => _buildLoader(),
            UserProfileDetailsStatus.success ||
            UserProfileDetailsStatus.refreshing =>
                _buildSuccessWidget(state.userProfile),
            UserProfileDetailsStatus.failure => _buildDefaultProfilePicture(),
          };
        },
      ),
    );
  }

  Widget _buildLoader() {
    return Center(
            child: SpinKitChasingDots(
                color: AppColors.white,
                size: 50.sp));
  }

  Widget _buildDefaultProfilePicture() {
    return  CircleAvatar(
      radius: 50.r,
      backgroundColor: AppColors.white,
      child: Icon(Icons.person, size: 60.sp),
    );
  }

  Widget _buildSuccessWidget(UserProfile userProfile){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            (userProfile.photo == null || userProfile.photo!.isEmpty)
                ? _buildDefaultProfilePicture()
                : CircleAvatar(
              radius: 50.r,
              backgroundColor: AppColors.white,
              child: ClipOval(
                child: Image.network(
                  userProfile.photo ?? " ",
                  fit: BoxFit.cover,
                  height:  50.r * 2.sp,
                  width: 50.r * 2.sp,
                  errorBuilder: (context, error, stackTrace) {
                    // Fallback widget when image fails to load
                    return Icon(
                      Icons.person,
                      size:  50.r,
                      color: AppColors.grey,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Text(
          userProfile.name ?? "N/A",
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          userProfile.email ?? 'N/A',
          style: TextStyle(
            fontSize: 14.sp,
            color: Colors.white.withOpacity(0.7),
          ),
        ),
      ],
    );

  }

  Future<void> _updateTheAccountHolder(UserProfile userProfile) async {
    try {
      // Get the user ID from storage
      int? userId = await sl<UserIdStorage>().getUserID();
      // Fetch the account holder by ID using the Bloc
      final bloc = sl<AccountHolderBloc>();
      if (userId != null && userId != 0) {
        var user = await sl<AccountHolderRepository>().findAccountHolderById(userId);
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
