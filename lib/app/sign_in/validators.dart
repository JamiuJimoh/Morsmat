abstract class StringValidator {
  bool isValid(String value);
  bool confirmPasswordMatch(String password, String confirmPassword);
}

class NonEmptyStringValidator implements StringValidator {
  @override
  bool isValid(String value) {
    return value.isNotEmpty;
  }

  @override
  bool confirmPasswordMatch(String password, String confirmPassword) {
    return password == confirmPassword;
  }
}

mixin EmailAndPasswordValidators {
  final StringValidator emailValidator = NonEmptyStringValidator();
  final StringValidator passwordValidator = NonEmptyStringValidator();
  final StringValidator confirmPasswordValidator = NonEmptyStringValidator();

  final String invalidEmailErrorText = 'Email can\'t be empty';
  final String invalidPasswordErrorText = 'Password can\'t be empty';
  final String invalidConfirmPasswordErrorText = 'Password must match ';
}
