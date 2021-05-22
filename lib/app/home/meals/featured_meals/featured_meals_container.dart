import 'package:flutter/material.dart';

import '../../../../common_widgets/custom_container.dart';
import '../../../../constants.dart';

class FeaturedMealsContainer extends CustomContainer {
  FeaturedMealsContainer({
    required Color borderColor,
    required Widget child,
    required double width,
  }) : super(
          height: kFeaturedMealsSizedBoxHeight,
          width: width,
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
