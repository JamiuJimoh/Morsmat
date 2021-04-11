import 'package:flutter/cupertino.dart';
import 'package:morsmat/common_widgets/custom_elevated_button.dart';

class SignInButton extends CustomElevatedButton {
  SignInButton({
    required String text,
  }) : super(
          child: Text(
            text,
          ),
        );
}
