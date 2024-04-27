import 'package:get/get.dart';
import 'package:teknosoft/controller/home_controller.dart';
import 'package:teknosoft/data/datasource/static/database.dart';
import 'package:teknosoft/data/datasource/static/static.dart';

class CategoryController extends GetxController {
  Home_controller hcontroller = Get.put(Home_controller());

  ToDoDataBase db = ToDoDataBase();

  String? title;
  List filteredTasks = [];

  @override
  void onInit() {
    title = Get.arguments['title'];
    filteredTasks.clear();

    filteredTasks = todotask.where((task) => task[2] == title).toList();
    super.onInit();
  }

  void changeimportant(String taskId) {
    // Find the task with the specified ID
    var task =
        todotask.firstWhere((task) => task[5] == taskId, orElse: () => null);
    if (task != null) {
      // Toggle the 'important' value
      task[4] = !task[4];
      // filteredTasks[i][4] = !filteredTasks[i][4];
      // Update the database and UI
      db.updateDataBase();
      update();
      hcontroller.update();
    }
  }

  void checkboxChanged(String taskId) {
    var task =
        todotask.firstWhere((task) => task[5] == taskId, orElse: () => null);
    if (task != null) {
      // Toggle the 'important' value
      task[3] = !task[3];
      // filteredTasks[i][4] = !filteredTasks[i][4];
      // Update the database and UI
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
