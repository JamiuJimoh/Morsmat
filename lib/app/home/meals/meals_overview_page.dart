import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import 'categories_container.dart';
import 'edit_meal_page.dart';
import '../../../common_widgets/show_alert_dialog.dart';
import '../../../services/database.dart';
import '../../../services/auth.dart';
import '../models/meal.dart';
import 'list_items_builder.dart';
import 'meals_list_tile.dart';

class MealsOverviewPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
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
    //TODO IMPORTANT: fix signout  bug
    final didRequestSignOut = await showAlertDialog(
      context: _scaffoldKey.currentContext!,
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
    final auth = Provider.of<AuthBase>(context, listen: false);
    final user = auth.currentUser;

    return StreamBuilder<List<Meal>>(
      stream: database.mealsStream(),
      builder: (context, snapshot) {
        return ListItemsBuilder<Meal>(
          snapshot: snapshot,
          itemBuilder: (context, meal) => MealsListTile(
            meal: meal,
            onTap: meal.vendorId == user?.uid
                ? () => EditMealPage.show(context, meal: meal)
                : null,
          ),
        );
      },
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
      key: _scaffoldKey,
    );
  }
}
