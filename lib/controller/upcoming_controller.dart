// ignore_for_file: non_constant_identifier_names
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:teknosoft/controller/dialog_controller.dart';
import 'package:teknosoft/controller/home_controller.dart';
import 'package:teknosoft/data/datasource/static/database.dart';
import 'package:teknosoft/data/datasource/static/static.dart';
import 'package:teknosoft/view/widget/dialogComponent/DialogBox.dart';

// ignore: camel_case_types
class UpcomingController extends GetxController {
  DialogController dialogC = Get.put(DialogController());
  Home_controller home_controller = Get.put(Home_controller());
  TextEditingController title = TextEditingController();
  DateTime filterDate = DateTime.now();

  String selectedCategory = 'personal';
  String selectedPriority = 'Medium';

  ToDoDataBase db = ToDoDataBase();

  int current = DateTime.now().day - 1;
  final _myBox = Hive.box('mybox');

  @override
  void onInit() {
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    weeekday.clear();
    weeekday.addAll(generateCurrentMonthDates());

    super.onInit();
  }

  changeday(int i) {
    current = i;

    update();
  }

  List<DateTime> generateCurrentMonthDates() {
    List<DateTime> monthDates = [];
    DateTime now = DateTime.now();
    int currentMonth = now.month;
    int currentYear = now.year;
    int daysInMonth = DateTime(currentYear, currentMonth + 1, 0).day;

    for (int day = 1; day <= daysInMonth; day++) {
      monthDates.add(DateTime(currentYear, currentMonth, day));
    }

    return monthDates;
  }

  datePickerWidget(BuildContext context) async {
    filterDate = await showDatePicker(
          context: context,
          initialDate: filterDate,
          firstDate: DateTime(2000),
          lastDate: DateTime(3000),
        ) ??
        filterDate;
  }

  void saveNewTask() {
    String taskId = generateRandomId();

    // Add new task with generated ID
    todotask.add([
      title.text,
      dialogC.startDate,
      selectedCategory,
      false,
      false,
      taskId,
      selectedPriority,
      dialogC.endDate,
    ]);

    title.clear();
    db.updateDataBase();
    update();
    home_controller.update();

    Get.back();
  }

  // Function to generate random ID
  String generateRandomId() {
    var random = Random();
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    String randomId = '';
    for (var i = 0; i < 10; i++) {
      randomId += chars[random.nextInt(chars.length)];
    }
    return randomId;
  }

  void createNewTask() {
    Get.defaultDialog(
        title: "Add New Task",
        content: DialogBox(
          title: title,
          onSave: saveNewTask,
          onChanged: (value) {
            selectedCategory = value.toString();
          },
          onChangedpriority: (value) {
            selectedPriority = value.toString();
          },
        ));
    title.clear();
    db.updateDataBase();
    update();
  }

  void changeimportant(int index) {
    todotask[index][4] = !todotask[index][4];
    db.updateDataBase();
    update();
    home_controller.update();
  }

  void checkboxChanged(bool? value, int index) {
    todotask[index][3] = !todotask[index][3];
    db.updateDataBase();
    update();
    home_controller.update();
  }

  void deleteTaskById(String taskId) {
    // Remove the task with matching ID
    todotask.removeWhere((task) => task[5] == taskId);
    // Update the database and UI
    db.updateDataBase();
    update();
    home_controller.update();
  }
}
