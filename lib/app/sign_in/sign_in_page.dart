import 'package:flutter/material.dart';

import '../../services/auth.dart';
import 'email_sign_in_form.dart';
import 'social_sign_in_button.dart';

class SignInPage extends StatelessWidget {
  final AuthBase auth;

  const SignInPage({required this.auth});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildContent(),
    );
  }

  Future<void> _signInAnonymously() async {
    try {
      await auth.signInAnonymously();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _signInWithGoogle() async {
    try {
      await auth.signInWithGoogle();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _signInWithFacebook() async {
    try {
      await auth.signInWithFacebook();
    } catch (e) {
      print(e.toString());
    }
  }

  Widget _buildContent() {
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
                  _buildHeader(),
                  const SizedBox(height: 15.0),
                  EmailSignInForm(auth: auth),
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
                        onPressed: _signInWithGoogle,
                      ),
                      // const SizedBox(width: 45.0),
                      SocialSignInButton(
                        assetName: 'assets/images/facebook-logo.png',
                        onPressed: _signInAnonymously,
                      ),
                      SocialSignInButton(
                        assetName: 'assets/images/facebook-logo-blue.png',
                        onPressed: _signInWithFacebook,
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

  Widget _buildHeader() {
    return SizedBox(
      height: 90.0,
      child: Text(
        'Sign In',
        style: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
