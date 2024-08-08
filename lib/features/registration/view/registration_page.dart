import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../../../core/utils/configs/styles/colors.dart';
import '../../../core/utils/shared/constants/assets_pathes.dart';
import '../../otp_verification/view/otp_verification_page.dart';
import '../controller/registration_controller.dart';
import 'package:flutter/cupertino.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final RegistrationController registrationController =
      Get.put(RegistrationController());
  @override
  void dispose() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      registrationController.clearFields();
    });
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.primaryColor,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_rounded,
              size: 25,
              color: Colors.white,
            )),
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
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
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
                height: 50,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Registration",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: "poppinsBold",
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 18),
              _customTextField(
                labelTxt: "Name",
                hintTxt: "Enter name",
                controller: registrationController.name,
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 12),
              _customTextField(
                labelTxt: "Email",
                hintTxt: "Enter email",
                controller: registrationController.email,
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 12),
              _customTextField(
                labelTxt: "Mobile Number",
                hintTxt: "Enter mobile number",
                controller: registrationController.phone,
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 12),
              Text(
                'Upload Profile Picture',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.sp,
                  fontFamily: "poppinsSemibold",
                ),
              ),
              SizedBox(height: 12),
              Obx(
                () => Center(
                  child: registrationController.imagePath.value.isEmpty
                      ? Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () async {
                              showModalBottomSheet(
                                backgroundColor: Colors.white,
                                context: context,
                                builder: (BuildContext context) {
                                  return SizedBox(
                                    height: 100.sp,
                                    width: Get.width.sp,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        IconButton(
                                          onPressed: () async {
                                            File? imageFile =
                                                await registrationController
                                                    .pickImage(
                                                        ImageSource.camera);
                                            if (imageFile != null) {
                                              registrationController.imagePath
                                                  .value = imageFile.path;
                                            }
                                            Navigator.pop(
                                                context); // Close the bottom sheet after selecting image
                                          },
                                          icon: Icon(
                                            CupertinoIcons.camera,
                                            size: 30,
                                            color: Colors.blueGrey,
                                          ),
                                        ),
                                        const SizedBox(width: 16),
                                        IconButton(
                                          onPressed: () async {
                                            File? imageFile =
                                                await registrationController
                                                    .pickImage(
                                                        ImageSource.gallery);
                                            if (imageFile != null) {
                                              registrationController.imagePath
                                                  .value = imageFile.path;
                                            }
                                            Navigator.pop(
                                                context); // Close the bottom sheet after s
                                          },
                                          icon: const Icon(
                                            CupertinoIcons.photo,
                                            size: 30,
                                            color: Colors.brown,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            borderRadius: BorderRadius.circular(12.r),
                            splashColor: Colors.grey.withOpacity(0.5),
                            child: Container(
                              alignment: Alignment.center,
                              height: 120,
                              width: Get.width,
                              decoration: BoxDecoration(
                                color: const Color(0xffd9d9d9),
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Icon(Icons.upload,
                                      size: 30, color: Color(0xff222222)),
                                  Text(
                                    "Upload Profile Picture",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontFamily: "poppinsRegular",
                                      color: const Color(0xff222222),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      : Container(
                          width: Get.width,
                          height: 120.sp,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            color: const Color(0xffd9d9d9),
                            borderRadius: BorderRadius.circular(12.r),
                            image: DecorationImage(
                              image: FileImage(
                                  File(registrationController.imagePath.value)),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                ),
              ),
              SizedBox(height: 12),
              Obx(
                () => _customTextField(
                  labelTxt: "Password",
                  hintTxt: "Enter password",
                  controller: registrationController.password,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: registrationController.passwordVisible.value,
                  suffixIcon: IconButton(
                      onPressed: () {
                        registrationController.updateVisibility();
                      },
                      icon: Icon(registrationController.passwordVisible.value
                          ? Icons.visibility_off
                          : Icons.visibility),
                      color: Colors.black),
                ),
              ),
              SizedBox(height: 12),
              Obx(
                () => _customTextField(
                  labelTxt: "Confirm Password",
                  hintTxt: "Enter confirm password",
                  controller: registrationController.confirmPassword,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: registrationController.conPasswordVisible.value,
                  suffixIcon: IconButton(
                      onPressed: () {
                        registrationController.updateConVisibility();
                      },
                      icon: Icon(registrationController.conPasswordVisible.value
                          ? Icons.visibility_off
                          : Icons.visibility),
                      color: Colors.black),
                ),
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
                            if (registrationController.name.text.isEmpty) {
                              Fluttertoast.showToast(
                                  msg: 'Please enter the name');
                            } else if (registrationController
                                .email.text.isEmpty) {
                              Fluttertoast.showToast(
                                  msg: 'Please enter email address');
                            } else if (registrationController
                                .phone.text.isEmpty) {
                              Fluttertoast.showToast(
                                  msg: 'Please enter phone number');
                            } else if (registrationController
                                    .phone.text.length <
                                10) {
                              Fluttertoast.showToast(
                                  msg:
                                      'Please enter the correct mobile number');
                            } else if (registrationController
                                .password.text.isEmpty) {
                              Fluttertoast.showToast(
                                  msg: 'Please enter password');
                            } else if (registrationController
                                .confirmPassword.text.isEmpty) {
                              Fluttertoast.showToast(
                                  msg: 'Please enter confirm password');
                            } else {
                              await registrationController
                                  .registerUser()
                                  .then((_) {
                                if (registrationController
                                        .registrationModel.value.status ==
                                    true) {
                                  Get.to(
                                      OtpVerificationPage(
                                        otp: registrationController
                                            .registrationModel.value.data!.otp
                                            .toString(),
                                        emailId: registrationController
                                            .email.text
                                            .trim(),
                                      ),
                                      transition: Transition.cupertino);
                                  registrationController.clearFields();
                                }
                              });
                            }
                          },
                          child: Container(
                            width: 130,
                            height: 40,
                            alignment: Alignment.center,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: registrationController.loading.value
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
