import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:morsmat/app/sign_in/sign_in_text_field.dart';
import 'package:morsmat/constants.dart';
import 'package:provider/provider.dart';

import '../../services/auth.dart';
import '../../common_widgets/show_exception_alert_dialog.dart';
import '../landing_page.dart';
import 'email_sign_change_model.dart';
import 'email_sign_in_model.dart';
import 'form_submit_button.dart';

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
  final _confirmPasswordController = TextEditingController();

  var _obscureText = true;
  var _isLoading = false;

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
      setState(() {
        _isLoading = true;
      });
      await model.submit();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => LandingPage()),
      );
      setState(() {
        _isLoading = false;
      });
    } on FirebaseAuthException catch (e) {
      // TODO: test ios widget

      showExceptionAlertDialog(
        context,
        title: 'Sign in failed',
        exception: e,
      );
      setState(() {
        _isLoading = false;
      });
    }
  }

  ///////// HELPER METHODS /////////

  void _toggleFormType() {
    model.toggleFormType();

    _emailController.clear();
    _passwordController.clear();
    _confirmPasswordController.clear();
  }

  //////// WIDGETS METHODS ///////////

  CustomTextField _buildEmailTextField() {
    return CustomTextField(
      controller: _emailController,
      hintText: 'Email',
      // labelText: 'Email',
      icon: Icons.email_outlined,
      onChanged: model.updateEmail,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      errorText: model.emailErrorText,
      enabled: model.isLoading == false,
    );
  }

  Widget _buildPasswordFieldSuffixIcon() {
    final icon = Icon(
      _obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
    );
    return GestureDetector(
      child: icon,
      onTap: () {
        setState(() {
          _obscureText = !_obscureText;
        });
      },
    );
  }

  CustomTextField _buildPasswordTextField() {
    return CustomTextField(
      controller: _passwordController,
      hintText: 'Password',
      icon: Icons.lock_outline,
      suffixIcon: _buildPasswordFieldSuffixIcon(),
      errorText: model.passwordErrorText,
      enabled: model.isLoading == false,
      keyboardType: TextInputType.visiblePassword,
      onChanged: model.updatePassword,
      obscureText: _obscureText,
      textInputAction: model.formType == EmailSignInFormType.signIn
          ? TextInputAction.done
          : TextInputAction.next,
      onEditingComplete:
          model.formType == EmailSignInFormType.signIn ? _submit : null,
    );
  }

  CustomTextField _buildConfirmPasswordTextField() {
    return CustomTextField(
      controller: _confirmPasswordController,
      hintText: 'Confirm Password',
      icon: Icons.lock_outline,
      errorText: model.confirmPasswordErrorText,
      enabled: model.isLoading == false,
      keyboardType: TextInputType.visiblePassword,
      onChanged: model.updateConfirmPassword,
      obscureText: _obscureText,
      textInputAction: TextInputAction.done,
      onEditingComplete: _submit,
    );
  }

  Widget _buildHeader() {
    final text = model.formType == EmailSignInFormType.signIn
        ? 'Welcome back'
        : 'Create an account';

    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline2!.copyWith(
              fontWeight: FontWeight.w500,
            ),
      ),
    );
  }

  List<Widget> _buildChildren() {
    return [
      _buildHeader(),
      const SizedBox(height: 15.0),
      _buildEmailTextField(),
      const SizedBox(height: 10.0),
      _buildPasswordTextField(),
      const SizedBox(height: 10.0),
      if (model.formType == EmailSignInFormType.register)
        _buildConfirmPasswordTextField(),
      const SizedBox(height: 25.0),
      FormSubmitButton(
        context: context,
        child: _isLoading
            ? Center(
                child: CircularProgressIndicator(
                backgroundColor: kWhiteColor,
              ))
            : Text(
                model.primaryButtonText,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: Theme.of(context).colorScheme.primary),
              ),
        onPressed: model.canSubmit ? _submit : () {},
      ),
      const SizedBox(height: 25.0),
      GestureDetector(
        child: RichText(
          text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: [
              TextSpan(text: model.secondaryButtonText[0]),
              TextSpan(
                text: model.secondaryButtonText[1],
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ],
          ),
        ),
        onTap: !model.isLoading ? _toggleFormType : null,
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
