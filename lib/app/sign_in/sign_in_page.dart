import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:morsmat/app/sign_in/social_sign_in_button.dart';

import 'sign_in_button.dart';

class SignInPage extends StatelessWidget {
  final void Function(User?) onSignIn;

  const SignInPage({required this.onSignIn});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildContent(),
    );
  }

  Future<void> _signInAnonymously() async {
    try {
      final userCredential = await FirebaseAuth.instance.signInAnonymously();
      onSignIn(userCredential.user);
      print(userCredential.user);
    } catch (e) {
      print(e.toString());
    }
  }

  TextFormField _buildEmailTextFormField() {
    return TextFormField(
      decoration: const InputDecoration(
        hintText: 'john@doe.com',
        labelText: 'Email',
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }

  TextFormField _buildPasswordTextFormField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Password',
      ),
      obscureText: true,
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
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
                  _buildEmailTextFormField(),
                  _buildPasswordTextFormField(),
                  const SizedBox(height: 35.0),
                  SignInButton(
                    text: 'Sign In',
                    onPressed: () {},
                  ),
                  const SizedBox(height: 35.0),
                  Text(
                    'OR',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 35.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialSignInButton(
                        assetName: 'assets/images/google-logo.png',
                        onPressed: _signInAnonymously,
                      ),
                      const SizedBox(width: 45.0),
                      SocialSignInButton(
                        assetName: 'assets/images/facebook-logo-blue.png',
                        onPressed: () {},
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
