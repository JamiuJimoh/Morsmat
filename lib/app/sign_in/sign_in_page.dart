import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common_widgets/show_exception_alert_dialog.dart';
import '../../services/auth.dart';
import 'sign_in_bloc.dart';
import 'email_sign_in_form_bloc_based.dart';
import 'social_sign_in_button.dart';

class SignInPage extends StatelessWidget {
  final SignInBloc bloc;
  const SignInPage({required this.bloc});

  static Widget create(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    return Provider<SignInBloc>(
      create: (_) => SignInBloc(auth: auth),
      dispose: (_, bloc) => bloc.dispose(),
      child: Consumer<SignInBloc>(
        builder: (_, bloc, __) => SignInPage(bloc: bloc),
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
      body: StreamBuilder<bool>(
          initialData: false,
          stream: bloc.isLoadingStream,
          builder: (context, snapshot) {
            return _buildContent(context, snapshot.data!);
          }),
    );
  }

  //////////// SERVICES METHODS //////////

  Future<void> _signInAnonymously(BuildContext context) async {
    try {
      await bloc.signInAnonymously();
    } on Exception catch (e) {
      _showSignInError(context, e);
    }
  }

  Future<void> _signInWithGoogle(BuildContext context) async {
    try {
      await bloc.signInWithGoogle();
    } on Exception catch (e) {
      _showSignInError(context, e);
    }
  }

  Future<void> _signInWithFacebook(BuildContext context) async {
    try {
      await bloc.signInWithFacebook();
    } on Exception catch (e) {
      _showSignInError(context, e);
    }
  }

  ///////// WIDGETS METHODS ////////

  Widget _buildContent(BuildContext context, bool isLoading) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 25.0, horizontal: 20.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 90.0, child: _buildHeader(isLoading)),
                  const SizedBox(height: 15.0),
                  EmailSignInFormBlocBased.create(context),
                  const SizedBox(height: 35.0),
                  Text(
                    'OR',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 25.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SocialSignInButton(
                        assetName: 'assets/images/google-logo.png',
                        onPressed: () => _signInWithGoogle(context),
                      ),
                      // const SizedBox(width: 45.0),
                      SocialSignInButton(
                        assetName: 'assets/images/facebook-logo.png',
                        onPressed: () => _signInAnonymously(context),
                      ),
                      SocialSignInButton(
                        assetName: 'assets/images/facebook-logo-blue.png',
                        onPressed: () => _signInWithFacebook(context),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(bool isLoading) {
    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return Text(
      'Sign In',
      style: TextStyle(
        fontSize: 25.0,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
