import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  final Widget child;
  final Color borderSideColor;
  final double borderRadius;
  final VoidCallback? onPressed;

  CustomOutlinedButton({
    required this.child,
    required this.borderSideColor,
    this.borderRadius: 20.0,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      child: child,
      onPressed: onPressed,
      clipBehavior: Clip.hardEdge,
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: borderSideColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}
