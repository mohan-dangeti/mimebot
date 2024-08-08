import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mimebot/features/lessons/view/lessons_page.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/utils/configs/styles/colors.dart';
import '../controller/sub_category_controller.dart';

class SubCategoryPage extends StatefulWidget {
  final String title;
  final String categoryId;

  const SubCategoryPage(
      {super.key, required this.title, required this.categoryId});

  @override
  State<SubCategoryPage> createState() => _SubCategoryPageState();
}

class _SubCategoryPageState extends State<SubCategoryPage> {
  final SubCategoryController _controller = Get.put(SubCategoryController());

  @override
  void initState() {
    super.initState();
    call();
  }

  void call() {
    _controller.fetchSubCategoryData(categoryId: widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.primaryColor,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_rounded, size: 25, color: Colors.white),
        ),
        title: Text(
          widget.title,
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
          if (_controller.isLoading.value) {
            return buildShimmerEffect();
          } else {
            return buildSubCategoryList();
          }
        }),
      ),
    );
  }

  Widget buildShimmerEffect() {
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: 6,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            height: 100.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        );
      },
    );
  }

  Widget buildSubCategoryList() {
    final subCategories = _controller.subCategoryModel.value.data;

    if (subCategories == null || subCategories.isEmpty) {
      return Center(
        child: Text(
          "No course available in this category",
          style: TextStyle(
            fontSize: 16.sp,
            color: Colors.grey,
          ),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: subCategories.length,
      itemBuilder: (context, index) {
        final subCategory = subCategories[index];
        return InkWell(
          onTap: () {
            Get.to(LessonsPage(
                title: subCategory.corTitle.toString(),
                courseId: subCategory.corId.toString()));
          },
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: CachedNetworkImage(
                    imageUrl: subCategory.corImg ?? '',
                    width: 100.w,
                    height: 100.h,
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) => Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        width: 100.w,
                        height: 100.h,
                        color: Colors.white,
                      ),
                    ),
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        width: 100.w,
                        height: 100.h,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          subCategory.corTitle ?? '',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          subCategory.corDesc ?? '',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.grey,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
