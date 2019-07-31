import 'package:moceansdk/moceansdk.dart';
import 'package:moceansdk/src/modules/voice/mccc/collect.dart';
import 'package:test/test.dart';

main() {
  group('Test Collect', () {
    test('params', () {
      var params = {
        'event-url': 'testing event url',
        'min': 1,
        'max': 10,
        'terminators': '#',
        'timeout': 10000,
        'action': 'collect',
      };
      expect(Collect(params).requestData, equals(params));

      var collect = Collect();
      collect.eventUrl = 'testing event url';
      collect.min = 1;
      collect.max = 10;
      collect.terminators = '#';
      collect.timeout = 10000;

      expect(collect.requestData, equals(params));
    });

    test('if action auto defined', () {
      var params = {
        'event-url': 'testing event url',
        'min': 1,
        'max': 10,
        'terminators': '#',
        'timeout': 10000,
      };

      expect(Collect(params).requestData['action'], equals('collect'));
    });

    test('if required field not set', () {
      try {
        Collect().requestData;
        fail('passed when required field not set');
      } on RequiredFieldException {}
    });
  });
}
