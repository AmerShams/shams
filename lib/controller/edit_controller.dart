// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_cupertino_datetime_picker/flutter_cupertino_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:teknosoft/controller/upcoming_controller.dart';
import 'package:teknosoft/data/datasource/static/database.dart';
import 'package:teknosoft/data/datasource/static/static.dart';

class EditController extends GetxController {
  UpcomingController upcontroller = Get.put(UpcomingController());
  int index = 0;
  TextEditingController title = TextEditingController();
  String priority = '';
  String selectedCategory = 'personal';
  String selectedpriority = 'medium';

  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  ToDoDataBase db = ToDoDataBase();

  @override
  void onInit() {
    index = Get.arguments['index'];
    title.text = todotask[index][0];
    selectedCategory = todotask[index][2];
    selectedpriority = todotask[index][6];
    startDate = todotask[index][1];
    endDate = todotask[index][7];

    super.onInit();
  }

  void updateTaskData() {
    todotask[index] = [
      title.text,
      startDate,
      selectedCategory,
      false,
      false,
      todotask[index][5],
      selectedpriority,
      endDate,
    ];
    title.clear();
    db.updateDataBase();
    upcontroller.update();
    Get.back();
  }

  startDateTime(BuildContext context) {
    return DatePicker.showDatePicker(
      context,
      dateFormat: 'dd MMMM yyyy HH:mm',
      initialDateTime: startDate,
      minDateTime: DateTime(2000),
      maxDateTime: DateTime(3000),
      onMonthChangeStartWithFirstDate: true,
      pickerMode: DateTimePickerMode.time,
      onConfirm: (dateTime, List<int> index) {
        startDate = dateTime;
        endDate = DateTime(
          dateTime.year,
          dateTime.month,
          dateTime.day,
          endDate.hour,
          endDate.minute + 1,
        );
        update();
      },
    );
  }

  endDateTime(BuildContext context) {
    endDate = startDate;
    return DatePicker.showDatePicker(
      context,
      dateFormat: 'HH:mm',
      initialDateTime: endDate,
      minDateTime: DateTime(2000),
      maxDateTime: DateTime(3000),
      onMonthChangeStartWithFirstDate: true,
      pickerMode: DateTimePickerMode.time,
      onConfirm: (dateTime, List<int> index) {
        endDate = dateTime;
        update();
      },
    );
  }
}
