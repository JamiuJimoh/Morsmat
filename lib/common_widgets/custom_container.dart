import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final double height;
  final double width;
  final Widget child;
  final Color borderColor;
  final Color? containerColor;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onPressed;

  CustomContainer({
    required this.height,
    required this.width,
    required this.child,
    required this.borderColor,
    this.containerColor,
    this.padding,
    this.borderRadius: 20.0,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        height: height,
        width: width,
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius!)),
            color: containerColor,
            border: Border(
              top: BorderSide(color: borderColor),
              bottom: BorderSide(color: borderColor),
              left: BorderSide(color: borderColor),
              right: BorderSide(color: borderColor),
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
