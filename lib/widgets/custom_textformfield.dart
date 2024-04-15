import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? labelText, hintText;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixWidget;
  final TextEditingController? controller;
  final InputBorder? border;
  final EdgeInsetsGeometry? contentPadding;
  final Color? fillColor;
  final int? maxLines;
  final String? Function(String?)? validator;
  final bool autofocus;
  final TextInputAction textInputAction;

  const CustomTextFormField({
    super.key,
    this.labelText,
    this.hintText,
    this.obscureText,
    this.keyboardType,
    this.prefixIcon,
    this.suffixWidget,
    this.controller,
    this.border,
    this.contentPadding,
    this.fillColor,
    this.maxLines,
    this.validator,
    this.autofocus = false,
    this.textInputAction = TextInputAction.done,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText ?? false,
      maxLines: maxLines,
      autofocus: autofocus,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        labelText: labelText,
        hintText: hintText,
        suffixIcon: suffixWidget,
        suffixIconConstraints: const BoxConstraints(minWidth: 42, minHeight: 36),
        border: border ?? OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        enabledBorder: border ?? OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Colors.grey)),
        focusedBorder: border ?? OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Colors.blue)),
        contentPadding: contentPadding ?? const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        fillColor: fillColor,
        filled: fillColor != null,
      ),
    );
  }
}
