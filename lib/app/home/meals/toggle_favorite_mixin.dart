import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

import '../models/favorite.dart';
import '../../../common_widgets/show_exception_alert_dialog.dart';
import '../../../services/database.dart';

mixin ToggleFavoriteMixin {
  Future<void> toggleFavorite(
    BuildContext context, {
    required Database database,
    required String mealId,
    required bool isFavorite,
  }) async {
    try {
      final favoriteMeal = FavoriteMeal(
        mealId: mealId,
        isFavorite: !isFavorite,
      );
      await database.setFavoriteMeal(favoriteMeal);
    } on FirebaseException catch (e) {
      showExceptionAlertDialog(
        context,
        title: 'Operation failed',
        exception: e,
      );
    }
  }
}
