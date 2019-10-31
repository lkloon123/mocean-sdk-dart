import 'package:moceansdk/moceansdk.dart';
import 'package:moceansdk/src/modules/voice/mccc/sleep.dart';
import 'package:test/test.dart';

main() {
  group('Test Sleep', () {
    test('params', () {
      var params = {
        'duration': 10000,
        'action': 'sleep',
      };
      expect(Sleep(params).requestData, equals(params));

      var sleep = Sleep();
      sleep.duration = 10000;

      expect(sleep.requestData, equals(params));
    });

    test('if action auto defined', () {
      var params = {
        'duration': 10000,
        'barge-in': true,
      };

      expect(Sleep(params).requestData['action'], equals('sleep'));
    });

    test('if required field not set', () {
      try {
        Sleep().requestData;
        fail('passed when required field not set');
      } on RequiredFieldException {}
    });
  });
}
