import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:moceansdk/moceansdk.dart';

class TestingUtils {
  static getMoceanObject([Transmitter transmitter]) =>
      Mocean(Basic('test api key', 'test api secret'), transmitter);

  static String getResponseStr(String fileName) {
    return File('${Directory.current.absolute.path}/test/resources/${fileName}')
        .readAsStringSync();
  }

  static MockClient getMockHttpClient(String fileName, [Function testRequest]) {
    return MockClient((request) {
      if (testRequest != null) {
        testRequest(request);
      }

      return Future<http.Response>.value(
          http.Response(TestingUtils.getResponseStr(fileName), 200));
    });
  }

  static String getTestUri(String uri) {
    return '/rest/2${uri}';
  }
}
