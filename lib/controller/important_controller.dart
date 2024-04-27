import 'package:get/get.dart';
import 'package:teknosoft/controller/home_controller.dart';
import 'package:teknosoft/data/datasource/static/database.dart';
import 'package:teknosoft/data/datasource/static/static.dart';

class ImportantControlller extends GetxController {
  Home_controller hcontroller = Get.put(Home_controller());

  ToDoDataBase db = ToDoDataBase();

  List filteredTasks = [];

  @override
  void onInit() {
    filteredTasks.clear();

    filteredTasks = todotask.where((task) => task[4] == true).toList();
    super.onInit();
  }

  void changeimportant(String taskId, int index) {
    var task =
        todotask.firstWhere((task) => task[5] == taskId, orElse: () => null);
    if (task != null) {
      task[4] = !task[4];
      filteredTasks.removeAt(index);
      db.updateDataBase();
      update();
      hcontroller.update();
    }
  }

  void checkboxChanged(String taskId) {
    var task =
        todotask.firstWhere((task) => task[5] == taskId, orElse: () => null);
    if (task != null) {
      task[3] = !task[3];

      db.updateDataBase();
      update();
      hcontroller.update();
    }
  }

  void deleteTask(String taskId, int i) {
    todotask.removeWhere((task) => task[5] == taskId);
    filteredTasks.removeAt(i);
    db.updateDataBase();
    update();
    hcontroller.update();
  }
}
