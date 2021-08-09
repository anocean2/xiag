import 'package:flutter/material.dart';
import 'package:flutter_xiag_test/models/place.dart';
import 'package:flutter_xiag_test/ui/place/place_screen.dart';

// Не стал заносить декларативный подход навигиции, т.к. всего один переход
// и экран

Future<void> openPlaceScreen(BuildContext context, Place place) async {
  await Navigator.push(context,
      MaterialPageRoute<PlaceScreen>(builder: (context) => PlaceScreen(place)));
}
