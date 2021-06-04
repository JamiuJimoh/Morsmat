import 'package:flutter/cupertino.dart';

class CategoryModel with ChangeNotifier {
  final String id;
  final String categName;
  bool? categValue;

  CategoryModel({
    required this.id,
    required this.categName,
    this.categValue: false,
  });

  void toggleCategValue(bool value) {
    categValue = value;
    notifyListeners();
  }

  @override
  String toString() {
    return '$categName, $categValue';
  }
}
