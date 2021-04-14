import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../services/auth.dart';
import 'home_page.dart';
import 'sign_in/sign_in_page.dart';

class LandingPage extends StatelessWidget {
  final AuthBase auth;

  const LandingPage({required this.auth});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: auth.authStateChanges(),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final user = snapshot.data;
          if (user == null) {
            return SignInPage(
              auth: auth,
            );
          }
          return HomePage(
            auth: auth,
          );
        }
        return Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
