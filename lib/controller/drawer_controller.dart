import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:teknosoft/core/constant/color.dart';
import 'package:teknosoft/view/screen/Home_page.dart';
import 'package:teknosoft/view/screen/upComing.dart';

// ignore: camel_case_types
class DrawerControllerr extends GetxController {
  List<ScreenHiddenDrawer> pages = [];

  final mytextstyle = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18,
    color: AppColor.white,
  );

  @override
  void onInit() {
    pages = [
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: "HomePage",
              baseStyle: mytextstyle,
              selectedStyle: const TextStyle()),
          HomePage()),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              baseStyle: mytextstyle,
              selectedStyle: const TextStyle(),
              name: 'Upcomimg'),
          UpComing()),
    ];
    super.onInit();
  }
}
