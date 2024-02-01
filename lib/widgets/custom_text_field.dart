import 'package:buddy_ext/models/app_test.dart';
import 'package:buddy_ext/utils/constant.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  const CustomTextField({super.key, this.controller });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: const InputDecoration(
        border: OutlineInputBorder(borderSide: BorderSide(color: primaryColor)),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: primaryColor)),
      ),
      validator: (value) {
        if (value != null && value.isNotEmpty) return null;
        return AppText.requiredField;
      },
    );
  }
}
