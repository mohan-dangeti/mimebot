import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../core/utils/configs/styles/colors.dart';
import '../../sub_category/view/sub_category_page.dart';
import '../controller/category_controller.dart';
import '../model/category_model.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final CategoryController _controller = Get.put(CategoryController());
  TextEditingController searchController = TextEditingController();
  List<Data>? allCategories = [];
  List<Data>? filteredCategories = [];

  @override
  void initState() {
    super.initState();
    call();
  }

  void call() {
    _controller.fetchCategoryData().then((_) {
      allCategories = _controller.categoryModel.value.data;
      filteredCategories = allCategories;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.primaryColor,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: AppColor.primaryColor,
            centerTitle: true,
            title: Text(
              "Category",
              style: TextStyle(
                fontSize: 18.sp,
                color: AppColor.whiteColor,
                fontFamily: "poppinsSemiBold",
              ),
            ),
          ),
          body: Container(
            color: Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: searchController,
                    onChanged: (value) {
                      filterCategories(value);
                    },
                    decoration: InputDecoration(
                      hintText: 'Search categories...',
                      fillColor: const Color(0xfff5f5f5),
                      hintStyle: const TextStyle(
                        fontSize: 12,
                        fontFamily: "poppinsRegular",
                        color: Colors.black,
                      ),
                      prefixIcon: Icon(Icons.search),
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
                  ),
                ),
                Expanded(
                  child: Obx(() {
                    if (_controller.isLoading.value) {
                      return buildShimmerEffect();
                    } else {
                      return buildCategoryGrid();
                    }
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildShimmerEffect() {
    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: 6,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        childAspectRatio: 3 / 2,
      ),
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        );
      },
    );
  }

  Widget buildCategoryGrid() {
    final categories = filteredCategories ?? [];

    if (categories.isEmpty) {
      return Center(
        child: Text(
          "No categories found",
          style: TextStyle(
            fontSize: 16.sp,
            color: Colors.grey,
          ),
        ),
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: categories.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        childAspectRatio: 3 / 2,
      ),
      itemBuilder: (context, index) {
        final category = categories[index];
        return Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              Get.to(
                SubCategoryPage(
                  title: category.categoryName ?? '',
                  categoryId: category.categoryId.toString(),
                ),
                transition: Transition.cupertino,
              );
            },
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
                      child: CachedNetworkImage(
                        imageUrl: category.categoryImage ?? '',
                        fit: BoxFit.fill,
                        errorWidget: (context, url, error) => Icon(Icons.error),
                        placeholder: (context, url) => Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      category.categoryName ?? '',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void filterCategories(String query) {
    List<Data>? filteredList = [];

    if (query.isNotEmpty) {
      filteredList = allCategories
          ?.where((category) =>
      category.categoryName?.toLowerCase().contains(query.toLowerCase()) ??
          false)
          .toList();
    } else {
      filteredList = allCategories;
    }

    setState(() {
      filteredCategories = filteredList;
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
