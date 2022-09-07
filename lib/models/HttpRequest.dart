class NetworkRequest {
  String absoluteUrl;
  String path;
  HttpRequestType requestType;
  Map<String, dynamic>? queryParameters;

  NetworkRequest(
      {required this.absoluteUrl,
      required this.path,
      required this.requestType,
      this.queryParameters});
}

enum HttpRequestType { GET, POST }
