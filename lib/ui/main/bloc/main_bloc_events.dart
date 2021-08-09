import 'package:flutter_xiag_test/models/place.dart';

abstract class MainBlocEvent {}

class LoadDataEvent extends MainBlocEvent {}

class ClickPlaceEvent extends MainBlocEvent {
  Place place;

  ClickPlaceEvent(this.place);
}

class ChangeSearchTextEvent extends MainBlocEvent {
  String text;

  ChangeSearchTextEvent(this.text);
}
