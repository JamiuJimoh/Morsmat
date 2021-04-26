import 'package:flutter/material.dart';

import '../../common_widgets/custom_elevated_button.dart';

class FormSubmitButton extends CustomElevatedButton {
  FormSubmitButton({
    required Widget child,
    VoidCallback? onPressed,
    required BuildContext context,
  }) : super(
          buttonColor: Theme.of(context).colorScheme.secondary,
          child: child,
          height: 48.0,
          onPressed: onPressed,
          width: double.infinity,
        );
}
