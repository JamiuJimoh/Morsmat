import 'package:flutter/material.dart';

import '../../common_widgets/custom_outlined_button.dart';

class OnboardOutlinedButton extends CustomOutlinedButton {
  OnboardOutlinedButton({
    required String label,
    required VoidCallback onPressed,
    required BuildContext context,
  }) : super(
          child: Padding(
            padding: const EdgeInsets.all(9.0),
            child: Text(
              label,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary, //scaffc
              ),
            ),
          ),
          borderSideColor: Theme.of(context).colorScheme.secondary,
          onPressed: onPressed,
        );
}
