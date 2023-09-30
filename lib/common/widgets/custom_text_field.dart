import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key, required this.controller, required this.hint});
  final TextEditingController controller;
  final String hint;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black)),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black)),
      ),
    );
  }
}
