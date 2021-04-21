import 'package:flutter/material.dart';
import 'package:morsmat/constants.dart';

class CustomContainer extends StatelessWidget {
  final double height;
  final double width;
  final Widget child;
  final Color? containerColor;
  final Color? borderColor;
  final double? borderRadius;

  CustomContainer({
    required this.height,
    required this.width,
    required this.child,
    this.containerColor: kScaffoldColor,
    this.borderColor: kAccentColor,
    this.borderRadius: 20.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius!)),
          color: containerColor,
          border: Border(
            top: BorderSide(color: borderColor!),
            bottom: BorderSide(color: borderColor!),
            left: BorderSide(color: borderColor!),
            right: BorderSide(color: borderColor!),
          ),
        ),
        child: child,
      ),
    );
  }
}
