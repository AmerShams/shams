// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:teknosoft/controller/upcoming_controller.dart';
import 'package:teknosoft/core/constant/color.dart';

import 'package:teknosoft/core/shared/utils.dart';
import 'package:teknosoft/data/datasource/static/database.dart';
import 'package:teknosoft/data/datasource/static/static.dart';
import 'package:teknosoft/view/screen/edit_page.dart';
import 'package:teknosoft/view/widget/CustomCard.dart';
import 'package:teknosoft/view/widget/CustomDate.dart';

class UpComing extends StatelessWidget {
  UpComing({super.key});

  ToDoDataBase db = ToDoDataBase();

  @override
  Widget build(BuildContext context) {
    UpcomingController upConroller = Get.put(UpcomingController());

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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(4.0),
          child: Divider(
            endIndent: 10,
            indent: 10,
            color: Color.fromARGB(44, 19, 51, 56),
          ),
        ),
        surfaceTintColor: Colors.transparent,
        title: const Text(
          "Upcoming",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(39, 150, 211, 220),
              Color.fromARGB(108, 90, 164, 177)
            ],
          ),
        ),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const CustomDate(),
                MaterialButton(
                  onPressed: () {
                    upConroller.current = DateTime.now().day - 1;
                    upConroller.update();
                  },
                  child: Text(
                    "Today",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth(18),
                        color: const Color.fromARGB(255, 17, 110, 186)),
                  ),
                )
              ],
            ),
            GetBuilder<UpcomingController>(builder: (conroller) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    weeekday.length,
                    (index) => GestureDetector(
                      onTap: () {
                        conroller.changeday(index);
                      },
                      child: AnimatedContainer(
                        width: 45,
                        height: 65,
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        duration: const Duration(milliseconds: 300),
                        padding: const EdgeInsets.all(11),
                        decoration: conroller.current == index
                            ? BoxDecoration(
                                borderRadius: BorderRadius.circular(13),
                                gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color.fromARGB(255, 50, 205, 205),
                                    Color.fromARGB(255, 16, 85, 142)
                                  ],
                                ),
                              )
                            : null,
                        child: Column(
                          children: [
                            Text(
                              DateFormat('EEEE')
                                  .format(weeekday[index])
                                  .substring(0, 1),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: screenWidth(25),
                                  color: conroller.current == index
                                      ? AppColor.white
                                      : AppColor.grey),
                            ),
                            Text(
                              (index + 1).toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: screenWidth(25),
                                color: conroller.current == index
                                    ? AppColor.white
                                    : AppColor.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
            const SizedBox(
              height: 25,
            ),
            GetBuilder<UpcomingController>(builder: (cardConroller) {
              return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  width: double.infinity,
                  height: 415,
                  child: ListView.builder(
                    itemCount: todotask.length,
                    itemBuilder: (ctx, index) {
                      if (upConroller.current + 1 == todotask[index][1].day) {
                        return CustomCard(
                          title: todotask[index][0],
                          date: todotask[index][1],
                          category: todotask[index][2],
                          isDone: todotask[index][3],
                          important: todotask[index][4],
                          onChanged: (value) =>
                              cardConroller.checkboxChanged(value, index),
                          onPressedImporntant: () {
                            cardConroller.changeimportant(index);
                          },
                          deleteFunc: (context) =>
                              cardConroller.deleteTaskById(todotask[index][5]),
                          enddate: todotask[index][7],
                          editTask: () {
                            Get.to(() => const EditPage(),
                                arguments: {'index': index});
                          },
                        );
                      } else {
                        return const SizedBox(); // أو يمكنك عودة أي عنصر فارغ آخر حسب احتياجات التصميم الخاصة بك
                      }
                    },
                  ));
            }),
          ],
        ),
      ),
    );
  }
}
