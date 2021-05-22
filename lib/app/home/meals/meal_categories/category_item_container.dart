import 'package:flutter/material.dart';

import '../../../../common_widgets/custom_container.dart';

class CategoryItemContainer extends CustomContainer {
  CategoryItemContainer({
    required Color borderColor,
    required Widget child,
    required VoidCallback onPressed,
  }) : super(
          height: 100.0,
          width: 100.0,
          onPressed: onPressed,
          containerColor: Colors.white,
          borderRadius: 12.0,
          borderColor: borderColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 0.3,
              blurRadius: 0.3,
              offset: Offset(0.1, 0.1), // changes position of shadow
            ),
          ],
          child: child,
        );
}
