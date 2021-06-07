import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:morsmat/app/home/meals/toggle_favorite_mixin.dart';
import 'package:morsmat/app/home/models/favorite.dart';
import 'package:morsmat/common_widgets/show_exception_alert_dialog.dart';
import 'package:provider/provider.dart';

import '../../../../../services/database.dart';
import '../../../../../constants.dart';
import '../../../models/meal_user_favorite.dart';
import 'featured_meals_container.dart';

class FeaturedMeals extends StatelessWidget with ToggleFavoriteMixin {
  final MealUserFavorite userFavoriteMeal;

  FeaturedMeals({Key? key, required this.userFavoriteMeal}) : super(key: key);

  Future<void> _toggleFavorite(BuildContext context) async {
    toggleFavorite(
      context,
      database: Provider.of<Database>(context, listen: false),
      mealId: userFavoriteMeal.meal.mealId,
      isFavorite: userFavoriteMeal.isFavorite,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FeaturedMealsContainer(
          borderColor: Theme.of(context).colorScheme.secondary.withAlpha(30),
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.0),
                      bottomLeft: Radius.circular(12.0),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(userFavoriteMeal.meal.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10.0),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 120.0,
                        child: Text(
                          userFavoriteMeal.meal.mealName,
                          style: Theme.of(context).textTheme.bodyText1,
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 80.0,
                            child: Text(
                              userFavoriteMeal.meal.location,
                              style: Theme.of(context).textTheme.subtitle1,
                              softWrap: false,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            '|',
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          const SizedBox(width: 5.0),
                          Text(
                            '${userFavoriteMeal.meal.distance} kms',
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.star, color: kStarColor),
                          Text(
                            ' ${userFavoriteMeal.meal.ratings}',
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          const SizedBox(width: 7.0),
                          Icon(
                            Icons.circle,
                            size: 8.0,
                            color: Theme.of(context).colorScheme.surface,
                          ),
                          const SizedBox(width: 7.0),
                          Text(
                            '${userFavoriteMeal.meal.timeToPrep} mins',
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.attach_money,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          Text(
                            '${userFavoriteMeal.meal.price}',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          const Spacer(),
                          InkWell(
                            child: Icon(
                              userFavoriteMeal.isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_outline,
                              color: Theme.of(context).colorScheme.secondary,
                              size: 30.0,
                            ),
                            onTap: () {
                              _toggleFavorite(context);
                            },
                          ),
                          // child:
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15.0),
      ],
    );
  }
}
