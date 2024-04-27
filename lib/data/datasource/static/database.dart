import 'package:hive_flutter/hive_flutter.dart';
import 'package:teknosoft/data/datasource/static/static.dart';

class ToDoDataBase {
  // reference our box

  final _myBox = Hive.box('mybox');

  // run this method if this is the 1st time ever opening this app
  void createInitialData() {
    todotask = [];
  }

  // load the data from database
  void loadData() {
    todotask = _myBox.get("TODOLIST");
  }

  // update the database
  void updateDataBase() {
    _myBox.put("TODOLIST", todotask);
  }
}
