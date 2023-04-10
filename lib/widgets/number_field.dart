import 'package:flutter/material.dart';
import '../theme/palette.dart';

class InputFieldBox extends StatelessWidget {

  const InputFieldBox({
    super.key,
    required this.controller,
    required this.hintText,
    required this.validate,
  });
  final TextEditingController controller;
  final String hintText;
  final bool validate;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Please enter an integer.';
        }
        final RegExp intRegex = RegExp(r'^-?\d+$');
        if (!intRegex.hasMatch(value)) {
          return 'Please enter a valid integer.';
        }
        return null;
      },
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Palette.blueColor,
            width: 3,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Palette.greyColor,
          ),
        ),
        contentPadding: const EdgeInsets.all(22),
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 18,
        ),
        errorText: validate ? "Value can't be empty!" : null,
      ),
      keyboardType: TextInputType.number,
    );
  }
}
