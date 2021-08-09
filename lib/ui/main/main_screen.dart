import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_xiag_test/repository/repository.dart';
import 'package:flutter_xiag_test/ui/main/bloc/main_bloc.dart';
import 'package:flutter_xiag_test/ui/main/bloc/main_screen_states.dart';
import 'package:flutter_xiag_test/ui/main/widgets/places_widget.dart';
import 'package:flutter_xiag_test/ui/main/widgets/search_widget.dart';
import 'package:kiwi/kiwi.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _kiwiContainer = KiwiContainer();
  late Repository _repository;

  @override
  void initState() {
    super.initState();
    _repository = _kiwiContainer.resolve<Repository>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          lazy: false,
          create: (_) => MainBloc(EmptyState(), _repository),
          child: Column(
            children: const [
              SearchWidget(),
              PlacesWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
