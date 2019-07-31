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

  group('Test Send Code', () {
    test('setter method', () {
      var sendCode = mocean.sendCode;

      sendCode.to = 'test to';
      expect(sendCode.params['mocean-to'], isNotNull);
      expect(sendCode.params['mocean-to'], equals('test to'));

      sendCode.brand = 'test brand';
      expect(sendCode.params['mocean-brand'], isNotNull);
      expect(sendCode.params['mocean-brand'], equals('test brand'));

      sendCode.from = 'test from';
      expect(sendCode.params['mocean-from'], isNotNull);
      expect(sendCode.params['mocean-from'], equals('test from'));

      sendCode.codeLength = 'test codeLength';
      expect(sendCode.params['mocean-code-length'], isNotNull);
      expect(sendCode.params['mocean-code-length'], equals('test codeLength'));

      sendCode.pinValidity = 'test pinValidity';
      expect(sendCode.params['mocean-pin-validity'], isNotNull);
      expect(
        sendCode.params['mocean-pin-validity'],
        equals('test pinValidity'),
      );

      sendCode.nextEventWait = 'test nextEventWait';
      expect(sendCode.params['mocean-next-event-wait'], isNotNull);
      expect(
        sendCode.params['mocean-next-event-wait'],
        equals('test nextEventWait'),
      );

      sendCode.reqId = 'test reqId';
      expect(sendCode.params['mocean-reqid'], isNotNull);
      expect(sendCode.params['mocean-reqid'], equals('test reqId'));
    });

    test('send', () async {
      var transmitterMock = Transmitter(
        httpClient: TestingUtils.getMockHttpClient(
          'send_code.json',
          (Request request) {
            expect(request.method, equalsIgnoringCase('post'));
            expect(
              request.url.path,
              equals(TestingUtils.getTestUri('/verify/req')),
            );
          },
        ),
      );

      mocean = TestingUtils.getMoceanObject(transmitterMock);
      var res = await mocean.sendCode.send({
        'mocean-to': 'test to',
        'mocean-brand': 'test brand',
      });

      objectTest(res);
    });

    test('send as sms channel', () async {
      var transmitterMock = Transmitter(
        httpClient: TestingUtils.getMockHttpClient(
          'send_code.json',
          (Request request) {
            expect(request.method, equalsIgnoringCase('post'));
            expect(
              request.url.path,
              equals(TestingUtils.getTestUri('/verify/req/sms')),
            );
          },
        ),
      );

      mocean = TestingUtils.getMoceanObject(transmitterMock);
      var sendCode = mocean.sendCode;
      sendCode.sendAs = Channel.SMS;

      var res = await sendCode.send({
        'mocean-to': 'test to',
        'mocean-brand': 'test brand',
      });

      objectTest(res);
    });

    test('test resend', () async {
      var transmitterMock = Transmitter(
        httpClient: TestingUtils.getMockHttpClient(
          'send_code.json',
          (Request request) {
            expect(request.method, equalsIgnoringCase('post'));
            expect(
              request.url.path,
              equals(TestingUtils.getTestUri('/verify/resend/sms')),
            );
          },
        ),
      );

      mocean = TestingUtils.getMoceanObject(transmitterMock);

      var res = await mocean.sendCode.resend({'mocean-reqid': 'test req id'});

      objectTest(res);
    });

    test('required field not set', () async {
      var transmitterMock = Transmitter(
        httpClient: TestingUtils.getMockHttpClient('send_code.json'),
      );

      mocean = TestingUtils.getMoceanObject(transmitterMock);

      try {
        await mocean.sendCode.send();
        fail('passed when required field not set');
      } on RequiredFieldException {}
    });
  });
}
