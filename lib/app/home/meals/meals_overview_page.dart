import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import 'categories_container.dart';
import '../../../constants.dart';
import '../../../services/database.dart';
import '../models/meal.dart';
import 'list_items_builder.dart';
import '../models/meal_user_favorite.dart';
import 'meals_list_view_model.dart';
import 'meals_list_view_model.dart';
import 'ui/featured_meals/featured_meals.dart';
import 'ui/meal_categories/categories_list_view_builder.dart';
import 'ui/top_meals/top_meals.dart';

class MealsOverviewPage extends StatelessWidget {
  final MealsListViewModel mealsListViewModel;

  const MealsOverviewPage({Key? key, required this.mealsListViewModel})
      : super(key: key);
  static Widget create(BuildContext context) {
    final database = Provider.of<Database>(context, listen: false);
    return Provider<MealsListViewModel>(
      create: (_) => MealsListViewModel(database: database),
      child: Consumer<MealsListViewModel>(
        builder: (_, mealsListViewModel, __) => MealsOverviewPage(
          mealsListViewModel: mealsListViewModel,
        ),
      ),
    );
  }

  ///////// WIDGETS METHOD ////////

  Widget _buildContent(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0, right: 20.0, left: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Experience the food freedom!',
              style: Theme.of(context).textTheme.headline2,
            ),
            const SizedBox(height: 20.0),
            CategoriesListViewBuilder(),
            const SizedBox(height: 30.0),
            Text(
              'Top Meals',
              style: Theme.of(context).textTheme.bodyText1,
              // textAlign: TextAlign.start,
            ),
            const SizedBox(height: 15.0),
            StreamBuilder<List<MealUserFavorite>>(
              stream: mealsListViewModel.allMealsStream,
              builder: (context, snapshot) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // SizedBox(
                    //   height: kTopMealsSizedBoxHeight,
                    //   child: ListItemsBuilder<MealUserFavorite>(
                    //     snapshot: snapshot,
                    //     scrollDirection: Axis.horizontal,
                    //     itemBuilder: (context, meal) => TopMeals(
                    //       meal: meal,
                    //       // onTap: meal.vendorId == user?.uid
                    //       //     ? () => EditMealPage.show(context, meal: meal)
                    //       //     : null,
                    //     ),
                    //   ),
                    // ),
                    const SizedBox(height: 40.0),
                    Text(
                      'Featured Meals',
                      style: Theme.of(context).textTheme.bodyText1,
                      textAlign: TextAlign.left,
                      // textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 15.0),
                    ListItemsBuilder<MealUserFavorite>(
                      snapshot: snapshot,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, meal) => FeaturedMeals(
                        userFavoriteMeal:meal,
                        // onTap: meal.vendorId == user?.uid
                        //     ? () => EditMealPage.show(context, meal: meal)
                        //     : null,
                      ),
                    ),
                  ],
                );
              },
            ),

            // StreamBuilder<List<Meal>>(
            //   stream: database.mealsStream(),
            //   builder: (context, snapshot) {
            // return ListItemsBuilder<Meal>(
            //   snapshot: snapshot,
            //   shrinkWrap: true,
            //   scrollDirection: Axis.vertical,
            //   itemBuilder: (context, meal) => TopMeals(
            //     meal: meal,
            //     // onTap: meal.vendorId == user?.uid
            //     //     ? () => EditMealPage.show(context, meal: meal)
            //     //     : null,
            //   ),
            // );
            //   },
            // ),
            // const SizedBox(height: 30.0),
          ],
        ),
      ),

      // child:
    );
    // return CustomScrollView(
    //   slivers: [
    //     SliverToBoxAdapter(
    //       child: Padding(
    //         padding: const EdgeInsets.all(18.0),
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             Padding(
    //               padding: const EdgeInsets.only(bottom: 15.0),
    //               child: Text(
    //                 'Popular',
    //                 style: Theme.of(context).textTheme.bodyText1,
    //               ),
    //             ),
    //             Row(
    //               children: [
    //                 CategoriesContainer(context: context),
    //                 CategoriesContainer(context: context),
    //                 CategoriesContainer(context: context),
    //               ],
    //             ),
    //             // SliverList(
    //             //   delegate: SliverChildBuilderDelegate(
    //             //     (ctx, i) {
    //             //       return Container(
    //             //         margin: const EdgeInsets.symmetric(vertical: 10.0),
    //             //         child: MealsListBuilder(index: i, isPopular: false),
    //             //       );
    //             //     },
    //             //     childCount: mealsData.mealsListLength,
    //             //   ),
    //             // ),
    //             // SizedBox(
    //             //   height: 200.0,
    //             //   child: ListView.builder(
    //             //     scrollDirection: Axis.horizontal,
    //             //     itemCount: mealsData.mealsListLength,
    //             //     itemBuilder: (ctx, i) {
    //             //       return Padding(
    //             //         padding: const EdgeInsets.only(right: 15.0),
    //             //         child: MealsListBuilder(index: i, isPopular: true),
    //             //       );
    //             //     },
    //             //   ),
    //             // ),
    //           ],
    //         ),
    //       ),
    //     ),
    //     SliverToBoxAdapter(
    //       child: Padding(
    //         padding: const EdgeInsets.all(18.0),
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             Padding(
    //               padding: const EdgeInsets.only(bottom: 15.0),
    //               child: Text(
    //                 'Featured',
    //                 style: Theme.of(context).textTheme.bodyText1,
    //               ),
    //             ),
    //             // SliverList(
    //             //   delegate: SliverChildBuilderDelegate(
    //             //     (ctx, i) {
    //             //       return Container(
    //             //         margin: const EdgeInsets.symmetric(vertical: 10.0),
    //             //         child: MealsListBuilder(index: i, isPopular: false),
    //             //       );
    //             //     },
    //             //     childCount: mealsData.mealsListLength,
    //             //   ),
    //             // ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ],
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
        elevation: 0.0,
      ),
      body: _buildContent(context),
    );
  }
}
