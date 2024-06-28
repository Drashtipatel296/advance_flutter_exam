import 'package:flutter/material.dart';

import '../model/data_model.dart';

class Data {
  final String value;

  Data({required this.value});
}

class LikedProvider with ChangeNotifier {
  bool isLike = false;
  List<DataModel> likedJokes = [];

  void toggleLike(DataModel joke) {
    if (isLiked(joke)) {
      likedJokes.remove(joke);
    } else {
      likedJokes.add(joke);
    }
    isLike = !isLike;
    notifyListeners();
  }

  bool isLiked(DataModel joke) {
    return likedJokes.contains(joke);
  }
}
