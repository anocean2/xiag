abstract class PlaceScreenState {}

class ShareImageState extends PlaceScreenState {
  String urlImage;

  ShareImageState(this.urlImage);
}

class EmptyState extends PlaceScreenState {}
