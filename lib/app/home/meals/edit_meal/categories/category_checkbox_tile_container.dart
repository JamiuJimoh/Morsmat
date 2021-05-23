import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../../common_widgets/custom_container.dart';

class CategoryCheckboxTileContainer extends CustomContainer {
  CategoryCheckboxTileContainer({
    required Widget child,
    required Color borderColor,
  }) : super(
          height: 60.0,
          width: double.infinity,
          child: child,
          borderRadius: 5.0,
          borderColor: borderColor,
        );
}
