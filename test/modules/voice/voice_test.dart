import 'dart:convert';

import 'package:http/http.dart';
import 'package:moceansdk/moceansdk.dart';
import 'package:test/test.dart';
import '../../testing_utils.dart';

main() {
  Mocean mocean;

  objectTest(res) {
    expect(res, isA<Map>());
    expect(res['calls'][0]['status'], equals(0));
    expect(res['calls'][0]['receiver'], equals(60123456789));
    expect(res['calls'][0]['session-uuid'], equals('xxx-xxx-xxx-xxx'));
    expect(res['calls'][0]['call-uuid'], equals('xxx-xxx-xxx-xxx'));
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

      voice.moceanCommand = 'test moceanCommand';
      expect(voice.params['mocean-command'], isNotNull);
      expect(
        voice.params['mocean-command'],
        equals('test moceanCommand'),
      );

      voice.eventUrl = 'test eventUrl';
      expect(voice.params['mocean-event-url'], isNotNull);
      expect(
        voice.params['mocean-event-url'],
        equals('test eventUrl'),
      );

      // test multiple mocean command
      voice = mocean.voice;
      voice.moceanCommand = [
        {'action': 'say'},
      ];
      expect(voice.params['mocean-command'], isNotNull);
      expect(
        voice.params['mocean-command'],
        equals(json.encode([
          {'action': 'say'},
        ])),
      );

      voice = mocean.voice;
      var builderParams = McBuilder().add(Mc.say('hello world'));
      voice.moceanCommand = builderParams;
      expect(voice.params['mocean-command'], isNotNull);
      expect(
        voice.params['mocean-command'],
        equals(json.encode(builderParams.build())),
      );

      voice = mocean.voice;
      var mcParams = Mc.say('hello world');
      voice.moceanCommand = mcParams;
      expect(voice.params['mocean-command'], isNotNull);
      expect(
        voice.params['mocean-command'],
        equals(json.encode(McBuilder().add(mcParams).build())),
      );
    });

    test('call', () async {
      var transmitterMock = Transmitter(
        httpClient: TestingUtils.getMockHttpClient(
          'voice.json',
          (Request request) {
            expect(request.method, equalsIgnoringCase('post'));
            expect(
              request.url.path,
              equals(TestingUtils.getTestUri('/voice/dial')),
            );
          },
        ),
      );

      mocean = TestingUtils.getMoceanObject(transmitterMock);
      var res = await mocean.voice.call({
        'mocean-to': 'test to',
        'mocean-command': 'test mocean command',
      });

      objectTest(res);
    });

    test('required field not set', () async {
      var transmitterMock = Transmitter(
        httpClient: TestingUtils.getMockHttpClient('voice.json'),
      );

      mocean = TestingUtils.getMoceanObject(transmitterMock);

      try {
        await mocean.voice.call();
        fail('passed when required field not set');
      } on RequiredFieldException {}
    });

    test('hangup', () async {
      var transmitterMock = Transmitter(
        httpClient: TestingUtils.getMockHttpClient(
          'hangup.json',
          (Request request) {
            expect(request.bodyFields['mocean-call-uuid'], equals('xxx-xxx-xxx-xxx'));
            expect(request.method, equalsIgnoringCase('post'));
            expect(
              request.url.path,
              equals(TestingUtils.getTestUri('/voice/hangup')),
            );
          },
        ),
      );

      mocean = TestingUtils.getMoceanObject(transmitterMock);
      var res = await mocean.voice.hangup('xxx-xxx-xxx-xxx');

      expect(res['status'], equals(0));
    });
  });
}
