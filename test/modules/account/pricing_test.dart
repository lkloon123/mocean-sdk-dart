import 'package:http/http.dart';
import 'package:moceansdk/moceansdk.dart';
import 'package:test/test.dart';
import '../../testing_utils.dart';

main() {
  Mocean mocean;

  objectTest(res) {
    expect(res, isA<Map>());
    expect(res['status'], equals(0));
    expect(res['destinations'], hasLength(25));
    expect(res['destinations'][0]['country'], equals('Default'));
    expect(res['destinations'][0]['operator'], equals('Default'));
    expect(res['destinations'][0]['mcc'], equals('Default'));
    expect(res['destinations'][0]['mnc'], equals('Default'));
    expect(res['destinations'][0]['price'], equals(2.0));
    expect(res['destinations'][0]['currency'], equals('MYR'));
  }

  setUp(() {
    mocean = TestingUtils.getMoceanObject();
  });

  group('Test Pricing', () {
    test('setter method', () {
      var pricing = mocean.pricing;

      pricing.mcc = 'test mcc';
      expect(pricing.params['mocean-mcc'], isNotNull);
      expect(pricing.params['mocean-mcc'], equals('test mcc'));

      pricing.mnc = 'test mnc';
      expect(pricing.params['mocean-mnc'], isNotNull);
      expect(pricing.params['mocean-mnc'], equals('test mnc'));

      pricing.delimiter = 'test delimiter';
      expect(pricing.params['mocean-delimiter'], isNotNull);
      expect(pricing.params['mocean-delimiter'], equals('test delimiter'));
    });

    test('inquiry', () async {
      var transmitterMock = Transmitter(
          null,
          TestingUtils.getMockHttpClient('price.json', (Request request) {
            expect(request.method, equalsIgnoringCase('get'));
            expect(request.url.path,
                equals(TestingUtils.getTestUri('/account/pricing')));
          }));

      mocean = TestingUtils.getMoceanObject(transmitterMock);
      var res = await mocean.pricing.inquiry({'mocean-resp-format': 'json'});

      objectTest(res);
    });
  });
}
