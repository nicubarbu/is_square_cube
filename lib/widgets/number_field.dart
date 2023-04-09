import 'package:flutter/material.dart';
import 'package:is_square_cube/theme/palette.dart';

class InputFieldBox extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final _validate = false;

  const InputFieldBox({
    super.key,
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter an integer.';
        }
        final intRegex = RegExp(r'^-?\d+$');
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
        errorText: _validate ? 'Value can\'t be empty!' : null,
      ),
      keyboardType: const TextInputType.numberWithOptions(decimal: false),
    );
  }
}
