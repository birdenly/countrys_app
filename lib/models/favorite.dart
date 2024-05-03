import 'package:f03_lugares/models/place.dart';
import 'package:flutter/material.dart';

class favoriteModel extends ChangeNotifier {
  List<Place> favoritePlaces = [];

  void toggleFavorite(Place place) {
    if (favoritePlaces.contains(place)) {
      favoritePlaces.remove(place);
    } else {
      favoritePlaces.add(place);
    }
    notifyListeners();
  }

  bool isFavorite(Place place) {
    return favoritePlaces.contains(place);
  }
}
