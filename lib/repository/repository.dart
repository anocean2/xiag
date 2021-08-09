import 'package:flutter_xiag_test/api/http_api.dart';
import 'package:flutter_xiag_test/models/place.dart';
import 'package:kiwi/kiwi.dart';

class Repository {
  final kiwiContainer = KiwiContainer();
  late final HttpApi _httpApi;

  Repository() {
    _httpApi = kiwiContainer.resolve<HttpApi>();
  }

  Future<List<Place>?> getPlaces() async => _httpApi.getPlaces();
}
