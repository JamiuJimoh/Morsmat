import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import 'email_sign_in_form_change_notifier.dart';
import '../../common_widgets/show_exception_alert_dialog.dart';
import '../../services/auth.dart';
import 'sign_in_manager.dart';
import 'social_sign_in_button.dart';

class SignInPage extends StatelessWidget {
  final SignInManager manager;
  final bool isLoading;
  const SignInPage({required this.manager, required this.isLoading});

  static Widget create(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    return ChangeNotifierProvider<ValueNotifier<bool>>(
      create: (_) => ValueNotifier<bool>(false),
      child: Consumer<ValueNotifier<bool>>(
        builder: (_, isLoading, __) => Provider<SignInManager>(
          create: (_) => SignInManager(auth: auth, isLoading: isLoading),
          child: Consumer<SignInManager>(
            builder: (_, manager, __) => SignInPage(
              manager: manager,
              isLoading: isLoading.value,
            ),
          ),
        ),
      ),
    );
  }

  ///////// HELPER METHODS ///////////

  void _showSignInError(BuildContext context, Exception exception) {
    if (exception is FirebaseException &&
        exception.code == 'ERROR_ABORTED_BY_USER') {
      return;
    }
    showExceptionAlertDialog(
      context,
      title: 'Sign in failed',
      exception: exception,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAccentColor,
      body: _buildContent(context),
    );
  }

  //////////// SERVICES METHODS //////////

  // Future<void> _signInAnonymously(BuildContext context) async {
  //   try {
  //     await manager.signInAnonymously();
  //   } on Exception catch (e) {
  //     _showSignInError(context, e);
  //   }
  // }

  Future<void> _signInWithGoogle(BuildContext context) async {
    try {
      await manager.signInWithGoogle();
    } on Exception catch (e) {
      _showSignInError(context, e);
    }
  }

  Future<void> _signInWithFacebook(BuildContext context) async {
    try {
      await manager.signInWithFacebook();
    } on Exception catch (e) {
      _showSignInError(context, e);
    }
  }

  ///////// WIDGETS METHODS ////////

  Widget _buildContent(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraint) => SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraint.maxHeight),
          child: IntrinsicHeight(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildHeader(),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: kScaffoldColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50.0),
                      topRight: Radius.circular(50.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        bottom: 50.0, top: 30.0, left: 25.0, right: 25.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // SizedBox(height: 90.0, child: _buildHeader()),
                        const SizedBox(height: 15.0),
                        EmailSignInFormChangeNotifier.create(context),

                        const SizedBox(height: 35.0),
                        Text(
                          'OR',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 25.0),
                        SocialSignInButton(
                          assetName: 'assets/images/google-logo.png',
                          text: 'Sign in with Google',
                          textColor: kPrimaryColor,
                          buttonColor: kWhiteColor,
                          onPressed: () => _signInWithGoogle(context),
                        ),
                        const SizedBox(height: 25.0),
                        // SocialSignInButton(
                        //   assetName: 'assets/images/facebook-logo.png',
                        //   onPressed: () => _signInAnonymously(context),
                        // ),
                        // const SizedBox(height: 25.0),
                        SocialSignInButton(
                          assetName: 'assets/images/facebook-logo.png',
                          text: 'Sign in with Facebook',
                          textColor: kScaffoldColor,
                          buttonColor: kFacebookColor,
                          onPressed: () => _signInWithFacebook(context),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    // EmailSignInFormType.re
    if (isLoading) {
      return Center(
        child: CircularProgressIndicator(
          backgroundColor: kScaffoldColor,
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: Text(
        'Welcome back',
        style: TextStyle(
          fontSize: 27.0,
          color: kScaffoldColor,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
