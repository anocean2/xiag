import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_xiag_test/models/place.dart';
import 'package:flutter_xiag_test/res/dimens.dart';
import 'package:flutter_xiag_test/ui/place/bloc/place_bloc.dart';
import 'package:flutter_xiag_test/ui/place/bloc/place_screen_state.dart';
import 'package:flutter_xiag_test/ui/place/widgets/custom_app_bar.dart';
import 'package:photo_view/photo_view.dart';
import 'package:share_plus/share_plus.dart';

class PlaceScreen extends StatefulWidget {
  final Place place;

  const PlaceScreen(this.place, {Key? key}) : super(key: key);

  @override
  _PlaceScreenState createState() => _PlaceScreenState();
}

class _PlaceScreenState extends State<PlaceScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PlaceBloc(EmptyState()),
      child: Scaffold(
        appBar: CustomAppBar(widget.place),
        body: BlocListener<PlaceBloc, PlaceScreenState>(
          listener: (blocContext, state) {
            if (state is ShareImageState) {
              shareImage(state.urlImage);
            }
          },
          child: Center(
            child: PhotoView(
              loadingBuilder: (context, event) => Center(
                child: SizedBox(
                  width: Dimens.circularProgressBarSize,
                  height: Dimens.circularProgressBarSize,
                  child: CircularProgressIndicator(
                    value: event == null
                        ? 0
                        : event.cumulativeBytesLoaded /
                            (event.expectedTotalBytes ?? 1),
                  ),
                ),
              ),
              imageProvider: NetworkImage(widget.place.url ?? ''),
            ),
          ),
        ),
      ),
    );
  }

  void shareImage(String urlImage) {
    Share.share(urlImage);
  }
}
