// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:teknosoft/core/constant/color.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final DateTime date;
  final DateTime enddate;
  final String category;
  final bool important;
  final bool isDone;
  final void Function()? editTask;
  final void Function()? onPressedImporntant;
  final void Function(bool?)? onChanged;
  final void Function(BuildContext)? deleteFunc;

  const CustomCard({
    super.key,
    required this.date,
    required this.title,
    required this.category,
    required this.important,
    required this.isDone,
    required this.onPressedImporntant,
    required this.onChanged,
    required this.deleteFunc,
    required this.enddate,
    this.editTask,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
              onPressed: deleteFunc,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(20))
        ],
      ),
      child: InkWell(
        onTap: editTask,
        child: Card(
          elevation: 4,
          color: Colors.white,
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Checkbox(
                        value: isDone,
                        onChanged: onChanged,
                      )),
                  Expanded(
                    child: ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                                decoration: isDone
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                                fontSize: 17,
                                color: AppColor.primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "${DateFormat('HH:mm').format(date)} - ${DateFormat('HH:mm').format(enddate)}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Color.fromARGB(255, 147, 146, 146)),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.circle,
                                size: 14,
                                color: category == 'work'
                                    ? const Color.fromARGB(148, 1, 87, 53)
                                    : category == "learning"
                                        ? const Color.fromARGB(181, 47, 5, 132)
                                        : category == "personal"
                                            ? const Color.fromARGB(
                                                179, 13, 68, 108)
                                            : const Color.fromARGB(
                                                207, 206, 72, 57),
                              ),
                              Text(
                                "  $category",
                                style: const TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w600),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  IconButton(
                    alignment: Alignment.topRight,
                    icon: important
                        ? const Icon(
                            Icons.star_rounded,
                            size: 30,
                            color: Color.fromARGB(161, 2, 39, 3),
                          )
                        : const Icon(
                            Icons.star_outline_rounded,
                            size: 30,
                            color: Color.fromARGB(103, 52, 145, 55),
                          ),
                    onPressed: onPressedImporntant,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
