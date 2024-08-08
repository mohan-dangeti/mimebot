import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mimebot/features/otp_verification/controller/otp_controller.dart';
import 'package:pinput/pinput.dart';

import '../../../core/utils/configs/styles/colors.dart';
import '../../../core/utils/shared/constants/assets_pathes.dart';

class OtpVerificationPage extends StatefulWidget {
  final String otp;
  final String emailId;
  const OtpVerificationPage({super.key, required this.otp, required this.emailId});

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  final OtpController otpController = Get.put(OtpController());
  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          barrierColor: Colors.black26,
          builder: (context) => AlertDialog(
            title: Text(
              'Are you sure?',
              style: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.black,
                  fontFamily: "poppinsBold"),
            ),
            content: Text('Do you want to exit?',
                style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.black,
                    fontFamily: "poppinsRegular")),
            actions: <Widget>[
              Material(
                color: Colors.transparent,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop(false);
                    },
                    child: Container(
                      color: Colors.red,
                      height: 30,
                      width: 60,
                      padding: const EdgeInsets.all(2.0),
                      child: Center(
                        child: Text(
                          'No',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.white,
                            fontFamily: "poppinsRegular",
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Material(
                color: Colors.transparent,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop(true);
                    },
                    child: Container(
                      color: Colors.green,
                      height: 30,
                      width: 60,
                      padding: const EdgeInsets.all(2.0),
                      child: Center(
                        child: Text(
                          'Yes',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.white,
                            fontFamily: "poppinsRegular",
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: AppColor.primaryColor,
          centerTitle: true,
          title: SizedBox(
            width: 141.w,
            height: 37.h,
            child: SvgPicture.asset(
              AssetsPathes.appLogo,
            ),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          height: Get.height,
          width: Get.width,
          color: AppColor.whiteColor,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 250,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Enter OTP",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "poppinsSemiBold",
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                SizedBox(
                  width: Get.width,
                  child: Pinput(
                    defaultPinTheme: PinTheme(
                      width: 56,
                      height: 56,
                      textStyle: TextStyle(fontSize: 16,
                        fontFamily: "poppinsSemiBold",
                        color: Colors.black,),
                      decoration: BoxDecoration(
                        color: const Color(0xfff5f5f5),
                        border: Border.all(color: Colors.black54),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    controller: otpController.otp,
                    length: 6,
                    toolbarEnabled: false,
                    inputFormatters: const [],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Material(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(15.0),
                      elevation: 5.0,
                      child: Ink(
                        decoration: BoxDecoration(
                          color: AppColor.primaryColor,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.black12),
                        ),
                        child: InkWell(
                          onTap: () async {
                            await otpController.verifyOtp(emailId: widget.emailId);
                          },
                          child: Container(
                            width: 130,
                            height: 40,
                            alignment: Alignment.center,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: otpController.isLoading.value
                                  ? SizedBox(
                                height: 10,
                                width: 10,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              )
                                  : Text(
                                'Submit',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "poppinsRegular",
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
