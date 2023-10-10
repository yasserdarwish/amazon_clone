import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.controller,
      required this.hint,
      this.maxLines,
      required this.digitsOnly});
  final TextEditingController controller;
  final String hint;
  final int? maxLines;
  final bool digitsOnly;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: digitsOnly
          ? const TextInputType.numberWithOptions(decimal: true)
          : null,
      inputFormatters:
          digitsOnly ? [FilteringTextInputFormatter.digitsOnly] : [],
      maxLines: maxLines,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Please Enter your $hint';
        }
        return null;
      },
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
