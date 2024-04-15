import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final Color? backgroundColor;
  final Widget icon;
  final Function()? onPressed;
  final EdgeInsetsGeometry? padding;
  final double? elevation;
  const CircleButton({super.key, required this.icon, this.backgroundColor, required this.onPressed, this.padding, this.elevation});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: Colors.white,
        shape: const CircleBorder(),
        padding: padding,
        elevation: elevation,
      ),
      onPressed: onPressed,
      child: icon,
    );
  }
}
