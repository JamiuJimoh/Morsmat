import 'package:flutter/material.dart';
import 'package:morsmat/constants.dart';

import '../../models/meal.dart';
import 'featured_meals_container.dart';

class FeaturedMeals extends StatelessWidget {
  final Meal meal;

  const FeaturedMeals({Key? key, required this.meal}) : super(key: key);

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
                      image: NetworkImage(meal.imageUrl),
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
                          meal.mealName,
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
                              meal.location,
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
        const SizedBox(height: 15.0),
      ],
    );
  }
}
