class APIPath {
  static String meal({required String mealId}) => 'meals/$mealId';

  static String meals() => 'meals';

  static String favoriteMeal({required String uid, required mealId}) =>
      'users/$uid/favoriteMeals/$mealId';

  static String favoriteMeals({required String uid}) =>
      'users/$uid/favoriteMeals';
}
