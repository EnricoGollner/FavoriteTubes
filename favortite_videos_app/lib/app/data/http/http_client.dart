import 'package:http/http.dart' as http;

abstract class IHttpClient {
  Future<http.Response> get({required String url});
}

class HttpClient implements IHttpClient {
  final client = http.Client();

  @override
  Future<http.Response> get({required String url}) async {
    return await http.get(Uri.parse(url));
  }
}
