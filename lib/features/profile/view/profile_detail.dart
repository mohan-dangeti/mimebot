import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mimebot/features/profile/view/edit_profile.dart';
import 'package:shimmer/shimmer.dart';
import '../../../core/utils/configs/styles/colors.dart';
import '../controller/profile_controller.dart';

class ProfileDetailsPage extends StatefulWidget {
  const ProfileDetailsPage({super.key});

  @override
  State<ProfileDetailsPage> createState() => _ProfileDetailsPageState();
}

class _ProfileDetailsPageState extends State<ProfileDetailsPage> {
  final ProfileController profileController = Get.put(ProfileController());

  @override
  void initState() {
    super.initState();
    profileController.fetchUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.primaryColor,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {
                  Get.to(const EditProfilePage(),transition: Transition.cupertino);
                },
                icon: Icon(Icons.edit_note_sharp, size: 25, color: Colors.white),
              ),
            ],
            automaticallyImplyLeading: false,
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
              "Profile Details",
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                ),
                Obx(() {
                  if (profileController.isLoading.value) {
                    return _buildShimmer();
                  } else {
                    return _buildProfileDetails();
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildShimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        children: [
          _buildShimmerItem(),
          _buildShimmerItem(),
          _buildShimmerItem(),
        ],
      ),
    );
  }

  Widget _buildShimmerItem() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30.r,
            backgroundColor: Colors.white,
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 16.h,
                  color: Colors.white,
                ),
                SizedBox(height: 8.h),
                Container(
                  width: 100.w,
                  height: 16.h,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileDetails() {
    final profile = profileController.profileModel.value.data;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 100.sp, // Size of the circular border
              width: 100.sp,
              decoration: BoxDecoration(
                borderRadius:
                BorderRadius.circular(50.r), // Circular border
                border: Border.all(
                  color:AppColor.primaryColor,
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
                    imageUrl: profile?.userImg ?? 'https://via.placeholder.com/150',
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
            SizedBox(height: 16.h),
            Text(
              profile?.userName ?? '',
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Reg ID: ${profile?.regId ?? ''}',
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 24.h),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildProfileDetail(label: 'User Name', value: profile?.userName ?? ''),
                    _buildProfileDetail(label: 'Reg Id', value: profile?.regId.toString() ?? ''),
                    _buildProfileDetail(label: 'Email', value: profile?.email ?? ''),
                    _buildProfileDetailLast(label: 'Mobile Number', value: profile?.mobileNumber ?? ''),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileItem(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(
            '$title: ',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 16.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildProfileDetail({required String label, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColor.primaryColor,
                fontFamily: "poppinsSemiBold",
              ),
            ),
          ],
        ),
        SizedBox(height: 8.w),
        Text(
          value,
          style: TextStyle(
            fontSize: 12.sp,
            color: AppColor.txtColorMain,
            fontFamily: "poppinsRegular",
          ),
        ),
        const Divider(
          thickness: 1,
          color: AppColor.greyColor,
        ),
      ],
    );
  }
  Widget _buildProfileDetailLast({required String label, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColor.primaryColor,
                fontFamily: "poppinsSemiBold",
              ),
            ),
          ],
        ),
        SizedBox(height: 8.w),
        Text(
          value,
          style: TextStyle(
            fontSize: 12.sp,
            color: AppColor.txtColorMain,
            fontFamily: "poppinsRegular",
          ),
        ),
      ],
    );
  }
}
