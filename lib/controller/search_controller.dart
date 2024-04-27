import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teknosoft/controller/home_controller.dart';
import 'package:teknosoft/data/datasource/static/database.dart';
import 'package:teknosoft/data/datasource/static/static.dart';

class SearchesController extends GetxController {
  RxList foundtask = [].obs;

  TextEditingController searchcontroller = TextEditingController();
  @override
  void onInit() {
    foundtask.addAll(todotask);
    super.onInit();
  }

  // ignore: non_constant_identifier_names
  Home_controller home_controller = Get.put(Home_controller());

  ToDoDataBase db = ToDoDataBase();

  void runFilter(String enteredKeyword) {
    List results = [];
    if (enteredKeyword.isEmpty) {
      results.clear();
      results.addAll(todotask);
    } else {
      results = todotask
          .where((title) =>
              title[0].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    foundtask.value = results;
  }

  void changeimportant(String taskId, int i) {
    var task =
        todotask.firstWhere((task) => task[5] == taskId, orElse: () => null);
    if (task != null) {
      task[4] = !task[4];
      db.updateDataBase();
      home_controller.update();
    }
  }

  void checkboxChanged(String taskId, int i) {
    var task =
        todotask.firstWhere((task) => task[5] == taskId, orElse: () => null);
    if (task != null) {
      task[3] = !task[3];

      db.updateDataBase();
      home_controller.update();
    }
  }

  void deleteTask(String taskId, int i) {
    todotask.removeWhere((task) => task[5] == taskId);

    db.updateDataBase();
    home_controller.update();
  }
}
