import 'package:http/http.dart';
import 'package:moceansdk/moceansdk.dart';
import 'package:test/test.dart';
import '../../testing_utils.dart';

main() {
  Mocean mocean;

  objectTest(res) {
    expect(res, isA<Map>());
    expect(res['status'], equals(0));
    expect(res['msgid'], equals('CPASS_restapi_C00000000000000.0002'));
    expect(res['to'], equals('60123456789'));
    expect(res['current_carrier']['country'], equals('MY'));
    expect(res['current_carrier']['name'], equals('U Mobile'));
    expect(res['current_carrier']['network_code'], equals(50218));
    expect(res['current_carrier']['mcc'], equals('502'));
    expect(res['current_carrier']['mnc'], equals('18'));
    expect(res['original_carrier']['country'], equals('MY'));
    expect(res['original_carrier']['name'], equals('Maxis Mobile'));
    expect(res['original_carrier']['network_code'], equals(50212));
    expect(res['original_carrier']['mcc'], equals('502'));
    expect(res['original_carrier']['mnc'], equals('12'));
    expect(res['ported'], equals('ported'));
    expect(res['reachable'], equals('reachable'));
  }

  setUp(() {
    mocean = TestingUtils.getMoceanObject();
  });

  group('Test Number Lookup', () {
    test('setter method', () {
      var numberLookup = mocean.numberLookup;

      numberLookup.to = 'test to';
      expect(numberLookup.params['mocean-to'], isNotNull);
      expect(numberLookup.params['mocean-to'], equals('test to'));

      numberLookup.nlUrl = 'test nlUrl';
      expect(numberLookup.params['mocean-nl-url'], isNotNull);
      expect(numberLookup.params['mocean-nl-url'], equals('test nlUrl'));
    });

    test('inquiry', () async {
      var transmitterMock = Transmitter(
        httpClient: TestingUtils.getMockHttpClient(
          'number_lookup.json',
          (Request request) {
            expect(request.method, equalsIgnoringCase('post'));
            expect(request.url.path, equals(TestingUtils.getTestUri('/nl')));
          },
        ),
      );

      mocean = TestingUtils.getMoceanObject(transmitterMock);
      var res = await mocean.numberLookup.inquiry({'mocean-to': 'test to'});

      objectTest(res);
    });

    test('required field not set', () async {
      var transmitterMock = Transmitter(
        httpClient: TestingUtils.getMockHttpClient('number_lookup.json'),
      );

      mocean = TestingUtils.getMoceanObject(transmitterMock);

      try {
        await mocean.numberLookup.inquiry();
        fail('passed when required field not set');
      } on RequiredFieldException {}
    });
  });
}
