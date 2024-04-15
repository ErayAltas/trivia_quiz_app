import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({super.key, required this.child, this.backgroundColor, required this.onPressed});
  final Color? backgroundColor;
  final Widget? child;
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
      child: child,
    );
  }
}
