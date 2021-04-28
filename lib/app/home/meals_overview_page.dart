import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:morsmat/common_widgets/show_exception_alert_dialog.dart';
import 'package:provider/provider.dart';

import 'categories_container.dart';
import '../../common_widgets/show_alert_dialog.dart';
import '../../services/database.dart';
import '../../services/auth.dart';
import 'models/meal.dart';

class MealsOverviewPage extends StatelessWidget {
  ///////// HELPER METHOD ////////

  Future<void> _createMeal(BuildContext context) async {
    try {
      final database = Provider.of<Database>(context, listen: false);
      await database.createMeal(
        Meal(
          mealId: '111',
          mealName: 'Meat',
          description:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sollicitudin molestie malesuada.',
          price: 10.0,
          imageUrl:
              'https://images.unsplash.com/photo-1592894869086-f828b161e90a?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=500&q=40.png',
          timeToPrep: 45,
          distance: 24.5,
          location: '97, Stockholm',
        ),
      );
    } on FirebaseException catch (e) {
      showExceptionAlertDialog(
        context,
        title: 'Operation failed',
        exception: e,
      );
    }
  }

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
            // TODO: Empty list page
            if (meals.length == 0) {
              return Center(child: Text('No meals yet'));
            }
            final children = meals.map((meal) => Text(meal.mealName)).toList();

            return ListView(children: children);
          }
          if (snapshot.hasError) {
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
        onPressed: () => _createMeal(context),
        child: Icon(Icons.add),
        elevation: 1.0,
      ),
    );
  }
}
