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
    expect(res['session-uuid'], equals('xxxxxx'));

    expect(
        res['mocean-command'][0],
        equals({
          'action': 'xxxx-xxxx',
          'message-id': 'xxxxxx',
          'mc-position': 0,
          'total-segments': 1
        }));
  }

  setUp(() {
    mocean = TestingUtils.getMoceanObject();
  });

  group('Test command', () {
    test('setter method', () {
      var command = mocean.command;

      command.eventUrl = 'test url';
      expect(command.params['mocean-event-url'], isNotNull);
      expect(command.params['mocean-event-url'], equals('test url'));

      command.moceanCommand = 'test moceanCommand';
      expect(command.params['mocean-command'], isNotNull);
      expect(
        command.params['mocean-command'],
        equals('test moceanCommand'),
      );

      // test multiple mocean command
      command = mocean.command;
      command.moceanCommand = [
        CommandMc.tgSendText
            .from('test from')
            .to('test to')
            .content('test content')
            .requestData,
            
        CommandMc.tgSendText
            .from('test from 2')
            .to('test to 2')
            .content('test content 2')
            .requestData,
      ];
      expect(command.params['mocean-command'], isNotNull);
      expect(
        command.params['mocean-command'],
        equals(json.encode([
          CommandMc.tgSendText
              .from('test from')
              .to('test to')
              .content('test content')
              .requestData,

          CommandMc.tgSendText
              .from('test from 2')
              .to('test to 2')
              .content('test content 2')
              .requestData,
        ])),
      );
    });

    test('execute', () async {
      var transmitterMock = Transmitter(
        httpClient: TestingUtils.getMockHttpClient(
          'command.json',
          (Request request) {
            expect(request.method, equalsIgnoringCase('post'));
            expect(
              request.url.path,
              equals(TestingUtils.getTestUri('/send-message')),
            );
          },
        ),
      );

      mocean = TestingUtils.getMoceanObject(transmitterMock);
      var res = await mocean.command.execute({
        'mocean-event-url': 'test url',
        'mocean-command': 'test mocean command',
      });

      objectTest(res);
    });

    test('required field not set', () async {
      var transmitterMock = Transmitter(
        httpClient: TestingUtils.getMockHttpClient('command.json'),
      );

      mocean = TestingUtils.getMoceanObject(transmitterMock);

      try {
        await mocean.voice.call();
        fail('passed when required field not set');
      } on RequiredFieldException {}
    });
  });
}
