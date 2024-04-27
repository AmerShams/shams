import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:teknosoft/controller/edit_controller.dart';
import 'package:teknosoft/core/shared/utils.dart';
import 'package:teknosoft/view/widget/custombuttonauth.dart';
import 'package:teknosoft/core/constant/color.dart';

class EditPage extends StatelessWidget {
  const EditPage({super.key});

  @override
  Widget build(BuildContext context) {
    EditController controller = Get.put(EditController());

    return Scaffold(
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
          "Update Task",
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
              Color.fromARGB(133, 90, 164, 177)
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
            child: Column(
              children: [
                TextFormField(
                  controller: controller.title,
                  decoration: const InputDecoration(
                    labelText: 'Title',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField(
                  value: controller.selectedCategory, // Default value
                  decoration: const InputDecoration(
                    labelText: 'Category',
                    border: OutlineInputBorder(),
                  ),
                  items: ['work', 'learning', 'personal', 'shopping']
                      .map((category) => DropdownMenuItem(
                            value: category,
                            child: Text(category),
                          ))
                      .toList(),
                  onChanged: (value) {
                    controller.selectedCategory = value.toString();
                  },
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField(
                  value: controller.selectedpriority, // Default value
                  decoration: const InputDecoration(
                    labelText: 'Priority',
                    border: OutlineInputBorder(),
                  ),
                  items: ['Low', 'Medium', 'High']
                      .map((category) => DropdownMenuItem(
                            value: category,
                            child: Text(category),
                          ))
                      .toList(),
                  onChanged: (value) {
                    controller.selectedpriority = value.toString();
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                GetBuilder<EditController>(
                  builder: (controller) {
                    return Column(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(screenWidth(1), screenWidth(7)),
                          ),
                          onPressed: () {
                            controller.startDateTime(context);
                          },
                          child: Text(
                            DateFormat('yyyy/MM/dd ---- HH:mm')
                                .format(controller.startDate),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(screenWidth(1), screenWidth(7)),
                          ),
                          onPressed: () {
                            controller.endDateTime(context);
                            controller.update();
                          },
                          child: Text(
                              DateFormat('HH:mm').format(controller.endDate)),
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomButtomAuth(
                      text: "Update",
                      onPressed: () {
                        controller.updateTaskData();
                      },
                      color: AppColor.primarlyColor,
                    ),
                    CustomButtomAuth(
                      text: "Cancel",
                      onPressed: () {
                        Get.back();
                      },
                      color: AppColor.secondColor,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
