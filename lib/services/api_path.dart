class APIPath {
  static String meal({required String mealId}) => 'meals/$mealId';

  static String meals() => 'meals';

  static String favoriteMeal({required String uid, required favoriteId}) =>
      'users/$uid/favoriteMeals/$favoriteId';

  static String favoriteMeals({required String uid, required favoriteId}) =>
      'users/$uid/favoriteMeals';
}
