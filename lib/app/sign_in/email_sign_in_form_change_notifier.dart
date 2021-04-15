import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/auth.dart';
import '../../common_widgets/show_exception_alert_dialog.dart';
import '../landing_page.dart';
import 'email_sign_change_model.dart';
import 'email_sign_in_model.dart';
import 'form_submit_button.dart';
import 'toggle_sign_in_form_button.dart';

class EmailSignInFormChangeNotifier extends StatefulWidget {
  final EmailSignInChangeModel model;
  EmailSignInFormChangeNotifier({required this.model});

  static Widget create(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    return ChangeNotifierProvider<EmailSignInChangeModel>(
      create: (_) => EmailSignInChangeModel(auth: auth),
      child: Consumer<EmailSignInChangeModel>(
        builder: (_, model, __) => EmailSignInFormChangeNotifier(model: model),
      ),
    );
  }

  @override
  _EmailSignInFormChangeNotifierState createState() =>
      _EmailSignInFormChangeNotifierState();
}

class _EmailSignInFormChangeNotifierState
    extends State<EmailSignInFormChangeNotifier> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  EmailSignInChangeModel get model => widget.model;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  //////// SERVICES METHODS ///////////
  Future<void> _submit() async {
    try {
      await model.submit();
      Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => LandingPage()),
      );
    } on FirebaseAuthException catch (e) {
      // TODO: test ios widget

      showExceptionAlertDialog(
        context,
        title: 'Sign in failed',
        exception: e,
      );
    }
  }

  ///////// HELPER METHODS /////////

  void _toggleAuthButton(EmailSignInFormType formType) {
    model.toggleAuthButton(formType);

    _emailController.clear();
    _passwordController.clear();
  }

  //////// WIDGETS METHODS ///////////

  TextFormField _buildEmailTextFormField() {
    return TextFormField(
      autocorrect: false,
      controller: _emailController,
      decoration: InputDecoration(
        hintText: 'john@doe.com',
        labelText: 'Email',
        errorText: model.emailErrorText,
        enabled: model.isLoading == false,
      ),
      onChanged: model.updateEmail,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
    );
  }

  TextFormField _buildPasswordTextFormField() {
    return TextFormField(
      controller: _passwordController,
      decoration: InputDecoration(
        labelText: 'Password',
        errorText: model.passwordErrorText,
        enabled: model.isLoading == false,
      ),
      keyboardType: TextInputType.visiblePassword,
      onChanged: model.updatePassword,
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
          buttonColor: model.formType == EmailSignInFormType.signIn
              ? null
              : Colors.grey[400],
          onPressed: !model.isLoading
              ? () => _toggleAuthButton(EmailSignInFormType.signIn)
              : null,
        ),
        const SizedBox(width: 15.0),
        ToggleSignInFormButton(
          text: 'Sign Up',
          buttonColor: model.formType == EmailSignInFormType.register
              ? null
              : Colors.grey[400],
          onPressed: !model.isLoading
              ? () => _toggleAuthButton(EmailSignInFormType.register)
              : null,
        ),
      ],
    );
  }

  List<Widget> _buildChildren() {
    return [
      _buildToggleButtons(),
      const SizedBox(height: 35.0),
      _buildEmailTextFormField(),
      const SizedBox(height: 10.0),
      _buildPasswordTextFormField(),
      const SizedBox(height: 25.0),
      FormSubmitButton(
        text: model.authButtonText,
        onPressed: model.canSubmit ? _submit : null,
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
