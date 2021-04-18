import 'package:flutter/material.dart';
import 'package:morsmat/constants.dart';

import '../../common_widgets/custom_elevated_button.dart';

class FormSubmitButton extends CustomElevatedButton {
  FormSubmitButton({
    required String text,
    VoidCallback? onPressed,
  }) : super(
          buttonColor: kAccentColor,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
          height: 48.0,
          onPressed: onPressed,
          width: double.infinity,
        );
}
