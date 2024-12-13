import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nirvar/bloc/account_holder/account_holder_bloc.dart';
import 'package:nirvar/data/local/entity/account_holder.dart';
import 'package:nirvar/screens/switch_account/account_directory/account_directory.dart';
import 'package:nirvar/screens/widgets/custom_app_bar.dart';

import '../../injection_container.dart';
import '../utils/app_colors.dart';
import '../widgets/custom_chasing_dots.dart';

class AccountHoldersScreen extends StatefulWidget {
  const AccountHoldersScreen({super.key});

  @override
  State<AccountHoldersScreen> createState() => _AccountHoldersScreenState();
}

class _AccountHoldersScreenState extends State<AccountHoldersScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AccountHolderBloc>().add(FetchAllAccountHolders());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Trigger the fetch event each time dependencies change
    context.read<AccountHolderBloc>().add(FetchAllAccountHolders());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AccountHolderBloc,AccountHolderState>(
      listener: (context,state){
        if(state.status == AccountHolderStatus.initial){
          context.read<AccountHolderBloc>().add(FetchAllAccountHolders());
        }
      },
      child: PopScope(
        canPop: false,
        child: Scaffold(
          backgroundColor: AppColors.white,
          resizeToAvoidBottomInset: false,
          appBar: CustomAppBar(title: 'Choose An Account'),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              child: _buildUI(context),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUI(BuildContext context) {
    return BlocBuilder<AccountHolderBloc, AccountHolderState>(
      builder: (context, state) {
        if (state.status == AccountHolderStatus.loading) {

          print('Loading....');

          return Center(child: CustomChasingDots(size: 50.sp));
        } else if (state.status == AccountHolderStatus.failure) {
          // Show an error message if data fetching fails

          print(state.errorMessage);
          return Center(
              child: Text(state.errorMessage,
                  style: const TextStyle(color: AppColors.primary)));
        } else if (state.status == AccountHolderStatus.success) {
          List<AccountHolder>? accountList = state.accountHolders;
          print('Account holders: ${accountList.toString()}');
          return accountList.isEmpty
              ? const Center(
                  child: Text('No Account is available',
                      style: TextStyle(color: AppColors.primary)))
              : ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: accountList.map(
                    (account) {
                      return AccountDirectory(
                        key: ValueKey(account.id),
                        accountHolder: account,
                        onDelete: () {
                          context.read<AccountHolderBloc>().add(DeleteAccountHolder(accountHolder: account));
                        },
                      );
                    },
                  ).toList(growable: false),
                );
        }
        return const SizedBox();
      },
    );
  }
}
