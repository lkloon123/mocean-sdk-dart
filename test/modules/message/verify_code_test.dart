import 'package:http/http.dart';
import 'package:moceansdk/moceansdk.dart';
import 'package:test/test.dart';
import '../../testing_utils.dart';

main() {
  Mocean mocean;

  objectTest(res) {
    expect(res, isA<Map>());
    expect(int.parse(res['status']), equals(0));
    expect(res['reqid'], equals('CPASS_restapi_C0000002737000000.0002'));
  }

  setUp(() {
    mocean = TestingUtils.getMoceanObject();
  });

  group('Test VerifyCode', () {
    test('setter method', () {
      var verifyCode = mocean.verifyCode;

      verifyCode.reqId = 'test reqId';
      expect(verifyCode.params['mocean-reqid'], isNotNull);
      expect(verifyCode.params['mocean-reqid'], equals('test reqId'));

      verifyCode.code = 'test code';
      expect(verifyCode.params['mocean-code'], isNotNull);
      expect(verifyCode.params['mocean-code'], equals('test code'));
    });

    test('send', () async {
      var transmitterMock = Transmitter(
        httpClient: TestingUtils.getMockHttpClient(
          'verify_code.json',
          (Request request) {
            expect(request.method, equalsIgnoringCase('post'));
            expect(
              request.url.path,
              equals(TestingUtils.getTestUri('/verify/check')),
            );
          },
        ),
      );

      mocean = TestingUtils.getMoceanObject(transmitterMock);
      var res = await mocean.verifyCode.send({
        'mocean-reqid': 'test reqid',
        'mocean-code': 'test code',
      });

      objectTest(res);
    });

    test('required field not set', () async {
      var transmitterMock = Transmitter(
        httpClient: TestingUtils.getMockHttpClient('verify_code.json'),
      );

      mocean = TestingUtils.getMoceanObject(transmitterMock);

      try {
        await mocean.verifyCode.send();
        fail('passed when required field not set');
      } on RequiredFieldException {}
    });
  });
}
