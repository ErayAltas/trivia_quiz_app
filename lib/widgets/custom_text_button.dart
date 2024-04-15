import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({super.key, required this.text, this.backgroundColor, required this.onPressed, this.shape});
  final Color? backgroundColor;
  final String text;
  final Function()? onPressed;
  final OutlinedBorder? shape;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: shape,
      ),
      onPressed: onPressed,
      child: Text(text, style: Get.textTheme.bodyLarge),
    );
  }
}
