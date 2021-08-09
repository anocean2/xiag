abstract class PlaceBlocEvent {}

class ClickShareImageEvent extends PlaceBlocEvent {
  String urlImage;

  ClickShareImageEvent(this.urlImage);
}

