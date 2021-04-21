import 'package:flutter/material.dart';
import 'package:morsmat/app/meals_overview/categories_container.dart';
import 'package:provider/provider.dart';

import '../../common_widgets/show_alert_dialog.dart';
import '../../services/auth.dart';

class MealsOverviewPage extends StatelessWidget {
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
              style: TextStyle(
                // color: Colors.white,
                fontSize: 18.0,
              ),
            ),
            onPressed: () => _confirmSignOut(context),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Text(
                      'Popular',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                  Row(
                    children: [
                      CategoriesContainer(),
                      CategoriesContainer(),
                      CategoriesContainer(),
                    ],
                  ),
                  // SliverList(
                  //   delegate: SliverChildBuilderDelegate(
                  //     (ctx, i) {
                  //       return Container(
                  //         margin: const EdgeInsets.symmetric(vertical: 10.0),
                  //         child: MealsListBuilder(index: i, isPopular: false),
                  //       );
                  //     },
                  //     childCount: mealsData.mealsListLength,
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 200.0,
                  //   child: ListView.builder(
                  //     scrollDirection: Axis.horizontal,
                  //     itemCount: mealsData.mealsListLength,
                  //     itemBuilder: (ctx, i) {
                  //       return Padding(
                  //         padding: const EdgeInsets.only(right: 15.0),
                  //         child: MealsListBuilder(index: i, isPopular: true),
                  //       );
                  //     },
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Text(
                      'Featured',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                  // SliverList(
                  //   delegate: SliverChildBuilderDelegate(
                  //     (ctx, i) {
                  //       return Container(
                  //         margin: const EdgeInsets.symmetric(vertical: 10.0),
                  //         child: MealsListBuilder(index: i, isPopular: false),
                  //       );
                  //     },
                  //     childCount: mealsData.mealsListLength,
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
