import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import '../../../core/utils/configs/styles/colors.dart';
import '../controller/info_controller.dart';

class PolicyPage extends StatefulWidget {
  const PolicyPage({super.key});

  @override
  State<PolicyPage> createState() => _PolicyPageState();
}

class _PolicyPageState extends State<PolicyPage> {
  final InfoController _controller = Get.put(InfoController());

  @override
  void initState() {
    super.initState();
    _controller.fetchInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.primaryColor,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
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
              "Privacy Policy",
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
            child: Obx(() {
              if (_controller.isLoading.value) {
                return _buildShimmerEffect();
              } else {
                return _buildContent();
              }
            }),
          ),
        ),
      ),
    );
  }

  Widget _buildShimmerEffect() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(12, (index) => _buildShimmerItem()),
        ),
      ),
    );
  }

  Widget _buildShimmerItem() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        height: 20.0,
        color: Colors.white,
      ),
    );
  }

  Widget _buildContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(8.0),
      child: HtmlWidget(
        _controller.infoModel.value.data?.first.privacyPolicy ?? '',
        textStyle: TextStyle(
          fontSize: 15.sp,
          fontFamily: "poppinssemibold",
        ),
      ),
    );
  }
}
