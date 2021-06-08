import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../services/database.dart';
import '../../../meals/toggle_favorite_mixin.dart';
import '../../../models/meal_user_favorite.dart';
import '../../../../../constants.dart';
import '../../../models/meal.dart';
import 'top_meals_container.dart';

class TopMeals extends StatelessWidget with ToggleFavoriteMixin {
  final MealUserFavorite userFavoriteMeal;

  TopMeals({Key? key, required this.userFavoriteMeal}) : super(key: key);

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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          TopMealsContainer(
            borderColor: Theme.of(context).colorScheme.secondary.withAlpha(30),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12.0),
                        topRight: Radius.circular(12.0),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(userFavoriteMeal.meal.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userFavoriteMeal.meal.mealName,
                          style: Theme.of(context).textTheme.bodyText1,
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 10.0),
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
                        const SizedBox(height: 5.0),
                        // Text(data)
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
          const SizedBox(width: 20.0),
        ],
      ),
    );
  }
}
