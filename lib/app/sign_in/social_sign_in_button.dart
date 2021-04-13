import 'package:flutter/material.dart';

import '../../common_widgets/custom_elevated_button.dart';

class SocialSignInButton extends CustomElevatedButton {
  SocialSignInButton({
    required assetName,
    required onPressed,
  }) : super(
          buttonColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Image.asset(assetName),
          ),
          height: 65.0,
          width: 65.0,
          onPressed: onPressed,
          borderRadius: 60.0,
        );
}
