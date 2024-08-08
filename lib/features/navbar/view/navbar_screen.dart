import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../core/utils/configs/styles/colors.dart';
import '../../../core/utils/shared/constants/assets_pathes.dart';
import '../../drawer/view/drawer_widget.dart';
import '../../notifications/view/notification_page.dart';
import '../controller/navbar_controller.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final NavBarController bottomNavBarController = Get.put(NavBarController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
      color: AppColor.primaryColor,
      child: SafeArea(
        child: Scaffold(
          drawer: const DrawerWidget(),
          extendBodyBehindAppBar: false,
          appBar: bottomNavBarController.selectedIndex.value == 0
              ? AppBar(
            elevation: 0,
            backgroundColor: AppColor.primaryColor,
            actions: [
              IconButton(
                icon: Icon(
                  Icons.notifications,
                  color: AppColor.whiteColor,
                  size: 25,
                ),
                onPressed: () {
                  Get.to(() => const NotificationPage(),
                      transition: Transition.cupertino);
                },
              ),
            ],
            leading: Builder(
              builder: (context) => IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(
                  Icons.menu,
                  color: AppColor.whiteColor,
                  size: 25,
                ),
              ),
            ),
            centerTitle: true,
            title: SizedBox(
              width: 141.w,
              height: 37.h,
              child: SvgPicture.asset(
                AssetsPathes.appLogo,
              ),
            ),
          )
              : null,
          body: bottomNavBarController
              .screens[bottomNavBarController.selectedIndex.value],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: AppColor.primaryColor,
            selectedItemColor: AppColor.whiteColor,
            unselectedItemColor: AppColor.whiteColor,
            currentIndex: bottomNavBarController.selectedIndex.value,
            onTap: (index) => bottomNavBarController.updateIndex(index),
            selectedLabelStyle: TextStyle(
                fontSize: 12.sp,
                color: AppColor.txtColorMain,
                fontFamily: "poppinsRegular"),
            unselectedLabelStyle: TextStyle(
                fontSize: 12.sp,
                color: AppColor.txtColorMain,
                fontFamily: "poppinsRegular"),
            items: [
              BottomNavigationBarItem(
                backgroundColor: AppColor.primaryColor,
                icon: Icon(CupertinoIcons.home, size: 25.sp),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                backgroundColor: AppColor.primaryColor,
                icon: Icon(Icons.bookmark, size: 25.sp),
                label: 'Saved',
              ),
              BottomNavigationBarItem(
                backgroundColor: AppColor.primaryColor,
                icon: Icon(Icons.grid_view_sharp, size: 25.sp),
                label: 'Category',
              ),
              BottomNavigationBarItem(
                backgroundColor:AppColor.primaryColor,
                icon: Icon(Icons.person, size: 25.sp),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
