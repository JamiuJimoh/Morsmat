import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:morsmat/services/auth.dart';

class SignInBloc {
  final AuthBase auth;
  SignInBloc({required this.auth});

  final StreamController<bool> _isLoadingController = StreamController<bool>();
  Stream<bool> get isLoadingStream => _isLoadingController.stream;

  void dispose() {
    _isLoadingController.close();
  }

  void _setIsLoading(bool isLoading) => _isLoadingController.add(isLoading);

  Future<User?> _signIn(Future<User?> Function() signInMethod) async {
    try {
      _setIsLoading(true);
      return await signInMethod();
    } catch (e) {
      _setIsLoading(false);
      rethrow;
    }
  }

  Future<User?> signInAnonymously() async => _signIn(auth.signInAnonymously);

  Future<User?> signInWithGoogle() async => _signIn(auth.signInWithGoogle);

  Future<User?> signInWithFacebook() async => _signIn(auth.signInWithFacebook);
}
