import 'package:f03_lugares/data/my_data.dart';
import 'package:flutter/material.dart';

class Country extends ChangeNotifier {
  late String id;
  late String title;
  late Color color;

  Country({
    this.id = '0',
    this.title = '',
    this.color = Colors.blue,
  });

  List<Country> getList() {
    return DUMMY_COUNTRIES;
  }

  void removeCountry(String id) {
    DUMMY_COUNTRIES.removeWhere((place) => place.id == id);
    notifyListeners();
  }

  void addCountry(Country country) {
    DUMMY_COUNTRIES.add(country);
    notifyListeners();
  }

  // void updateCountry(String id, Country country) {
  //   final countryIndex = DUMMY_COUNTRIES.contains(id);
  //   if (countryIndex) {
  //     DUMMY_COUNTRIES[int.parse(id)] = country;
  //     notifyListeners();
  //   }
  // }
}
