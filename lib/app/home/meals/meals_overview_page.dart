import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'meals_list_tile.dart';
// import 'categories_container.dart';
import 'edit_meal_page.dart';
import '../../../common_widgets/show_alert_dialog.dart';
import '../../../common_widgets/firebase_empty_state_page.dart';
import '../../../services/database.dart';
import '../../../services/auth.dart';
import '../models/meal.dart';

class MealsOverviewPage extends StatelessWidget {
  ///////// HELPER METHOD ////////

  Future<void> _signOut(BuildContext context) async {
    try {
      final auth = Provider.of<AuthBase>(context, listen: false);
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _confirmSignOut(BuildContext context) async {
    final didRequestSignOut = await showAlertDialog(
      context: context,
      title: 'Logout',
      content: 'Are you sure that you want to logout?',
      cancelActionText: 'Cancel',
      defaultActionText: 'Logout',
    );
    if (didRequestSignOut == true) {
      _signOut(context);
    }
  }

  ///////// WIDGETS METHOD ////////

  Widget _buildContent(BuildContext context) {
    final database = Provider.of<Database>(context, listen: false);

    return StreamBuilder<List<Meal>>(
        stream: database.mealsStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final meals = snapshot.data!;
            if (meals.length == 0) {
              return FirebaseEmptyStatePage();
            }
            final auth = Provider.of<AuthBase>(context, listen: false);
            final user = auth.currentUser;
            final children = meals
                .map((meal) => MealsListTile(
                      meal: meal,
                      onTap: meal.vendorId == user?.uid
                          ? () => EditMealPage.show(context, meal: meal)
                          : null,
                    ))
                .toList();

            return ListView(children: children);
          }
          if (snapshot.hasError) {
            print(snapshot.error);
            return Center(child: Text('Some error occurred!'));
          }
          return Center(child: CircularProgressIndicator());
        });
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
        actions: [
          TextButton(
            child: Text(
              'Logout',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            onPressed: () => _confirmSignOut(context),
          ),
        ],
      ),
      body: _buildContent(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () => EditMealPage.show(context),
        child: Icon(Icons.add),
        elevation: 1.0,
      ),
    );
  }
}
