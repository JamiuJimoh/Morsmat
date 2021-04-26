import 'package:flutter/material.dart';
import 'package:morsmat/common_widgets/custom_container.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? errorText;
  final String? hintText;
  final String? labelText;
  final IconData? icon;
  final Widget? suffixIcon;
  final bool enabled;
  final bool obscureText;
  final void Function(String)? onChanged;
  final void Function()? onEditingComplete;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;

  CustomTextField({
    this.controller,
    this.errorText,
    this.hintText,
    this.labelText,
    this.icon,
    this.suffixIcon,
    this.enabled: true,
    this.obscureText: false,
    this.onChanged,
    this.onEditingComplete,
    this.keyboardType,
    this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return CustomContainer(
      borderRadius: 5.0,
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
      height: 55.0,
      width: mediaQuery.width * 0.9,
      containerColor: Theme.of(context).colorScheme.primaryVariant,
      borderColor: Theme.of(context).colorScheme.primaryVariant,
      child: TextFormField(
        cursorColor: Theme.of(context).colorScheme.onPrimary,
        autocorrect: false,
        controller: controller,
        style: Theme.of(context).textTheme.bodyText2,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          hintText: hintText,
          labelText: labelText,
          // labelStyle: Theme.of(context).textTheme.subtitle1,
          // focusColor: Theme.of(context).colorScheme.onPrimary,

          border: InputBorder.none,
          icon: Icon(icon),
          suffixIcon: suffixIcon,
          enabledBorder: InputBorder.none,
          errorText: errorText,
          enabled: enabled,
        ),
        onChanged: onChanged,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        obscureText: obscureText,
        onEditingComplete: onEditingComplete,
      ),
    );
  }
}
