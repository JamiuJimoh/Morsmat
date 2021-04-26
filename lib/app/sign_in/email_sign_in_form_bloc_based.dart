import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/auth.dart';
import '../../common_widgets/show_exception_alert_dialog.dart';
import '../landing_page.dart';
import 'email_sign_in_bloc.dart';
import 'email_sign_in_model.dart';
import 'form_submit_button.dart';

class EmailSignInFormBlocBased extends StatefulWidget {
  final EmailSignInBloc bloc;
  EmailSignInFormBlocBased({required this.bloc});

  static Widget create(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    return Provider<EmailSignInBloc>(
      create: (_) => EmailSignInBloc(auth: auth),
      child: Consumer<EmailSignInBloc>(
        builder: (_, bloc, __) => EmailSignInFormBlocBased(bloc: bloc),
      ),
      dispose: (_, bloc) => bloc.dispose(),
    );
  }

  @override
  _EmailSignInFormBlocBasedState createState() =>
      _EmailSignInFormBlocBasedState();
}

class _EmailSignInFormBlocBasedState extends State<EmailSignInFormBlocBased> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  //////// SERVICES METHODS ///////////
  Future<void> _submit() async {
    try {
      await widget.bloc.submit();
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


  //////// WIDGETS METHODS ///////////

  TextFormField _buildEmailTextFormField(EmailSignInModel model) {
    return TextFormField(
      autocorrect: false,
      controller: _emailController,
      decoration: InputDecoration(
        hintText: 'john@doe.com',
        labelText: 'Email',
        errorText: model.emailErrorText,
        enabled: model.isLoading == false,
      ),
      onChanged: widget.bloc.updateEmail,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
    );
  }

  TextFormField _buildPasswordTextFormField(EmailSignInModel model) {
    return TextFormField(
      controller: _passwordController,
      decoration: InputDecoration(
        labelText: 'Password',
        errorText: model.passwordErrorText,
        enabled: model.isLoading == false,
      ),
      keyboardType: TextInputType.visiblePassword,
      onChanged: widget.bloc.updatePassword,
      obscureText: true,
      textInputAction: TextInputAction.done,
      onEditingComplete: _submit,
    );
  }

  List<Widget> _buildChildren(EmailSignInModel model) {
    return [
      const SizedBox(height: 35.0),
      _buildEmailTextFormField(model),
      const SizedBox(height: 10.0),
      _buildPasswordTextFormField(model),
      const SizedBox(height: 25.0),
      FormSubmitButton(
        context: context,
        child: Text(model.authButtonText),
        onPressed: model.canSubmit ? _submit : null,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<EmailSignInModel>(
        stream: widget.bloc.modelStream,
        initialData: EmailSignInModel(),
        builder: (context, snapshot) {
          final EmailSignInModel model = snapshot.data!;
          return Column(
            children: _buildChildren(model),
          );
        });
  }
}
