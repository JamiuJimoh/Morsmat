import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './app/landing_page.dart';
import './app/onboarding/onboarding_page.dart';
import 'app_theme_data.dart';
import 'services/auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<AuthBase>(
      create: (context) => Auth(),
      child: Consumer<AuthBase>(
        builder: (_, auth, __) => MaterialApp(
          title: 'Morsmat',
          theme: AppTheme.primaryAppTheme,
          initialRoute:
              auth.currentUser != null ? LandingPage.id : OnboardingPage.id,
          routes: {
            OnboardingPage.id: (context) => OnboardingPage(),
            LandingPage.id: (context) => LandingPage(),
          },
        ),
      ),
    );
  }
}
