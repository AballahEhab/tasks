import 'dart:convert';

import 'package:task_one/models/City.dart';
import 'package:task_one/network/NetworkConnection.dart';

import '../models/HttpRequest.dart';

class CitiesService {

  Future<List<City>> getCities() async{
    var request = NetworkRequest(
      absoluteUrl: "apistaging.thehalalapp.com",
      path: "/users/api/v1/cities",
      requestType: HttpRequestType.GET,
      queryParameters: {"country_id": "1", "all": "true", "lang": "ar"},
    );

    var responceBodyString;
    try {
      responceBodyString = await NetworkConnection.sendRequest(request);
    } on Exception catch (e) {
      rethrow;
    }
    var responseMap = jsonDecode(responceBodyString);
    var citiesItems = responseMap['data']['items'] as List;

    return citiesItems.map((e) => City.fromJson(e)).toList();

  }
}
