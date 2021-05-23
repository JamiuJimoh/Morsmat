import 'package:flutter/cupertino.dart';

class CategoryModel with ChangeNotifier {
  final String id;
   String categName;
  bool categValue;

  CategoryModel({
    required this.id,
    required this.categName,
    required this.categValue,
  });

  void toggleCategValue(bool value) {
    categValue = value;
    notifyListeners();
  }
}
