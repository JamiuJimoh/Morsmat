import 'package:flutter/material.dart';
import 'package:morsmat/app/landing_page.dart';

import '../../services/auth.dart';
import 'form_submit_button.dart';
import 'toggle_sign_in_form_button.dart';
import 'validators.dart';

enum EmailSignInFormType { signIn, register }

class EmailSignInForm extends StatefulWidget with EmailAndPasswordValidators {
  final AuthBase auth;
  EmailSignInForm({required this.auth});

  @override
  _EmailSignInFormState createState() => _EmailSignInFormState();
}

class _EmailSignInFormState extends State<EmailSignInForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String get _email => _emailController.text;
  String get _password => _passwordController.text;

  EmailSignInFormType _formType = EmailSignInFormType.signIn;
  bool _submitted = false;
  bool _isLoading = false;

  //////// SERVICES METHODS ///////////
  Future<void> _submit() async {
    setState(() {
      _submitted = true;
      _isLoading = true;
    });
    try {
      if (_formType == EmailSignInFormType.signIn) {
        await widget.auth.signInWithEmailAndPassword(_email, _password);
      } else {
        await widget.auth.createUserWithEmailAndPassword(_email, _password);
      }
      Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => LandingPage(auth: widget.auth)));
    } catch (e) {
      print(e.toString());
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  ///////// HELPER METHODS /////////

  void _loginButtonClicked() {
    setState(() {
      _submitted = false;
      _formType = EmailSignInFormType.signIn;
    });
    _emailController.clear();
    _passwordController.clear();
  }

  void _signUpButtonClicked() {
    setState(() {
      _submitted = false;
      _formType = EmailSignInFormType.register;
    });
    _emailController.clear();
    _passwordController.clear();
  }

  void _updateState() {
    setState(() {});
  }

  //////// WIDGETS METHODS ///////////

  TextFormField _buildEmailTextFormField() {
    var showErrorText = _submitted && !widget.emailValidator.isValid(_email);
    return TextFormField(
      autocorrect: false,
      controller: _emailController,
      decoration: InputDecoration(
        hintText: 'john@doe.com',
        labelText: 'Email',
        errorText: showErrorText ? widget.invalidEmailErrorText : null,
        enabled: _isLoading == false,
      ),
      onChanged: (email) => _updateState(),
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
    );
  }

  TextFormField _buildPasswordTextFormField() {
    var showErrorText =
        _submitted && !widget.passwordValidator.isValid(_password);

    return TextFormField(
      controller: _passwordController,
      decoration: InputDecoration(
        labelText: 'Password',
        errorText: showErrorText ? widget.invalidPasswordErrorText : null,
        enabled: _isLoading == false,
      ),
      keyboardType: TextInputType.visiblePassword,
      onChanged: (password) => _updateState(),
      obscureText: true,
      textInputAction: TextInputAction.done,
      onEditingComplete: _submit,
    );
  }

  Widget _buildToggleButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ToggleSignInFormButton(
          text: 'Log In',
          buttonColor:
              _formType == EmailSignInFormType.signIn ? null : Colors.grey[400],
          onPressed: !_isLoading ? _loginButtonClicked : null,
        ),
        const SizedBox(width: 15.0),
        ToggleSignInFormButton(
          text: 'Sign Up',
          buttonColor: _formType == EmailSignInFormType.register
              ? null
              : Colors.grey[400],
          onPressed: !_isLoading ? _signUpButtonClicked : null,
        ),
      ],
    );
  }

  List<Widget> _buildChildren() {
    final primaryText = _formType == EmailSignInFormType.signIn
        ? 'Sign In'
        : 'Create an account';

    bool submitEnabled = widget.emailValidator.isValid(_email) &&
        widget.passwordValidator.isValid(_password) &&
        !_isLoading;

    return [
      _buildToggleButtons(),
      const SizedBox(height: 35.0),
      _buildEmailTextFormField(),
      const SizedBox(height: 10.0),
      _buildPasswordTextFormField(),
      const SizedBox(height: 25.0),
      FormSubmitButton(
        text: primaryText,
        onPressed: submitEnabled ? _submit : null,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _buildChildren(),
    );
  }
}
