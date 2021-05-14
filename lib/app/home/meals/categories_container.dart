import 'package:flutter/material.dart';

import '../../../common_widgets/custom_container.dart';

class CategoriesContainer extends CustomContainer {
  CategoriesContainer({required BuildContext context})
      : super(
          height: 90.0,
          width: 90.0,
          child: Container(),
          borderColor: Theme.of(context).colorScheme.secondary,
          containerColor:Theme.of(context).colorScheme.primary
        );
}
