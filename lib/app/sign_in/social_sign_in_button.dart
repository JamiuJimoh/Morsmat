import 'package:flutter/material.dart';

import '../../common_widgets/custom_elevated_button.dart';

class SocialSignInButton extends CustomElevatedButton {
  SocialSignInButton({
    required String  assetName,
    required String  text,
    required Color textColor,
    Color? buttonColor,
    required onPressed,
  }) : super(
          buttonColor: buttonColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Image.asset(assetName),
              Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontSize: 15.0,
                ),
              ),
              Opacity(opacity: 0.0, child: Image.asset(assetName)),
            ],
          ),
          height: 48.0,
          width: double.infinity,
          onPressed: onPressed,
        );
}
