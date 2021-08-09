import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_xiag_test/res/custom_colors.dart';
import 'package:flutter_xiag_test/res/dimens.dart';
import 'package:flutter_xiag_test/res/strings.dart';
import 'package:flutter_xiag_test/ui/main/bloc/main_bloc.dart';
import 'package:flutter_xiag_test/ui/main/bloc/main_bloc_events.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({Key? key})
      : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<SearchWidget> {
  final searchTextController = TextEditingController();
  late MainBloc _mainBloc;

  @override
  void initState() {
    super.initState();
    _mainBloc = context.read<MainBloc>();
  }

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Dimens.paddingSearch,
      child: TextField(
        controller: searchTextController,
        onChanged: onChangedText,
        decoration: InputDecoration(
          fillColor: CustomColors.searchBackgroundColor,
          filled: true,
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: Dimens.searchRadius,
          ),
          hintText: Strings.searchHintText,
          contentPadding: Dimens.textFieldContentPadding,
        ),
      ),
    );
  }

  void onChangedText(String text) {
    _mainBloc.add(ChangeSearchTextEvent(text));
  }
}
