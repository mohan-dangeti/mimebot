import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:mimebot/features/password/view/forgot_opt.dart';
import 'package:mimebot/features/registration/view/registration_page.dart';
import '../../../core/utils/configs/styles/colors.dart';
import '../../../core/utils/shared/constants/assets_pathes.dart';
import 'package:flutter/cupertino.dart';

import '../../login/controller/login_controller.dart';
import '../controller/forgot_password_controller.dart';

class EmailOtpPage extends StatefulWidget {
  const EmailOtpPage({super.key});

  @override
  State<EmailOtpPage> createState() => _EmailOtpPageState();
}

class _EmailOtpPageState extends State<EmailOtpPage> {
  final ForgotPasswordController forgotPasswordController =
      Get.put(ForgotPasswordController());
  @override
  void dispose() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      forgotPasswordController.clearFields();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              size: 25,
              color: Colors.white,
            )),
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
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
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
                height: 100,
              ),
              SizedBox(
                width: Get.width,
                height: 200,
                child: Image.asset(
                  AssetsPathes.emailImg,
                  width: Get.width,
                  height: 200,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Forgot Password",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: "poppinsBold",
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 22),
              _customTextField(
                labelTxt: "Email",
                hintTxt: "Enter email",
                controller: forgotPasswordController.email,
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 12),
              Obx(
                () => Center(
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
                            if (forgotPasswordController.email.text.isEmpty) {
                              Fluttertoast.showToast(msg: 'Please enter email');
                            } else {
                              await forgotPasswordController.sendEmail(email: '${forgotPasswordController.email.text}').then((value) {
                                forgotPasswordController.clearFields();
                              },);
                            }
                          },
                          child: Container(
                            width: 130,
                            height: 40,
                            alignment: Alignment.center,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: forgotPasswordController.loading.value
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
              ),
              SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }

  Widget _customTextField({
    required String labelTxt,
    required String hintTxt,
    required TextEditingController controller,
    required TextInputType keyboardType,
    bool obscureText = false,
    IconButton? suffixIcon,
  }) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: const Color(0xfff5f5f5),
        hintText: hintTxt,
        hintStyle: const TextStyle(
          fontSize: 12,
          fontFamily: "poppinsRegular",
          color: Colors.black,
        ),
        contentPadding: const EdgeInsets.fromLTRB(15.0, 10, 0, 10),
        labelText: labelTxt,
        labelStyle: const TextStyle(
          fontSize: 16,
          fontFamily: "poppinsRegular",
          color: Colors.black,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(color: Color(0xffd9d9d9)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(color: Color(0xffd9d9d9)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(color: Colors.red),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );
  }
}
