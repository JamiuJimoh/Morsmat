abstract class StringValidator {
  bool isValid(String value);
  bool isValidPrice(String value);
  bool isValidTimeToPrep(String value);
}

class NonEmptyStringValidator implements StringValidator {
  @override
  bool isValid(String value) {
    return value.isNotEmpty;
  }

  @override
  bool isValidPrice(String value) {
    final price = double.tryParse(value);
    if (price == null) {
      return false;
    }
    return value.isNotEmpty && !price.isNegative;
  }

  @override
  bool isValidTimeToPrep(String value) {
    final time = int.tryParse(value);
    if (time == null) {
      return false;
    }
    return value.isNotEmpty && !time.isNegative && time >= 1;
  }
}

mixin MealValidators {
  final StringValidator mealNameValidator = NonEmptyStringValidator();
  final StringValidator mealDescriptionValidator = NonEmptyStringValidator();
  final StringValidator priceValidator = NonEmptyStringValidator();
  final StringValidator timeToPrepValidator = NonEmptyStringValidator();

  final String invalidMealNameErrorText = 'Meal name can\'t be empty';
  final String invalidMealDescriptionErrorText =
      'Meal description can\'t be empty';
  final String invalidPriceErrorText = 'Price must be valid';
  final String invalidTimeToPrepErrorText = 'Time must be valid';
}
