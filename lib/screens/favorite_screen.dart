import 'package:f03_lugares/components/place_item.dart';
import 'package:f03_lugares/models/favorite.dart';
import 'package:f03_lugares/models/place.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (Provider.of<favoriteModel>(context).favoritePlaces.isEmpty) {
      return const Center(
        child: Text(
          'Nenhum Lugar Marcado como Favorito!',
          style: TextStyle(fontSize: 20),
        ),
      );
    } else {
      return ListView.builder(
          itemCount: Provider.of<favoriteModel>(context).favoritePlaces.length,
          itemBuilder: (ctx, index) {
            return PlaceItem(
                Provider.of<favoriteModel>(ctx).favoritePlaces[index]);
          });
    }
  }
}
