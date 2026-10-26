import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  final bool isPassword;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;

  const CustomInputField({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    this.isPassword = false,
    this.controller,
    this.suffixIcon,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFAF6F0),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFE4D8C9),
          width: 1,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        keyboardType: keyboardType,
        style: const TextStyle(
          color: Color(0xFF331D10),
          fontSize: 14.5,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          icon: Icon(
            prefixIcon,
            color: const Color(0xFF5A4030),
            size: 20,
          ),
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Color(0xFF9E8F82),
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
