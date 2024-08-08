import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mimebot/features/info/view/about_page.dart';
import 'package:mimebot/features/info/view/contact_page.dart';
import 'package:mimebot/features/info/view/policy_page.dart';
import 'package:mimebot/features/info/view/terms_page.dart';
import 'package:mimebot/features/profile/view/profile_detail.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/helpers/cache_helper/cache_helper.dart';
import '../../../core/utils/configs/styles/colors.dart';
import '../../../core/utils/shared/constants/assets_pathes.dart';
import '../../profile/controller/profile_controller.dart';
import '../../login/view/login_page.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  final ProfileController profileController = ProfileController();

  @override
  void initState() {
    super.initState();
    profileController.fetchUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
      ),
      child: Container(
        height: Get.height.h,
        decoration: const BoxDecoration(color: AppColor.primaryColor),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 5),
                child: SizedBox(
                  height: 50.h,
                  child: Center(
                    child: SvgPicture.asset(
                      AssetsPathes.appLogo,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.sp),
                child: SizedBox(
                  height: 90.sp,
                  child: Obx(
                        () {
                      if (profileController.isLoading.value) {
                        return buildShimmerEffect();
                      } else {
                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            buildProfileSection(),
                          ],
                        );
                      }
                    },
                  ),
                ),
              ),
              buildDrawerOption(
                icon: Icons.person,
                text: "Profile",
                onTap: () {
                  Get.back();
                  Get.to(
                        () => const ProfileDetailsPage(),
                    transition: Transition.leftToRightWithFade,
                  );
                },
              ),
              buildDrawerOption(
                icon: CupertinoIcons.info,
                text: "About Us",
                onTap: () {
                  Get.back();
                  Get.to(
                        () => const AboutPage(),
                    transition: Transition.leftToRightWithFade,
                  );
                },
              ),
              buildDrawerOption(
                icon: Icons.support_agent_outlined,
                text: "Contact Us",
                onTap: () {
                  Get.back();
                  Get.to(
                        () => const ContactPage(),
                    transition: Transition.leftToRightWithFade,
                  );
                },
              ),
              buildDrawerOption(
                icon: Icons.article,
                text: "Terms and Conditions",
                onTap: () {
                  Get.back();
                  Get.to(
                        () => const TermsPage(),
                    transition: Transition.leftToRightWithFade,
                  );
                },
              ),
              buildDrawerOption(
                icon: Icons.privacy_tip,
                text: "Privacy Policy",
                onTap: () {
                  Get.back();
                  Get.to(
                        () => const PolicyPage(),
                    transition: Transition.leftToRightWithFade,
                  );
                },
              ),
              buildDrawerOption(
                icon: Icons.logout,
                text: "Logout",
                onTap: () {
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
                    buttonColor: AppColor.primaryColor,
                    radius: 10.0,
                    onConfirm: () {
                      CacheHelper.clearData("onboarding");
                      CacheHelper.clearData("regId");
                      Get.back();
                      Get.offAll(
                            () => const LoginPage(),
                        transition: Transition.leftToRightWithFade,
                      );
                    },
                    onCancel: () {
                      Get.back();
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildShimmerEffect() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Row(
        children: [
          Container(
            color: Colors.redAccent,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Container(
                color: Colors.white,
                height: 60,
                width: 60,
              ),
            ),
          ),
          SizedBox(width: 10.sp),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.white,
                width: 170.w,
                height: 16.sp,
              ),
              SizedBox(height: 5.sp),
              Container(
                color: Colors.white,
                width: 170.w,
                height: 12.sp,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildProfileSection() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.indigo.withOpacity(0.3),
        // borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Container(
              height: 65.sp,
              width: 65.sp,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.r),
                border: Border.all(
                  color:Colors.black12,
                  width: 3.sp,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(70.r),
                child: Container(
                  height: 60.h,
                  width: 60.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.black12,
                  ),
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: profileController.profileModel.value.data?.userImg ?? 'https://via.placeholder.com/150',
                    placeholder: (context, url) => const CupertinoActivityIndicator(),
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
          ),
          SizedBox(width: 10.sp),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 170.w,
                child: Text(
                  profileController.profileModel.value.data?.userName ?? '',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color:  Colors.white,
                    fontFamily: "poppinsSemiBold",
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              SizedBox(height: 5.sp),
              SizedBox(
                width: 170.w,
                child: Text(
                  profileController.profileModel.value.data?.email ?? '',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.white,
                    fontFamily: "poppinsRegular",
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildDrawerOption({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 7.sp),
      child: InkWell(
        onTap: onTap,
        child: Container(
          color: Colors.black54.withOpacity(0.3),
          height: 50,
          child: ListTile(
            titleAlignment: ListTileTitleAlignment.center,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 22.sp,
                  color:  Colors.white,
                ),
                SizedBox(width: 10.w),
                Flexible(
                  child: Container(
                    padding: new EdgeInsets.only(right: 13.0),
                    child: Text(
                      text,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.white,
                        fontFamily: "poppinsRegular",
                      ),
                    ),
                  ),
                ),
              ],
            ),
            trailing: Icon(
              Icons.arrow_forward,
              color:  Colors.white,
              size: 22.sp,
            ),
          ),
        ),
      ),
    );
  }
}
