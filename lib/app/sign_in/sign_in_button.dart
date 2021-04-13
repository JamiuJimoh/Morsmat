import 'package:flutter/material.dart';

import '../../common_widgets/custom_elevated_button.dart';

class SignInButton extends CustomElevatedButton {
  SignInButton({
    required String text,
    required VoidCallback onPressed,
  }) : super(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
          height: 50.0,
          onPressed: onPressed,
          width: double.infinity,
        );
}
