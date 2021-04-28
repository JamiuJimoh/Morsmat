class APIPath {
  static String meal({required String uid, required String mealId}) =>
      'users/$uid/meals/$mealId/';

  static String meals({required String uid}) => 'users/$uid/meals';
}
