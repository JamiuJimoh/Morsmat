import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'email_sign_in_model.dart';
import '../../constants.dart';
import 'email_sign_change_model.dart';
import 'email_sign_in_form_change_notifier.dart';
import '../../common_widgets/show_exception_alert_dialog.dart';
import '../../services/auth.dart';
import 'sign_in_manager.dart';
import 'social_sign_in_button.dart';

class SignInPage extends StatelessWidget {
  final SignInManager manager;
  final bool isLoading;
  final EmailSignInFormType formType;
  const SignInPage({
    required this.manager,
    required this.isLoading,
    required this.formType,
  });

  static const String id = 'sign_in_page';

  static Widget create(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    return ChangeNotifierProvider<ValueNotifier<bool>>(
      create: (_) => ValueNotifier<bool>(false),
      child: Consumer<ValueNotifier<bool>>(
        builder: (_, isLoading, __) => Provider<SignInManager>(
          create: (_) => SignInManager(auth: auth, isLoading: isLoading),
          child: Consumer<SignInManager>(
            builder: (_, manager, __) =>
                ChangeNotifierProvider<EmailSignInChangeModel>(
              create: (_) => EmailSignInChangeModel(auth: auth),
              child: Consumer<EmailSignInChangeModel>(
                builder: (_, model, __) => SignInPage(
                  formType: model.formType,
                  manager: manager,
                  isLoading: isLoading.value,
                ),
              ),
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
    final size = MediaQuery.of(context).size;
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              _buildHeader(context),
              const SizedBox(height: 15.0),
              EmailSignInFormChangeNotifier.create(context),
              const SizedBox(height: 15.0),
              Container(
                width: size.width * 0.8,
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        height: 1.5,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'OR',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        height: 1.5,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25.0),
              SocialSignInButton(
                assetName: 'assets/images/google-logo.png',
                text: 'Sign in with Google',
                textStyle: Theme.of(context).textTheme.bodyText2,
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
                textStyle: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(color: kWhiteColor),
                buttonColor: kFacebookColor,
                onPressed: () => _signInWithFacebook(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    if (isLoading) {
      return Center(
        child: CircularProgressIndicator(
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
      );
    }

    return Text('');
  }
}
