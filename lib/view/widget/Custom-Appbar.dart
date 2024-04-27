// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teknosoft/controller/home_controller.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:teknosoft/view/screen/search_bottomsheet.dart';

class CustomAppbar extends StatelessWidget {
  final String title;
  CustomAppbar({super.key, required this.title});

  Home_controller controller = Get.put(Home_controller());

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // titleSpacing: 23,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(120.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (title != 'lists')
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                Padding(
                  padding: const EdgeInsets.only(left: 22, bottom: 5),
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 30,
                    ),
                  ),
                ),
                Row(children: [
                  IconButton(
                      onPressed: () {
                        Get.bottomSheet(const SearchBottomSheet(),
                            isScrollControlled: true, isDismissible: true);
                      },
                      icon: const Icon(
                        Icons.search,
                        size: 32,
                      )),
                  // ClipRRect(
                  //     borderRadius: BorderRadius.circular(20),
                  //     child: Image.asset(
                  //       "assets/images/avatar.png",
                  //       scale: 10,
                  //     )),
                  const SizedBox(
                    width: 30,
                  )
                ]),
              ],
            ),
            GetBuilder<Home_controller>(
              builder: (controller) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: CircularPercentIndicator(
                        animationDuration: 2000,
                        animation: true,
                        radius: 11,
                        lineWidth: 3,
                        percent: controller.dochange(),
                        progressColor: const Color.fromARGB(197, 0, 78, 134),
                        circularStrokeCap: CircularStrokeCap.round,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Text(
                        "Today's Progress  ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Color.fromARGB(197, 0, 78, 134)),
                      ),
                    ),
                    Text(
                      "${controller.taskleftCount()} tasks left",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Color.fromARGB(250, 158, 158, 158)),
                    ),
                  ],
                );
              },
            ),
            const Divider(
              endIndent: 20,
              indent: 20,
              color: Color.fromARGB(44, 19, 51, 56),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.transparent,
    );
  }
}
