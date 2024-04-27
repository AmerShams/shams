import 'package:flutter/material.dart';
import 'package:teknosoft/data/model/todo-Model.dart';

final List<String> weeekdays = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];
final List<DateTime> weeekday = [];
List<TodoModel> todoList = [];
List todotask = [];

List categories = ['Personal', 'Learning', 'Work', 'Shopping'];
List categories1 = ['personal', 'learning', 'work', 'shopping'];
List categoryIcon = [
  const Icon(Icons.person_2_rounded,
      size: 25, color: Color.fromARGB(181, 255, 255, 255)),
  const Icon(Icons.edit_sharp,
      size: 28, color: Color.fromARGB(181, 255, 255, 255)),
  Image.asset('assets/images/handbag.png',
      scale: 18, color: const Color.fromARGB(181, 255, 255, 255)),
  Image.asset(
    'assets/images/shopping.png',
    scale: 14,
    color: const Color.fromARGB(255, 255, 255, 255),
  ),
];

List<List<Color>> grad = [
  [
    const Color.fromARGB(187, 117, 165, 220),
    const Color.fromARGB(189, 51, 109, 176),
    const Color.fromARGB(200, 9, 65, 130)
  ],
  [
    const Color.fromARGB(93, 140, 74, 176),
    const Color.fromARGB(188, 71, 49, 116),
    const Color.fromARGB(187, 104, 73, 167),
  ],
  [
    const Color.fromARGB(187, 61, 188, 139),
    const Color.fromARGB(185, 2, 90, 90),
    const Color.fromARGB(198, 2, 64, 110)
  ],
  [
    const Color.fromARGB(161, 221, 145, 97),
    const Color.fromARGB(186, 169, 68, 9),
    const Color.fromARGB(200, 136, 44, 1),
  ],
];
