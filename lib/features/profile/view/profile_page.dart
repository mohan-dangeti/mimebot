import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mimebot/features/info/view/about_page.dart';
import 'package:mimebot/features/info/view/contact_page.dart';
import 'package:mimebot/features/profile/view/profile_detail.dart';

import '../../../core/helpers/cache_helper/cache_helper.dart';
import '../../../core/utils/configs/styles/colors.dart';
import '../../info/view/policy_page.dart';
import '../../info/view/terms_page.dart';
import '../../login/view/login_page.dart';
import '../../password/view/forgot_password.dart';
import '../controller/profile_controller.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  final ProfileController profileController = Get.put(ProfileController());

  @override
  void initState() {
    super.initState();
    profileController.fetchUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.primaryColor,
        centerTitle: true,
        title: Text(
          "Profile",
          style: TextStyle(
              fontSize: 18.sp,
              color: AppColor.whiteColor,
              fontFamily: "poppinsSemiBold"),
        ),
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        color: AppColor.whiteColor,
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
            child: Obx(
          () => Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 25,
              ),
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 100.sp, // Size of the circular border
                      width: 100.sp,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(50.r), // Circular border
                        border: Border.all(
                          color: AppColor.primaryColor,
                          width: 3.sp,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(70.r),
                        child: Container(
                          height: 90.sp,
                          width: 90.sp,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.black12,
                          ),
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: profileController
                                    .profileModel.value.data?.userImg ??
                                'https://via.placeholder.com/150',
                            placeholder: (context, url) =>
                                const CupertinoActivityIndicator(),
                            errorWidget: (context, url, error) => Container(
                              decoration: BoxDecoration(
                                color: Colors.black26,
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Icon(CupertinoIcons.person),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: SizedBox(
                        height: 22.sp,
                        width: 22.sp,
                        child: InkWell(
                          onTap: () {
                            showModalBottomSheet(
                                // backgroundColor: ,
                                context: context,
                                builder: (BuildContext context) {
                                  return SizedBox(
                                    height: 100.sp,
                                    width: Get.width.sp,
                                    // color: Colors.black26,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.blueGrey,
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(10)),
                                                  border: Border.all(
                                                    width: 1,
                                                    color: Colors.black26,
                                                    style: BorderStyle.solid,
                                                  ),
                                                ),
                                                child: IconButton(
                                                    onPressed: () async {
                                                      // File?
                                                      // imageFile =
                                                      // await artistProfileController
                                                      //     .pickImage(
                                                      //     ImageSource.camera);
                                                      // if (imageFile !=
                                                      //     null) {
                                                      //   await artistProfileController.cropimage(
                                                      //       source: imageFile!
                                                      //           .path
                                                      //           .toString(),
                                                      //       context:
                                                      //       context);
                                                      // }
                                                    },
                                                    icon: Icon(
                                                      CupertinoIcons.camera,
                                                      size: 30,
                                                      color: Colors.white,
                                                    )),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.brown,
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(10)),
                                                  border: Border.all(
                                                    width: 1,
                                                    color: Colors.black26,
                                                    style: BorderStyle.solid,
                                                  ),
                                                ),
                                                child: IconButton(
                                                    onPressed: () async {
                                                      // First, pick the image
                                                      // File?
                                                      // imageFile =
                                                      // await artistProfileController
                                                      //     .pickImage(
                                                      //     ImageSource.gallery);
                                                      //
                                                      // // Check if an image was picked
                                                      // if (imageFile !=
                                                      //     null) {
                                                      //   // Perform the crop operation
                                                      //   await artistProfileController
                                                      //       .cropimage(
                                                      //     source: imageFile
                                                      //         .path
                                                      //         .toString(),
                                                      //     context:
                                                      //     context,
                                                      //   );
                                                      // }
                                                    },
                                                    icon: const Icon(
                                                        CupertinoIcons.photo,
                                                        size: 30,
                                                        color: Colors.white)),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  );
                                });
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.deepPurpleAccent,
                            child: Icon(
                              Icons.edit,
                              color: Colors.white,
                              size: 15.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  profileController.profileModel.value.data?.userName ?? '',
                  style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColor.borderColor,
                      fontFamily: "poppinsSemiBold"),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  profileController.profileModel.value.data?.email ?? '',
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColor.borderColor,
                      fontFamily: "poppinsRegular"),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              _profileItem(
                  icon: Icons.person,
                  label: "Profile",
                  onTap: () {
                    Get.to(const ProfileDetailsPage(),
                        transition: Transition.cupertino);
                  },
                  context: context),
              _profileItem(
                  icon: Icons.info_outline,
                  label: 'About us',
                  onTap: () {
                    Get.to(const AboutPage(), transition: Transition.cupertino);
                  },
                  context: context),
              _profileItem(
                  icon: Icons.support_agent_outlined,
                  label: 'Contact us',
                  onTap: () {
                    Get.to(const ContactPage(),
                        transition: Transition.cupertino);
                  },
                  context: context),
              _profileItem(
                  icon: Icons.article,
                  label: 'Terms & Conditions',
                  onTap: () {
                    Get.to(const TermsPage(), transition: Transition.cupertino);
                  },
                  context: context),
              _profileItem(
                  icon: Icons.local_police_outlined,
                  label: 'Privacy Policy',
                  onTap: () {
                    Get.to(const PolicyPage(),
                        transition: Transition.cupertino);
                  },
                  context: context),
              _profileItem(
                  icon: Icons.password,
                  label: 'Change Password',
                  onTap: () {
                    Get.to(const ForgotPasswordPage(),
                        transition: Transition.cupertino);
                  },
                  context: context),
              SizedBox(
                height: 5,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Material(
                  color: Colors.transparent,
                  elevation: 5.0,
                  child: Ink(
                    decoration: BoxDecoration(
                      color: AppColor.redColor,
                      borderRadius: BorderRadius.circular(
                          15.0), // Match the ClipRRect border radius
                      border: Border.all(color: Colors.black12),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(
                          15.0), // Ensure InkWell has the same border radius
                      onTap: () async {
                        Get.defaultDialog(
                          title: 'Logout',
                          textConfirm: 'Logout',
                          middleTextStyle: TextStyle(
                            fontSize: 13.sp,
                            color: AppColor.txtColorMain,
                            fontFamily: "poppinsRegular",
                          ),
                          middleText: 'Are you sure you want to logout?',
                          textCancel: 'Cancel',
                          titleStyle: TextStyle(
                            fontSize: 16.sp,
                            color: AppColor.txtColorMain,
                            fontFamily: "poppinsSemiBold",
                          ),
                          buttonColor:
                              AppColor.primaryColor, // Set the button color
                          radius: 10.0, // Set the border radius
                          onConfirm: () {
                            CacheHelper.clearData("onboarding");
                            CacheHelper.clearData("regId");
                            Get.back();
                            Get.offAll(
                              const LoginPage(),
                              transition: Transition.leftToRightWithFade,
                            ); // Navigate to login screen
                          },
                          onCancel: () {
                            Get.back(); // Close current screen
                          },
                        );
                      },
                      child: Container(
                        width: Get.width,
                        height: 50,
                        alignment: Alignment.center,
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                          child: Row(
                            children: [
                              Icon(
                                Icons.power_settings_new_outlined,
                                size: 25,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Logout',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "poppinsRegular",
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }

  Widget _profileItem(
      {required IconData icon,
      required String label,
      required VoidCallback onTap,
      required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Material(
          color: Colors.transparent,
          elevation: 5.0,
          child: Ink(
            decoration: BoxDecoration(
              color: const Color(0xffededed),
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(color: Colors.black12),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(15.0),
              onTap: onTap,
              child: Container(
                width: Get.width,
                height: 50,
                alignment: Alignment.center,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  child: Row(
                    children: [
                      Icon(
                        icon,
                        size: 25,
                        color: Colors.black,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        label,
                        style: const TextStyle(
                          fontSize: 16,
                          fontFamily: "poppinsRegular",
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
