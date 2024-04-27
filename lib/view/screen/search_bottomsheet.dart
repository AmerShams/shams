import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teknosoft/controller/search_controller.dart';
import 'package:teknosoft/core/constant/color.dart';

import 'package:teknosoft/view/widget/CustomCard.dart';

class SearchBottomSheet extends StatefulWidget {
  const SearchBottomSheet({super.key});

  @override
  State<SearchBottomSheet> createState() => _SearchBottomSheetState();
}

class _SearchBottomSheetState extends State<SearchBottomSheet> {
  @override
  Widget build(BuildContext context) {
    SearchesController controller = Get.put(SearchesController());

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        gradient: const LinearGradient(colors: [
          Color.fromARGB(255, 255, 255, 255),
          Color.fromARGB(133, 90, 164, 177)
        ]),
      ),
      height: 600,
      width: double.infinity,
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  flex: 4,
                  child: TextFormField(
                    controller: controller.searchcontroller,
                    onChanged: (value) {
                      controller.runFilter(value);
                    },
                    cursorColor: Colors.teal,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: "Search...",
                      hintStyle: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                          fontFamily: "Schyler",
                          fontWeight: FontWeight.bold),
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            const BorderSide(color: Colors.black45, width: 3),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide:
                            const BorderSide(color: Colors.black12, width: 3),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide:
                            const BorderSide(color: Colors.black12, width: 2),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 6,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: const EdgeInsets.only(top: 4),
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      padding: const EdgeInsets.symmetric(vertical: 13),
                      onPressed: () {
                        Get.back();
                      },
                      color: AppColor.secondColor,
                      textColor: Colors.white,
                      child: const Text("Cancel",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            width: double.infinity,
            height: 480,
            child: Obx(() {
              return ListView.builder(
                  itemCount: controller.foundtask.length,
                  itemBuilder: (ctx, index) {
                    return CustomCard(
                        title: controller.foundtask[index][0],
                        date: controller.foundtask[index][1],
                        category: controller.foundtask[index][2],
                        isDone: controller.foundtask[index][3],
                        important: controller.foundtask[index][4],
                        enddate: controller.foundtask[index][7],
                        onChanged: (value) {
                          controller.checkboxChanged(
                              controller.foundtask[index][5], index);
                          controller
                              .runFilter(controller.searchcontroller.text);
                        },
                        onPressedImporntant: () {
                          controller.changeimportant(
                              controller.foundtask[index][5], index);
                          controller
                              .runFilter(controller.searchcontroller.text);
                        },
                        deleteFunc: (context) {
                          controller.deleteTask(
                              controller.foundtask[index][5], index);
                          controller
                              .runFilter(controller.searchcontroller.text);
                        });
                  });
            }),
          ),
        ],
      ),
    );
  }
}
