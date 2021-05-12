import 'package:flutter/material.dart';

import '../../../common_widgets/custom_text_form_field.dart';

class EditMealTextFormField extends CustomTextFormField {
  EditMealTextFormField({
    required BuildContext context,
    required TextInputAction textInputAction,
    required String labelText,
    required String initialValue,
    int? maxLines: 1,
    TextInputType? keyboardType,
    void Function(String?)? onSaved,
    String? Function(String?)? validator,
  }) : super(
          initialValue: initialValue,
          cursorColor: Theme.of(context).colorScheme.onPrimary,
          style: Theme.of(context).textTheme.bodyText2,
          maxLines: maxLines,
          keyboardType: keyboardType,
          onSaved: onSaved,
          labelText: labelText,
          textInputAction: textInputAction,
          validator: validator,
        );
}
