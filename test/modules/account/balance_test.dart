import 'package:http/http.dart';
import 'package:moceansdk/moceansdk.dart';
import 'package:test/test.dart';
import '../../testing_utils.dart';

main() {
  Mocean mocean;

  objectTest(res) {
    expect(res, isA<Map>());
    expect(res['status'], equals(0));
    expect(res['value'], equals(100.0));
  }

  setUp(() {
    mocean = TestingUtils.getMoceanObject();
  });

  group('Test Balance', () {
    test('inquiry', () async {
      var transmitterMock = Transmitter(
        httpClient: TestingUtils.getMockHttpClient(
          'balance.json',
          (Request request) {
            expect(request.method, equalsIgnoringCase('get'));
            expect(
              request.url.path,
              equals(TestingUtils.getTestUri('/account/balance')),
            );
          },
        ),
      );

      mocean = TestingUtils.getMoceanObject(transmitterMock);
      var res = await mocean.balance.inquiry({'mocean-resp-format': 'json'});

      objectTest(res);
    });
  });
}
