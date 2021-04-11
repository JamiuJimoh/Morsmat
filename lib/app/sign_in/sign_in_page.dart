import 'package:flutter/material.dart';

import '../../common_widgets/custom_elevated_button.dart';

class SignInPage extends StatelessWidget {
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
      padding: const EdgeInsets.all(30.0),
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildEmailTextFormField(),
          _buildPasswordTextFormField(),
          CustomElevatedButton(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Morsmat'),
        elevation: 2.0,
      ),
      body: _buildContent(),
    );
  }
}
