import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:teknosoft/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:teknosoft/view/widget/Custom-Drawer.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await initialServices();
  await Hive.initFlutter();
  await Hive.openBox("mybox");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'lato',
          textTheme: const TextTheme(
            displayLarge: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
                color: AppColor.black),
            displayMedium: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: AppColor.black),
          ),
        ),
        home: CustomDrawer());
  }
}
