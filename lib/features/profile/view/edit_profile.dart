import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/utils/configs/styles/colors.dart';
import '../controller/profile_controller.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final ProfileController profileController = Get.put(ProfileController());

  @override
  void initState() {
    super.initState();
    // Fetch user info and initialize text fields
    profileController.fetchUserInfo().then(
      (_) {
        profileController.name.text =
            profileController.profileModel.value.data?.userName ?? '';
        profileController.email.text =
            profileController.profileModel.value.data?.email ?? '';
        profileController.phone.text =
            profileController.profileModel.value.data?.mobileNumber ?? '';
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.primaryColor,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back, size: 25, color: Colors.white),
            ),
            elevation: 0,
            backgroundColor: AppColor.primaryColor,
            centerTitle: true,
            title: Text(
              "Edit Profile",
              style: TextStyle(
                fontSize: 18.sp,
                color: AppColor.whiteColor,
                fontFamily: "poppinsSemiBold",
              ),
            ),
          ),
          body: Container(
            height: Get.height,
            width: Get.width,
            color: AppColor.whiteColor,
            child: Obx(() {
              if (profileController.isLoading.value) {
                return _buildShimmer();
              } else {
                return _buildFormFields();
              }
            }),
          ),
        ),
      ),
    );
  }

  Widget _buildShimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: ListView.builder(
        itemCount: 3, // Number of shimmer lines
        itemBuilder: (context, index) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Container(
              width: double.infinity,
              height: 20.h,
              color: Colors.white,
            ),
          );
        },
      ),
    );
  }

  Widget _buildFormFields() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 150,
          ),
          Text(
            "Edit profile details",
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColor.blackTextColor,
              fontFamily: "poppinsSemiBold",
            ),
          ),
          SizedBox(
            height: 15,
          ),
          _customTextField(
            labelTxt: "Name",
            hintTxt: "Enter name",
            controller: profileController.name,
            keyboardType: TextInputType.text,
          ),
          SizedBox(height: 16.h),
          _customTextField(
            labelTxt: "Email",
            hintTxt: "Enter email",
            controller: profileController.email,
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: 16.h),
          _customTextField(
            labelTxt: "Mobile Number",
            hintTxt: "Enter mobile number",
            controller: profileController.phone,
            keyboardType: TextInputType.phone,
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
                        if (profileController.name.text.isEmpty) {
                          Fluttertoast.showToast(msg: 'Please enter name');
                        } else if (profileController.email.text.isEmpty) {
                          Fluttertoast.showToast(msg: 'Please enter email');
                        } else if (profileController.phone.text.isEmpty) {
                          Fluttertoast.showToast(
                              msg: 'Please enter phone number');
                        } else {
                          profileController
                              .editProfile(
                                  userName: profileController.name.text,
                                  userEmail: profileController.email.text,
                                  userPhone: profileController.phone.text)
                              .then(
                            (_) {
                              if (profileController
                                      .editProfileModel.value.status ==
                                  true) {
                                profileController.fetchUserInfo();
                                setState(() {

                                });
                              }
                            },
                          );
                        }
                      },
                      child: Container(
                        width: 130,
                        height: 40,
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: profileController.isLoading.value
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
