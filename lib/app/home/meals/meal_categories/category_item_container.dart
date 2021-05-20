import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../common_widgets/custom_container.dart';

class CategoryItemContainer extends CustomContainer {
  CategoryItemContainer({
    required Color borderColor,
    required String svgAssetName,
    required String categName,
    required VoidCallback onPressed,
  }) : super(
          height: 100.0,
          width: 100.0,
          padding: const EdgeInsets.all(10.0),
          onPressed: onPressed,
          containerColor: Colors.white,
          borderRadius: 12.0,
          borderColor: borderColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(svgAssetName, height: 40.0, width: 40.0),
              const SizedBox(height: 10),
              Text(categName),
            ],
          ),
        );
}
