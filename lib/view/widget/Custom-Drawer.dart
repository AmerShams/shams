// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:teknosoft/controller/drawer_controller.dart';

// ignore: must_be_immutable
class CustomDrawer extends StatelessWidget {
  CustomDrawer({super.key});

  DrawerControllerr controller = Get.put(DrawerControllerr());

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      screens: controller.pages,
      backgroundColorMenu: const Color.fromARGB(255, 167, 211, 227),
      initPositionSelected: 0,
      disableAppBarDefault: true,
      slidePercent: 60,
    );
  }
}
