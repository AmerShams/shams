// ignore_for_file: file_names

class TodoModel {
  final String title;
  final String category;
  final bool important;
  final String todoDate;
  final bool isDone;

  TodoModel({
    required this.category,
    required this.important,
    required this.title,
    required this.todoDate,
    required this.isDone,
  });
}
