// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:teknosoft/controller/todo_controller.dart';
import 'package:teknosoft/core/shared/utils.dart';

// ignore: must_be_immutable
class CustomDate extends StatelessWidget {
  const CustomDate({super.key});

  @override
  Widget build(BuildContext context) {
    Todo_controller controller = Get.put(Todo_controller());

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Obx(() {
            List<String> selectedDateText = [
              DateFormat('MMM').format(controller.selectedDate.value),
              DateFormat('yyyy').format(controller.selectedDate.value)
            ];

            return SizedBox(
              width: screenWidth(4.5),
              child: TextFormField(
                readOnly: true,
                onTap: () => controller.mm(context),
                decoration: InputDecoration(
                  labelText: selectedDateText[0] + selectedDateText[1],
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: screenWidth(21)),
                  border: InputBorder.none,
                ),
              ),
            );
          }),
          IconButton(
            onPressed: () => controller.mm(context),
            icon: const Icon(Icons.keyboard_arrow_down_outlined),
          ),
        ],
      ),
    );
  }
}
