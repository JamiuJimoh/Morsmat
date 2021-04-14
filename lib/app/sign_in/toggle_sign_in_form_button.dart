import 'package:flutter/material.dart';

import '../../common_widgets/custom_elevated_button.dart';

class ToggleSignInFormButton extends CustomElevatedButton {
  ToggleSignInFormButton({
    Color? buttonColor,
    required String text,
    VoidCallback? onPressed,
  }) : super(
          borderRadius: 20.0,
          buttonColor: buttonColor,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 15.0,
            ),
          ),
          height: 30.0,
          onPressed: onPressed,
          width: 100.0,
        );
}
