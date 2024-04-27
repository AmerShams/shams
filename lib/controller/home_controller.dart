// ignore_for_file: camel_case_types

import 'package:get/get.dart';
import 'package:teknosoft/data/datasource/static/static.dart';

class Home_controller extends GetxController {
  int trueCount = 0;
  double m = 0.0;
  int taskLeft = 0;
  int tasksForToday = 0;
  dochange() {
    trueCount = 0;
    if (todotask.isEmpty) {
      m = 0;
      return m;
    } else {
      for (var innerList in todotask) {
        if (innerList[3] == true) {
          trueCount++;
        }
      }
      m = trueCount / todotask.length;
      return m;
    }
  }

  int countTasksForToday() {
    // الحصول على تاريخ اليوم الحالي
    DateTime today = DateTime.now();

    // حساب عدد المهام التي تبدأ في اليوم الحالي
    tasksForToday = todotask.where((task) => task[1].day == today.day).length;

    return tasksForToday;
  }

  taskleftCount() {
    trueCount = 0;
    if (todotask.isEmpty) {
      taskLeft = 0;
      return taskLeft;
    } else {
      for (var innerList in todotask) {
        if (innerList[3] == true) {
          trueCount++;
        }
      }
      taskLeft = todotask.length - trueCount;
      return taskLeft;
    }
  }

  categorycount(String category) {
    int count = 0;
    for (int i = 0; i < todotask.length; i++) {
      if (todotask[i][2] == category) {
        count++;
      }
    }
    return count;
  }

  importantcount() {
    int countimp = 0;
    for (int i = 0; i < todotask.length; i++) {
      if (todotask[i][4] == true) {
        countimp++;
      }
    }
    return countimp;
  }
}
