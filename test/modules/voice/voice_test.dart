import 'dart:convert';

import 'package:http/http.dart';
import 'package:moceansdk/moceansdk.dart';
import 'package:test/test.dart';
import '../../testing_utils.dart';

main() {
  Mocean mocean;

  objectTest(res) {
    expect(res, isA<Map>());
    expect(res['status'], equals(0));
    expect(res['session-uuid'], equals('xxx-xxx-xxx-xxx'));
    expect(res['call-uuid'], equals('xxx-xxx-xxx-xxx'));
  }

  setUp(() {
    mocean = TestingUtils.getMoceanObject();
  });

  group('Test Voice', () {
    test('setter method', () {
      var voice = mocean.voice;

      voice.to = 'test to';
      expect(voice.params['mocean-to'], isNotNull);
      expect(voice.params['mocean-to'], equals('test to'));

      voice.callControlCommands = 'test callControlCommands';
      expect(voice.params['mocean-call-control-commands'], isNotNull);
      expect(voice.params['mocean-call-control-commands'],
          equals('test callControlCommands'));

      voice.callEventUrl = 'test callEventUrl';
      expect(voice.params['mocean-call-event-url'], isNotNull);
      expect(
          voice.params['mocean-call-event-url'], equals('test callEventUrl'));

      // test multiple call control commands
      voice = mocean.voice;
      voice.callControlCommands = [
        {'action': 'say'}
      ];
      expect(voice.params['mocean-call-control-commands'], isNotNull);
      expect(
          voice.params['mocean-call-control-commands'],
          equals(json.encode([
            {'action': 'say'}
          ])));

      voice = mocean.voice;
      var builderParams = McccBuilder().add(Mccc.say('hello world'));
      voice.callControlCommands = builderParams;
      expect(voice.params['mocean-call-control-commands'], isNotNull);
      expect(voice.params['mocean-call-control-commands'],
          equals(json.encode(builderParams.build())));

      voice = mocean.voice;
      var mcccParams = Mccc.say('hello world');
      voice.callControlCommands = mcccParams;
      expect(voice.params['mocean-call-control-commands'], isNotNull);
      expect(voice.params['mocean-call-control-commands'],
          equals(json.encode(McccBuilder().add(mcccParams).build())));
    });

    test('call', () async {
      var transmitterMock = Transmitter(
          null,
          TestingUtils.getMockHttpClient('voice.json', (Request request) {
            expect(request.method, equalsIgnoringCase('get'));
            expect(request.url.path,
                equals(TestingUtils.getTestUri('/voice/dial')));
          }));

      mocean = TestingUtils.getMoceanObject(transmitterMock);
      var res = await mocean.voice.call({
        'mocean-to': 'test to',
        'mocean-call-control-commands': 'test call control commands'
      });

      objectTest(res);
    });

    test('required field not set', () async {
      var transmitterMock =
          Transmitter(null, TestingUtils.getMockHttpClient('voice.json'));

      mocean = TestingUtils.getMoceanObject(transmitterMock);

      try {
        await mocean.voice.call();
        fail('passed when required field not set');
      } on RequiredFieldException {}
    });
  });
}
