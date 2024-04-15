import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
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
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final bool autofocus;

  const CustomTextField({
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
    this.textInputAction,
    this.focusNode,
    this.autofocus = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText ?? false,
      maxLines: maxLines,
      textInputAction: textInputAction ?? TextInputAction.next,
      focusNode: focusNode,
      autofocus: autofocus,
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
