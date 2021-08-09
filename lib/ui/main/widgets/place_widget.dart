import 'package:flutter/material.dart';
import 'package:flutter_xiag_test/models/place.dart';
import 'package:flutter_xiag_test/res/dimens.dart';
import 'package:flutter_xiag_test/utils/navigation.dart';

class PlaceWidget extends StatefulWidget {
  final Place _place;

  const PlaceWidget(this._place, {Key? key}) : super(key: key);

  @override
  _PlaceWidgetState createState() => _PlaceWidgetState();
}

class _PlaceWidgetState extends State<PlaceWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onClickPlace(widget._place),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: Dimens.paddingT8,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(Dimens.imageItemRadius),
              child: Image(
                width: Dimens.imageThumbnailWidth,
                height: Dimens.imageThumbnailHeight,
                image: NetworkImage(widget._place.urlTn ?? ''),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: Dimens.paddingT8,
            child: Text(
              widget._place.name ?? '',
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
        ],
      ),
    );
  }

  void onClickPlace(Place place) {
    openPlaceScreen(context, place);
  }
}
