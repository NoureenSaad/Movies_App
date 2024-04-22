import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/colors_manager.dart';

import '../../config/theme/app_theme.dart';
typedef fieldValidation = String? Function(String? value);

class CustomTextFormField extends StatelessWidget {
  Widget? suffixIcon;
  String hintText;
  TextInputType keyboardType;
  TextEditingController controller;
  bool obscureText;
  fieldValidation? validator;
  Widget? prefixIcon;

  CustomTextFormField({
    super.key,
    required this.hintText,
    required this.keyboardType,
    required this.controller,
    this.validator,
    this.suffixIcon,
    this.obscureText = false,
    this.prefixIcon
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(color: Colors.black),
      cursorColor: Colors.black,
      keyboardType: keyboardType,
      obscureText: obscureText,
      obscuringCharacter: '*',
      validator: validator,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        enabled: true,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorsManager.selectedTabColor),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        hintText: hintText,
        hintStyle: AppTheme.lightTheme.textTheme.labelSmall?.copyWith(
          color: Colors.black,
        ),
      ),
    );
  }
}