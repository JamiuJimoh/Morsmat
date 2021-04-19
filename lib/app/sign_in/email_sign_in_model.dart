import 'validators.dart';

enum EmailSignInFormType { signIn, register }

class EmailSignInModel with EmailAndPasswordValidators {
  final String email;
  final String password;
  final String confirmPassword;
  final EmailSignInFormType formType;
  final bool isLoading;
  final bool submitted;

  EmailSignInModel({
    this.email: '',
    this.password: '',
    this.confirmPassword: '',
    this.formType: EmailSignInFormType.signIn,
    this.isLoading: false,
    this.submitted: false,
  });

  String get authButtonText {
    return formType == EmailSignInFormType.signIn
        ? 'Sign In'
        : 'Create an account';
  }

  bool get canSubmit {
    return emailValidator.isValid(email) &&
        passwordValidator.isValid(password) &&
        !isLoading;
  }

  String? get emailErrorText {
    var showErrorText = submitted && !emailValidator.isValid(email);
    return showErrorText ? invalidEmailErrorText : null;
  }

  String? get passwordErrorText {
    var showErrorText = submitted && !passwordValidator.isValid(password);
    return showErrorText ? invalidPasswordErrorText : null;
  }

  String? get confirmPasswordErrorText {
    var showErrorText = submitted &&
        !confirmPasswordValidator.confirmPasswordMatch(
          password,
          confirmPassword,
        );
    return showErrorText ? invalidConfirmPasswordErrorText : null;
  }

  EmailSignInModel copyWith({
    String? email,
    String? password,
    String? confirmPassword,
    EmailSignInFormType? formType,
    bool? isLoading,
    bool? submitted,
  }) {
    return EmailSignInModel(
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      formType: formType ?? this.formType,
      isLoading: isLoading ?? this.isLoading,
      submitted: submitted ?? this.submitted,
    );
  }
}
