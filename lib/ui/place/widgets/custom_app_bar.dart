import 'package:flutter/material.dart';
import 'package:flutter_xiag_test/models/place.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_xiag_test/res/dimens.dart';
import 'package:flutter_xiag_test/ui/place/bloc/place_bloc.dart';
import 'package:flutter_xiag_test/ui/place/bloc/place_bloc_events.dart';

class CustomAppBar extends StatefulWidget with PreferredSizeWidget {
  final Place place;

  @override
  Size get preferredSize => Dimens.appBarSize;

  const CustomAppBar(this.place, {Key? key}) : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  late final PlaceBloc _placeBloc;

  @override
  void initState() {
    _placeBloc = context.read<PlaceBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        widget.place.name ?? '',
        style: Theme.of(context).textTheme.headline4,
      ),
      actions: [
        IconButton(
          onPressed: () => onClickShare(widget.place.url ?? ''),
          icon: const Icon(Icons.share),
        ),
      ],
    );
  }

  void onClickShare(String url) {
    _placeBloc.add(ClickShareImageEvent(url));
  }
}