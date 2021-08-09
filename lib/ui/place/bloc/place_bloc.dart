import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_xiag_test/ui/place/bloc/place_bloc_events.dart';
import 'package:flutter_xiag_test/ui/place/bloc/place_screen_state.dart';

class PlaceBloc extends Bloc<PlaceBlocEvent, PlaceScreenState> {
  PlaceBloc(PlaceScreenState initialState) : super(initialState);

  @override
  Stream<PlaceScreenState> mapEventToState(PlaceBlocEvent event) async* {
    if (event is ClickShareImageEvent) {
      yield ShareImageState(event.urlImage);
    }
  }
}
