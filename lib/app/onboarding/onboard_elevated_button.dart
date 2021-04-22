import 'package:flutter/material.dart';

import '../../common_widgets/custom_elevated_button.dart';

class OnboardElevatedButton extends CustomElevatedButton {
  OnboardElevatedButton({
    required String label,
    required VoidCallback onPressed,
    required BuildContext context,
  }) : super(
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontSize: 20.0,
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
          borderRadius: 20.0,
          height: 60.0,
          width: double.infinity,
          buttonColor: Theme.of(context).colorScheme.secondary,
          onPressed: onPressed,
        );
}
