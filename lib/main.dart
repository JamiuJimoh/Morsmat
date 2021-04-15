import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'services/auth.dart';
import 'app/landing_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<AuthBase>(
      create: (context)=>Auth(),
      child: MaterialApp(
        title: 'Morsmat',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: LandingPage(),
      ),
    );
  }
}
