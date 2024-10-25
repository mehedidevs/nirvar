import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nirvar/bloc/account_holder/account_holder_bloc.dart';
import 'package:nirvar/data/local/entity/account_holder.dart';
import 'package:nirvar/screens/auth/splash_screen.dart';
import 'package:nirvar/screens/utils/helper.dart';
import 'package:nirvar/screens/widgets/custom_chasing_dots.dart';
import '../../injection_container.dart';
import '../main/main_screen.dart';
import '../utils/app_colors.dart';

class SwitchAccountScreen extends StatefulWidget {
  final AccountHolder accountHolder;

  const SwitchAccountScreen({super.key, required this.accountHolder});

  @override
  State<SwitchAccountScreen> createState() => _SwitchAccountScreenState();
}

class _SwitchAccountScreenState extends State<SwitchAccountScreen> {

  final AccountHolderBloc accountHolderBloc = sl<AccountHolderBloc>();


  @override
  void initState() {
    super.initState();
    accountHolderBloc.add(SwitchingAccountHolder(accountHolder: widget.accountHolder));
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: _buildUI(context),
      ),
    );
  }

 Widget _buildUI(BuildContext context) {
   return BlocConsumer<AccountHolderBloc,AccountHolderState>(
      listener: (context, state) {
        if(state.status == AccountHolderStatus.success){
          context.flushBarSuccessMessage(message: 'Account Switch Successfully');
          navigateToScreen(context, SplashScreen());
        }
       else if(state.status == AccountHolderStatus.failure){
          context.flushBarErrorMessage(message: state.errorMessage);
          navigateToScreen(context, MainScreen());
        }
      },

      builder: (context, state) {
        if(state.status == AccountHolderStatus.loading){
          return _buildLoadingState();
        }
        return SizedBox();
      },
    );
  }

  Widget _buildLoadingState() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomChasingDots(size: 50.sp),
        SizedBox(height: 32.h),
        Text(
          'Account Switching....',
          style: const TextStyle(color: AppColors.primary),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  void navigateToScreen(BuildContext context, Widget screen) {
    Future.delayed(const Duration(seconds: 2), () {
      if (context.mounted) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => screen));
      }
    });
  }


}
