import 'package:flutter/material.dart';

class Data {
  final String icon;
  final String value;

  Data({required this.icon, required this.value});
}

class LikedProvider with ChangeNotifier {
  bool isLike = false;

  void isLiked() {
    isLike = !isLike;
    notifyListeners();
  }
}
