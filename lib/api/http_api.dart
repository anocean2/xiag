import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_xiag_test/models/place.dart';
import 'package:flutter_xiag_test/res/constants.dart';

class HttpApi {
  final _dio = Dio()..options.baseUrl = baseUrl;

  /// Запрос на получение списка мест с фотографиями
  Future<List<Place>?> getPlaces() async {
    final response = await _dio.get<String>('share/testtask/list.json');

    if (response.statusCode == 200) {
      return (json.decode(response.data ?? '') as List)
          .map((dynamic i) => Place.fromJson(i as Map<String, dynamic>))
          .toList();
    } else {
      log('Http error ${response.statusCode}');
      throw Exception('Http error ${response.statusCode}');
    }
  }
}
