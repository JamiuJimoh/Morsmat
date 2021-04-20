import 'package:flutter/cupertino.dart';
import 'package:morsmat/common_widgets/custom_elevated_button.dart';
import 'package:morsmat/constants.dart';

class OnboardElevatedButton extends CustomElevatedButton {
  OnboardElevatedButton({
    required String label,
    required VoidCallback onPressed,
  }) : super(
          child: Text(
            label,
            style: TextStyle(fontSize: 20.0),
          ),
          borderRadius: 20.0,
          height: 60.0,
          width: double.infinity,
          buttonColor: kAccentColor,
          onPressed: onPressed,
        );
}
