import 'package:flutter/material.dart';
import 'package:news_app/shared/theme/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? initialValue;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final String? errorText;
  final Function? onChanged;
  final Function? onFieldSubmitted;
  final int? maxLines;

  const CustomTextField({
    Key? key,
    this.controller,
    this.labelText,
    this.initialValue,
    this.suffixIcon,
    this.prefixIcon,
    this.obscureText,
    this.keyboardType,
    this.errorText,
    required this.onChanged,
    this.onFieldSubmitted,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText == null ? false : obscureText!,
      keyboardType: keyboardType,
      initialValue: initialValue,
      enableSuggestions: false,
      maxLines: maxLines ?? 1,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        errorText: errorText,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        labelText: labelText,
        focusColor: AppColors.mainColor,
        fillColor: AppColors.mainColor,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.mainColor),
          borderRadius: BorderRadius.circular(12),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.mainColor),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onChanged: onChanged as void Function(String?)?,
    );
  }
}
