import 'dart:io';

class TestHttpHelper {
  TestHttpHelper._();

  static HttpClient? _client;

  static Future<void> startHttpRequest(String url) async {
    if (_client == null) {
      _client = HttpClient();
      print('httpClient init success');
    }

    final client = _client;
    if (client == null) {
      return;
    }

    final request = await client.getUrl(Uri.parse(url));
    final response = await request.close();
    await response.drain();
    print('httpClient httpRequestSuccess $url');

  }

  static void close() {
    _client?.close();
    _client = null;
    print('httpClient close');
  }
}