import 'package:f03_lugares/data/my_data.dart';
import 'package:flutter/material.dart';

class Place extends ChangeNotifier {
  late String id;
  late List<String> paises;
  late String titulo;
  late String imagemUrl;
  late List<String> recomendacoes;
  late double avaliacao;
  late double custoMedio;

  Place({
    required this.id,
    required this.paises,
    required this.titulo,
    required this.imagemUrl,
    required this.recomendacoes,
    required this.avaliacao,
    required this.custoMedio,
  });

  List<Place> getList() {
    return DUMMY_PLACES;
  }

  void removePlace(String id) {
    DUMMY_PLACES.removeWhere((place) => place.id == id);
    notifyListeners();
  }

  void addPlace(Place place) {
    DUMMY_PLACES.add(place);
    notifyListeners();
  }

  // void updatePlace(String id, Place newPlace) {
  //   final index = DUMMY_PLACES.indexWhere((place) => place.id == id);
  //   if (index != -1) {
  //     DUMMY_PLACES[index] = newPlace;
  //     notifyListeners();
  //   }
  // }
}
