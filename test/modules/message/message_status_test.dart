import 'package:http/http.dart';
import 'package:moceansdk/moceansdk.dart';
import 'package:test/test.dart';
import '../../testing_utils.dart';

main() {
  Mocean mocean;

  objectTest(res) {
    expect(res, isA<Map>());
    expect(res['status'], equals(0));
    expect(res['message_status'], equals(5));
    expect(res['msgid'], equals('CPASS_restapi_C0000002737000000.0001'));
    expect(res['credit_deducted'], equals(0.0));
  }

  setUp(() {
    mocean = TestingUtils.getMoceanObject();
  });

  group('Test Message Status', () {
    test('setter method', () {
      var messageStatus = mocean.messageStatus;

      messageStatus.msgId = 'test msgid';
      expect(messageStatus.params['mocean-msgid'], isNotNull);
      expect(messageStatus.params['mocean-msgid'], equals('test msgid'));
    });

    test('inquiry', () async {
      var transmitterMock = Transmitter(
        httpClient: TestingUtils.getMockHttpClient(
          'message_status.json',
          (Request request) {
            expect(request.method, equalsIgnoringCase('get'));
            expect(
              request.url.path,
              equals(TestingUtils.getTestUri('/report/message')),
            );
          },
        ),
      );

      mocean = TestingUtils.getMoceanObject(transmitterMock);
      var res = await mocean.messageStatus.inquiry({
        'mocean-msgid': 'test msg id',
      });

      objectTest(res);
    });

    test('required field not set', () async {
      var transmitterMock = Transmitter(
        httpClient: TestingUtils.getMockHttpClient('message_status.json'),
      );

      mocean = TestingUtils.getMoceanObject(transmitterMock);

      try {
        await mocean.messageStatus.inquiry();
        fail('passed when required field not set');
      } on RequiredFieldException {}
    });
  });
}
