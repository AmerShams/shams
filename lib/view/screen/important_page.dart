// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:teknosoft/controller/important_controller.dart';
import 'package:teknosoft/view/widget/Custom-Appbar.dart';
import 'package:get/get.dart';
import 'package:teknosoft/view/widget/CustomCard.dart';

class ImportantPage extends StatelessWidget {
  const ImportantPage({super.key});

  @override
  Widget build(BuildContext context) {
    ImportantControlller controller = Get.put(ImportantControlller());
    List filter = controller.filteredTasks;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: CustomAppbar(
          title: 'Important',
        ),
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
            const SizedBox(
              height: 10,
            ),
            GetBuilder<ImportantControlller>(builder: (controller) {
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
                        onChanged: (value) =>
                            controller.checkboxChanged(filter[index][5]),
                        onPressedImporntant: () {
                          controller.changeimportant(filter[index][5], index);
                        },
                        deleteFunc: (context) =>
                            controller.deleteTask(filter[index][5], index),
                        enddate: filter[index][7],
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
