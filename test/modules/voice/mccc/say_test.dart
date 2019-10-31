import 'package:moceansdk/moceansdk.dart';
import 'package:moceansdk/src/modules/voice/mccc/say.dart';
import 'package:test/test.dart';

main() {
  group('Test Say', () {
    test('params', () {
      var params = {
        'language': 'testing language',
        'text': 'testing text',
        'barge-in': true,
        'clear-digit-cache': true,
        'action': 'say',
      };
      expect(Say(params).requestData, equals(params));

      var say = Say();
      say.language = 'testing language';
      say.text = 'testing text';
      say.bargeIn = true;
      say.clearDigitCache = true;

      expect(say.requestData, equals(params));
    });

    test('if action auto defined', () {
      var params = {
        'language': 'testing language',
        'text': 'testing text',
        'barge-in': true,
      };

      expect(Say(params).requestData['action'], equals('say'));
    });

    test('if required field not set', () {
      try {
        Say().requestData;
        fail('passed when required field not set');
      } on RequiredFieldException {}
    });
  });
}
