// ignore_for_file: file_names, must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teknosoft/controller/home_controller.dart';
import 'package:teknosoft/controller/upcoming_controller.dart';
import 'package:teknosoft/data/datasource/static/static.dart';
import 'package:teknosoft/view/screen/Category_page.dart';
import 'package:teknosoft/view/screen/important_page.dart';
import 'package:teknosoft/view/screen/upComing.dart';
import 'package:teknosoft/view/widget/Custom-Appbar.dart';
import 'package:teknosoft/view/widget/Custom-Categroy-card.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  UpcomingController upConroller = Get.put(UpcomingController());
  Home_controller controller = Get.put(Home_controller());

  @override
  Widget build(BuildContext context) {
    controller.dochange();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        elevation: 2,
        onPressed: upConroller.createNewTask,
        child: Container(
          height: 56,
          width: 56,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 12, 181, 181),
                Color.fromARGB(255, 16, 85, 142)
              ],
            ),
          ),
          child: const Icon(
            Icons.add_rounded,
            size: 30,
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: CustomAppbar(title: "lists"),
      ),
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(133, 90, 164, 177)
            ],
          ),
        ),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Container(
                padding: const EdgeInsets.all(10),
                height: 220,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(UpComing());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 18),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.sunny,
                                  color: Color.fromARGB(255, 14, 117, 190),
                                )
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "MyDay",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 14, 117, 190)),
                              ),
                              GetBuilder<Home_controller>(
                                builder: (controller) {
                                  return Text(
                                    "${controller.countTasksForToday()} task",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        color:
                                            Color.fromARGB(250, 158, 158, 158)),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      endIndent: 20,
                      indent: 20,
                      color: Color.fromARGB(44, 19, 51, 56),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(UpComing());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 18),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.date_range,
                                  color: Color.fromARGB(255, 14, 117, 190),
                                )
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Upcoming",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 14, 117, 190)),
                              ),
                              GetBuilder<Home_controller>(
                                builder: (controller) {
                                  return Text(
                                    "${controller.taskLeft} task",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        color:
                                            Color.fromARGB(250, 158, 158, 158)),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      endIndent: 20,
                      indent: 20,
                      color: Color.fromARGB(44, 19, 51, 56),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(const ImportantPage());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 18),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.star_rate_rounded,
                                  size: 28,
                                  color: Color.fromARGB(255, 14, 117, 190),
                                )
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Important",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 14, 117, 190)),
                              ),
                              GetBuilder<Home_controller>(
                                builder: (controller) {
                                  return Text(
                                    "${controller.importantcount()} task",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        color:
                                            Color.fromARGB(250, 158, 158, 158)),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // SizedBox(
            //   height: 20,
            // ),

            const SizedBox(
              height: 10,
            ),

            SizedBox(
              height: 350, // Adjust the height as needed
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: categories.length,
                  itemBuilder: (context, i) {
                    return InkWell(
                      onTap: () {
                        Get.to(const CategoryPage(),
                            arguments: {'title': categories1[i]});
                      },
                      child: CustomCategoryCard(
                        title: categories[i],
                        category: categories1[i],
                        iconcard: categoryIcon[i],
                        colors: grad[i],
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
