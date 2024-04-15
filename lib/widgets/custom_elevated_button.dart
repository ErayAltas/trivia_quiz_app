import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({super.key, required this.text, this.backgroundColor, required this.onPressed});
  final Color? backgroundColor;
  final String text;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
        backgroundColor: backgroundColor ?? Colors.blue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      ),
      onPressed: onPressed,
      child: Text(text, style: Get.textTheme.bodyLarge?.copyWith(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
    );
  }
}
