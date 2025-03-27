import 'package:flutter/material.dart';

class CustomTextfields extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final bool obscureText;
  final TextInputType? keyboardType;

  const CustomTextfields({
    super.key,
    this.hintText,
    this.labelText,
    this.controller,
    this.onChanged,
    this.obscureText = false,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 16,
        ),
      ),
    );
  }
}
