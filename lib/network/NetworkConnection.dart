import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:task_one/models/HttpRequest.dart';

class NetworkConnection {

  static Future<String> sendRequest(NetworkRequest request) async {
    var response = await _handleRequest(request) ;
    if(response.statusCode == 200) {
      return response.body;
    } else{
      throw Exception('server error code: ${response.statusCode}');
    }
  }

  static Future<Response> _handleRequest(NetworkRequest request) {
    var uri = Uri.http(request.absoluteUrl, request.path, request.queryParameters);

    switch (request.requestType) {
      case HttpRequestType.GET:
        return get(uri,headers: {"Accept":"*/*"});

      case HttpRequestType.POST:
        return get(uri);
    }
  }
}
