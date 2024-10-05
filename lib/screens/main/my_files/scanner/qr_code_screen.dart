import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For Clipboard
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:nirvar/repository/patient_folder/patient_folder_repository.dart';
import 'package:nirvar/screens/utils/app_colors.dart';
import 'package:nirvar/screens/utils/assets_path.dart';
import 'package:nirvar/screens/utils/helper.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:share_plus/share_plus.dart';
import '../../../../injection_container.dart';


class QrCodeScreen extends StatefulWidget {
  final int folderId;

  const QrCodeScreen({super.key, required this.folderId});

  @override
  State<QrCodeScreen> createState() => _QrCodeScreenState();
}

class _QrCodeScreenState extends State<QrCodeScreen> {
  final _repository = sl<PatientFolderRepository>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
          'Scan QR Code',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: FutureBuilder(
        future: _repository.shareFolder(widget.folderId),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: SpinKitChasingDots(color: AppColors.primary, size: 50.sp));
          }

          if (!snapshot.hasData) {
            return const SizedBox();
          }

          return snapshot.data!.fold((failure){
            context.flushBarErrorMessage(message: failure.message);
            return const SizedBox();
          }, (success){
            return _buildUI(success);
          });

        },
      ),
    );
  }

  Widget _buildUI(String url) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w,),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: ScreenUtil().screenHeight * .02.h,
                ),
                SizedBox(
                  height: .5.sh,
                  child: PrettyQrView.data(
                    data: url,
                    decoration: PrettyQrDecoration(
                      image: PrettyQrDecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage(AssetsPath.appIconPng),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 16.h),

                // URL Container
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.boxGradiantEnd),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          url,
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.black,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.share,size: 25.sp,color: AppColors.primary,),
                        onPressed: () {
                          Share.share(url);
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: ScreenUtil().screenHeight * .065.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
