import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: camel_case_types
class Todo_controller extends GetxController {
  final Rx<DateTime> selectedDate = DateTime.now().obs;
  // ignore: unused_element
  void mm(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      initialDatePickerMode: DatePickerMode.year,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
    );
    if (picked != selectedDate.value) {
      selectedDate(picked);
    }
  }
}
