import 'package:moceansdk/moceansdk.dart';
import 'package:moceansdk/src/modules/voice/mccc/play.dart';
import 'package:test/test.dart';

main() {
  group('Test Play', () {
    test('params', () {
      var params = {'file': 'testing file', 'barge-in': true, 'action': 'play'};
      expect(Play(params).requestData, equals(params));

      var play = Play();
      play.files = 'testing file';
      play.bargeIn = true;

      expect(play.requestData, equals(params));
    });

    test('if action auto defined', () {
      var params = {'file': 'testing file', 'barge-in': true};

      expect(Play(params).requestData['action'], equals('play'));
    });

    test('if required field not set', () {
      try {
        Play().requestData;
        fail('passed when required field not set');
      } on RequiredFieldException {}
    });
  });
}
