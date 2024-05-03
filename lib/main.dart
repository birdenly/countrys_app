import 'dart:ui';

import 'package:f03_lugares/models/country.dart';
import 'package:f03_lugares/models/favorite.dart';
import 'package:f03_lugares/models/place.dart';
import 'package:f03_lugares/screens/countries_places_screen.dart';
import 'package:f03_lugares/screens/country_manager.dart';
import 'package:f03_lugares/screens/place_detail_screen.dart';
import 'package:f03_lugares/screens/place_form.dart';
import 'package:f03_lugares/screens/place_manager.dart';
import 'package:f03_lugares/screens/settings_screen.dart';
import 'package:f03_lugares/screens/tabs_screen.dart';
import 'package:f03_lugares/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/countries_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => favoriteModel(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Place(
              id: '',
              paises: [],
              titulo: '',
              imagemUrl: '',
              recomendacoes: [],
              avaliacao: 0,
              custoMedio: 0),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Country(
            id: '',
            title: '',
          ),
        ),
      ],
      child: MaterialApp(
        title: 'PlacesToGo',
        theme: ThemeData(
          colorScheme: ThemeData()
              .colorScheme
              .copyWith(primary: Colors.purple, secondary: Colors.amber),
          fontFamily: 'Raleway',
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                ),
              ),
        ),
        //home: CountriesScreen(),
        initialRoute: '/',
        routes: {
          AppRoutes.HOME: (ctx) => TabsScreen(),
          AppRoutes.COUNTRY_PLACES: (ctx) => CountryPlacesScreen(),
          AppRoutes.PLACES_DETAIL: (ctx) => PlaceDetailScreen(),
          AppRoutes.SETTINGS: (ctx) => SettingsScreen(),
          AppRoutes.PLACE_FORM: (ctx) => PlaceForm(),
          AppRoutes.EDIT_PLACE: (ctx) => PlaceManager(),
          AppRoutes.EDIT_COUNTRY: (ctx) => CountryManager(),
        },
      ),
    );
  }
}
