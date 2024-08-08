import 'package:get/get.dart';
import 'package:mimebot/features/category/view/category_page.dart';
import 'package:mimebot/features/profile/view/profile_page.dart';
import '../../home/view/home_page.dart';
import '../../saved/view/saved_page.dart';
import 'package:flutter/material.dart';
class NavBarController extends GetxController {
  var selectedIndex = 0.obs;
  final List<Widget> screens = [
    const HomePage(),
    const SavedPage(),
    const CategoryPage(),
     ProfilePage(),
  ];

  void updateIndex(int index) {
    selectedIndex.value = index;
  }
}
