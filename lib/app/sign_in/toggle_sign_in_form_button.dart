import 'package:flutter/material.dart';

import '../../common_widgets/custom_elevated_button.dart';

class ToggleSignInFormButton extends CustomElevatedButton {
  ToggleSignInFormButton({
    required String text,
    required BuildContext context,
    Color? buttonColor,
    VoidCallback? onPressed,
  }) : super(
          borderRadius: 20.0,
          buttonColor: buttonColor,
          child: Text(
            text,
            style: buttonColor == Theme.of(context).colorScheme.secondary
                ? Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(color: Theme.of(context).colorScheme.primary)
                : Theme.of(context).textTheme.bodyText2,
          ),
          height: 30.0,
          onPressed: onPressed,
          width: 100.0,
        );
}
