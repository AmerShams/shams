// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:teknosoft/controller/category_controller.dart';
import 'package:teknosoft/data/datasource/static/static.dart';
import 'package:teknosoft/view/widget/Custom-Appbar.dart';
import 'package:get/get.dart';
import 'package:teknosoft/view/widget/CustomCard.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    CategoryController controller = Get.put(CategoryController());
    String title = '${controller.title}';
    List filter = controller.filteredTasks;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: CustomAppbar(
          title: title,
        ),
      ),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: title == 'personal'
                ? grad[0]
                : title == 'learning'
                    ? grad[1]
                    : title == 'work'
                        ? grad[2]
                        : grad[3],
          ),
        ),
        child: ListView(
          children: [
            const SizedBox(
              height: 10,
            ),
            GetBuilder<CategoryController>(builder: (controller) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                width: double.infinity,
                height: 415,
                child: ListView.builder(
                    itemCount: filter.length,
                    itemBuilder: (ctx, index) {
                      return CustomCard(
                        title: filter[index][0],
                        date: filter[index][1],
                        category: filter[index][2],
                        isDone: filter[index][3],
                        important: filter[index][4],
                        enddate: filter[index][7],
                        onChanged: (value) =>
                            controller.checkboxChanged(filter[index][5]),
                        onPressedImporntant: () {
                          controller.changeimportant(filter[index][5]);
                        },
                        deleteFunc: (context) =>
                            controller.deleteTask(filter[index][5], index),
                      );
                    }),
              );
            }),
          ],
        ),
      ),
    );
  }
}
