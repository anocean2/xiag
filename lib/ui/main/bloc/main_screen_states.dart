import 'package:flutter_xiag_test/models/place.dart';

abstract class MainScreenState {
  @override
  List<Object> get props => [];
}

class ErrorState extends MainScreenState {
  final Object error;

  ErrorState(this.error);
}

class PlacesSuccessState extends MainScreenState {
  final List<Place> places;

  PlacesSuccessState(this.places);
}

class EmptyState extends MainScreenState {}

class LoadingState extends MainScreenState {}

class SearchResultState extends MainScreenState{
  final List<Place> places;

  SearchResultState(this.places);
}
