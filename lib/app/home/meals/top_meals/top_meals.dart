import 'package:flutter/material.dart';

import '../../models/meal.dart';
import 'top_meals_container.dart';

class TopMeals extends StatelessWidget {
  final Meal meal;

  const TopMeals({Key? key, required this.meal}) : super(key: key);
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
                        image: NetworkImage(meal.imageUrl),
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
                          meal.mealName,
                          style: Theme.of(context).textTheme.bodyText1,
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 10.0),
                        Row(
                          children: [
                            Text(
                              meal.location,
                              style: Theme.of(context).textTheme.subtitle1,
                              softWrap: false,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              ' | ',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            Text(
                              '${meal.distance} kms',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.star),
                            Text(
                              ' ${meal.ratings}',
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
                              '${meal.timeToPrep} mins',
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
                              '${meal.price}',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            const Spacer(),
                            Icon(
                              Icons.favorite_outline,
                              color: Theme.of(context).colorScheme.secondary,
                              size: 30.0,
                            ),
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
