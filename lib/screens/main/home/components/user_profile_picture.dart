import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nirvar/bloc/user_profile_details/user_profile_details_bloc.dart';
import 'package:nirvar/screens/widgets/custom_chasing_dots.dart';
import '../../../utils/app_colors.dart';

class UserProfilePicture extends StatefulWidget {
  const UserProfilePicture({super.key});

  static const double avatarRadius = 20;
  static const double borderWidth = 2;

  @override
  State<UserProfilePicture> createState() => _UserProfilePictureState();
}

class _UserProfilePictureState extends State<UserProfilePicture> {

  @override
  void initState() {
    super.initState();
    context.read<UserProfileDetailsBloc>().add(GetUserProfileDetailsFromApi());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserProfileDetailsBloc, UserProfileDetailsState>(
      builder: (context, state) {
        return switch (state.status) {
          UserProfileDetailsStatus.initial => _buildProfilePicture(),
          UserProfileDetailsStatus.loading => Center(child: CustomChasingDots()),
          UserProfileDetailsStatus.success =>
              _buildProfilePicture(photoUrl: state.userProfile.photo),
          UserProfileDetailsStatus.refreshing => _buildProfilePicture(photoUrl: state.userProfile.photo),
          UserProfileDetailsStatus.failure => _buildProfilePicture(),
        };
      },
      buildWhen: (previous, current) =>
      previous.userProfile != current.userProfile ||
          previous.status != current.status,
    );
  }

  Widget _buildProfilePicture({String? photoUrl}) {
    return Container(
      padding: EdgeInsets.all(UserProfilePicture.borderWidth.w), // Border width
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.primary, // Border color
          width: UserProfilePicture.borderWidth.w, // Border thickness
        ),
      ),
      child: CircleAvatar(
        radius: UserProfilePicture.avatarRadius.r,
        backgroundColor: AppColors.white,
        child: _buildAvatarContent(photoUrl),
      ),
    );
  }

  Widget _buildAvatarContent(String? photoUrl) {
    // Check for null, empty, or invalid URL and provide fallback
    if (photoUrl == null || photoUrl.isEmpty) {
      return Icon(
        Icons.person,
        size: UserProfilePicture.avatarRadius.r,
        color: AppColors.grey, // Fallback icon color
      );
    }

    return ClipOval(
      child: Image.network(
        photoUrl,
        fit: BoxFit.cover,
        height: UserProfilePicture.avatarRadius * 2.sp,
        width: UserProfilePicture.avatarRadius * 2.sp,
        errorBuilder: (context, error, stackTrace) {
          // Fallback widget when image fails to load
          return Icon(
            Icons.person,
            size: UserProfilePicture.avatarRadius.r,
            color: AppColors.grey,
          );
        },
      ),
    );
  }
}
