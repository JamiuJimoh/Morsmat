import 'package:flutter/cupertino.dart';
import 'package:morsmat/constants.dart';

import '../../common_widgets/custom_outlined_button.dart';

class OnboardOutlinedButton extends CustomOutlinedButton {
  OnboardOutlinedButton({
    required String label,
    required VoidCallback onPressed,
  }) : super(
          child: Padding(
            padding: const EdgeInsets.all(9.0),
            child: Text(
              label,
              style: TextStyle(
                color: kScaffoldColor,
              ),
            ),
          ),
          // borderRadius: 20.0,
          // borderSideColor: kAccentColor,
          onPressed: onPressed,
        );
}
