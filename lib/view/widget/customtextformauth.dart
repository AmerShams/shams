import 'package:flutter/material.dart';
import 'package:teknosoft/core/constant/color.dart';
import 'package:teknosoft/core/shared/utils.dart';

class CustomTextFormAuth extends StatelessWidget {
  final String labeltext;
  final TextEditingController? mycontroller;

  const CustomTextFormAuth({
    super.key,
    required this.labeltext,
    required this.mycontroller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        controller: mycontroller,
        decoration: InputDecoration(
            hintStyle: const TextStyle(fontSize: 14, color: AppColor.grey),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding: EdgeInsets.symmetric(
                vertical: screenHeight(45), horizontal: screenWidth(17)),
            label: Container(
                margin: EdgeInsets.symmetric(horizontal: screenWidth(20)),
                child: Text(labeltext)),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
      ),
    );
  }
}
