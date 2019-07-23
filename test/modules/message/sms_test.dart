import 'package:http/http.dart';
import 'package:moceansdk/moceansdk.dart';
import 'package:test/test.dart';
import '../../testing_utils.dart';

main() {
  Mocean mocean;

  objectTest(res) {
    expect(res, isA<Map>());
    expect(res['messages'], hasLength(1));
    expect(res['messages'][0]['status'], equals(0));
    expect(res['messages'][0]['receiver'], equals('60123456789'));
    expect(res['messages'][0]['msgid'],
        equals('CPASS_restapi_C0000002737000000.0001'));
  }

  setUp(() {
    mocean = TestingUtils.getMoceanObject();
  });

  group('Test SMS', () {
    test('setter method', () {
      var sms = mocean.sms;

      sms.from = 'test from';
      expect(sms.params['mocean-from'], isNotNull);
      expect(sms.params['mocean-from'], equals('test from'));

      sms.to = 'test to';
      expect(sms.params['mocean-to'], isNotNull);
      expect(sms.params['mocean-to'], equals('test to'));

      sms.text = 'test text';
      expect(sms.params['mocean-text'], isNotNull);
      expect(sms.params['mocean-text'], equals('test text'));

      sms.udh = 'test udh';
      expect(sms.params['mocean-udh'], isNotNull);
      expect(sms.params['mocean-udh'], equals('test udh'));

      sms.coding = 'test coding';
      expect(sms.params['mocean-coding'], isNotNull);
      expect(sms.params['mocean-coding'], equals('test coding'));

      sms.dlrMask = 'test dlrMask';
      expect(sms.params['mocean-dlr-mask'], isNotNull);
      expect(sms.params['mocean-dlr-mask'], equals('test dlrMask'));

      sms.dlrUrl = 'test dlrUrl';
      expect(sms.params['mocean-dlr-url'], isNotNull);
      expect(sms.params['mocean-dlr-url'], equals('test dlrUrl'));

      sms.schedule = 'test schedule';
      expect(sms.params['mocean-schedule'], isNotNull);
      expect(sms.params['mocean-schedule'], equals('test schedule'));

      sms.mClass = 'test mClass';
      expect(sms.params['mocean-mclass'], isNotNull);
      expect(sms.params['mocean-mclass'], equals('test mClass'));

      sms.altDcs = 'test altDcs';
      expect(sms.params['mocean-alt-dcs'], isNotNull);
      expect(sms.params['mocean-alt-dcs'], equals('test altDcs'));

      sms.charSet = 'test charSet';
      expect(sms.params['mocean-charset'], isNotNull);
      expect(sms.params['mocean-charset'], equals('test charSet'));

      sms.validity = 'test validity';
      expect(sms.params['mocean-validity'], isNotNull);
      expect(sms.params['mocean-validity'], equals('test validity'));
    });

    test('send', () async {
      var transmitterMock = Transmitter(
          null,
          TestingUtils.getMockHttpClient('message.json', (Request request) {
            expect(request.method, equalsIgnoringCase('post'));
            expect(request.url.path, equals(TestingUtils.getTestUri('/sms')));
          }));

      mocean = TestingUtils.getMoceanObject(transmitterMock);
      var res = await mocean.sms.send({
        'mocean-from': 'test from',
        'mocean-to': 'test to',
        'mocean-text': 'test text'
      });

      objectTest(res);
    });

    test('required field not set', () async {
      var transmitterMock =
          Transmitter(null, TestingUtils.getMockHttpClient('message.json'));

      mocean = TestingUtils.getMoceanObject(transmitterMock);

      try {
        await mocean.sms.send();
        fail('passed when required field not set');
      } on RequiredFieldException {}
    });
  });
}
