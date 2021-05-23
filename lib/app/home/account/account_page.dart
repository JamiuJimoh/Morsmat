import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../meals/edit_meal/edit_meal_page.dart';
import '../../../common_widgets/show_alert_dialog.dart';
import '../../../services/auth.dart';

class AccountPage extends StatelessWidget {
  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
              style: Theme.of(context).textTheme.bodyText1,
            ),
            onPressed: () => _confirmSignOut(context),
          ),
        ],
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => EditMealPage.show(context),
        child: Icon(Icons.add),
        elevation: 1.0,
      ),
      // key: _scaffoldKey,
    );
  }
}
