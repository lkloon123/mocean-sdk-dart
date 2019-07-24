import 'package:moceansdk/moceansdk.dart';
import 'package:moceansdk/src/modules/voice/mccc/bridge.dart';
import 'package:test/test.dart';

main() {
  group('Test Bridge', () {
    test('params', () {
      var params = {'to': 'testing to', 'action': 'dial'};
      expect(Bridge(params).requestData, equals(params));

      var bridge = Bridge();
      bridge.to = 'testing to';

      expect(bridge.requestData, equals(params));
    });

    test('if action auto defined', () {
      var params = {'to': 'testing to'};

      expect(Bridge(params).requestData['action'], equals('dial'));
    });

    test('if required field not set', () {
      try {
        Bridge().requestData;
        fail('passed when required field not set');
      } on RequiredFieldException {}
    });
  });
}
