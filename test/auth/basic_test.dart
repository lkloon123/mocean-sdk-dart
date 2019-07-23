import 'package:moceansdk/moceansdk.dart';
import 'package:test/test.dart';

void main() {
  Basic basic;

  setUp(() {
    basic = Basic();
  });

  group("Test Basic Auth", () {
    test("set api key", () {
      basic.apiKey = 'test api key';
      expect(basic.getParams()['mocean-api-key'], equals('test api key'));
    });

    test('set api secret', () {
      basic.apiSecret = 'test api secret';
      expect(basic.getParams()['mocean-api-secret'], equals('test api secret'));
    });

    test('get params', () {
      basic.apiKey = 'test api key';
      basic.apiSecret = 'test api secret';

      expect(basic.getParams(), isA<Map>());
      expect(basic.getParams()['mocean-api-key'], equals('test api key'));
      expect(basic.getParams()['mocean-api-secret'], equals('test api secret'));
    });
  });
}
