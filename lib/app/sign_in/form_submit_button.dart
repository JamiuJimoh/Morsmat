import 'package:flutter/material.dart';

import '../../common_widgets/custom_elevated_button.dart';

class FormSubmitButton extends CustomElevatedButton {
  FormSubmitButton({
    required String text,
    VoidCallback? onPressed,
    required BuildContext context,
  }) : super(
          buttonColor: Theme.of(context).colorScheme.secondary,
          child: Text(
            text,
            style: onPressed != null
                ? Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: Theme.of(context).colorScheme.primary)
                : Theme.of(context).textTheme.bodyText1,
          ),
          height: 48.0,
          onPressed: onPressed,
          width: double.infinity,
        );
}
