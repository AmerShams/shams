// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teknosoft/controller/dialog_controller.dart';
import 'package:teknosoft/core/constant/color.dart';
import 'package:teknosoft/core/shared/utils.dart';
import 'package:intl/intl.dart';
import 'package:teknosoft/view/widget/custombuttonauth.dart';
import 'package:teknosoft/view/widget/customtextformauth.dart';

class DialogBox extends StatelessWidget {
  final title;
  final VoidCallback onSave;
  void Function(String?)? onChanged;
  void Function(String?)? onChangedpriority;

  DialogBox({
    Key? key,
    required this.title,
    required this.onSave,
    required this.onChanged,
    required this.onChangedpriority,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DialogController controller = Get.put(DialogController());
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          child: ListView(
            children: [
              CustomTextFormAuth(
                labeltext: 'Title',
                mycontroller: title,
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField(
                value: 'personal', // Default value
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
                onChanged: onChanged,
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField(
                value: 'Medium', // Default value
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
                onChanged: onChangedpriority,
              ),
              const SizedBox(
                height: 10,
              ),
              GetBuilder<DialogController>(
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
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButtomAuth(
                    text: "Add Task",
                    onPressed: onSave,
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
            ],
          ),
        ),
      ),
    );
  }
}
