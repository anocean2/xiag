import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_xiag_test/res/strings.dart';
import 'package:flutter_xiag_test/ui/main/bloc/main_bloc.dart';
import 'package:flutter_xiag_test/ui/main/bloc/main_bloc_events.dart';
import 'package:flutter_xiag_test/ui/main/bloc/main_screen_states.dart';
import 'package:flutter_xiag_test/ui/main/widgets/empty_widget.dart';
import 'package:flutter_xiag_test/ui/main/widgets/place_widget.dart';

class PlacesWidget extends StatefulWidget {
  const PlacesWidget({Key? key}) : super(key: key);

  @override
  _PlacesWidgetState createState() => _PlacesWidgetState();
}

class _PlacesWidgetState extends State<PlacesWidget> {
  late MainBloc _mainBloc;

  @override
  void initState() {
    super.initState();
    _mainBloc = context.read<MainBloc>();
    _mainBloc.add(LoadDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainScreenState>(
      builder: (builderContext, state) {
        if (state is LoadingState) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is ErrorState) {
          return ErrorWidget(Strings.sorryWeHaveError);
        }

        if (state is PlacesSuccessState) {
          return Expanded(
            child: ListView(
              children: state.places.map((item) => PlaceWidget(item)).toList(),
            ),
          );
        }

        if (state is SearchResultState) {
          return Expanded(
            child: ListView(
              children: state.places.map((item) => PlaceWidget(item)).toList(),
            ),
          );
        }

        return const EmptyWidget();
      },
    );
  }
}
