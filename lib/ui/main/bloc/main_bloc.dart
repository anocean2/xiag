import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_xiag_test/models/place.dart';
import 'package:flutter_xiag_test/repository/repository.dart';
import 'package:flutter_xiag_test/ui/main/bloc/main_bloc_events.dart';
import 'package:flutter_xiag_test/ui/main/bloc/main_screen_states.dart';
import 'package:rxdart/rxdart.dart';

class MainBloc extends Bloc<MainBlocEvent, MainScreenState> {
  final Repository _repository;
  List<Place> places = [];

  MainBloc(MainScreenState initialState, this._repository)
      : super(initialState);

  @override
  Stream<Transition<MainBlocEvent, MainScreenState>> transformEvents(
    Stream<MainBlocEvent> events,
    TransitionFunction<MainBlocEvent, MainScreenState> transitionFn,
  ) {
    return events
        .debounceTime(const Duration(milliseconds: 300))
        .switchMap(transitionFn);
  }

  @override
  Stream<MainScreenState> mapEventToState(MainBlocEvent event) async* {
    if (event is LoadDataEvent) {
      yield LoadingState();
      try {
        final places = await _repository.getPlaces();
        if (places != null && places.isNotEmpty) {
          this.places = places;
          yield PlacesSuccessState(places);
        } else {
          yield EmptyState();
        }
      } on Exception catch (error) {
        yield ErrorState(error);
      }
    }

    if (event is ChangeSearchTextEvent) {
      yield* searchPlaces(event.text);
    }
  }

  Stream<MainScreenState> searchPlaces(String text) async* {
    if (text.isEmpty) {
      yield PlacesSuccessState(places);
    } else {
      final result =
          places.where((place) => place.name?.contains(text) ?? false).toList();
      yield SearchResultState(result);
    }
  }
}
