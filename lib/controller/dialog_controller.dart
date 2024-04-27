import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_cupertino_datetime_picker/flutter_cupertino_datetime_picker.dart';

class DialogController extends GetxController {
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();

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
