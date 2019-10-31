import 'package:moceansdk/moceansdk.dart';
import 'package:moceansdk/src/modules/voice/mccc/dial.dart';
import 'package:test/test.dart';

main() {
  group('Test Dial', () {
    test('params', () {
      var params = {
        'to': 'testing to',
        'from': 'callerid',
        'dial-sequentially': true,
        'action': 'dial',
      };
      expect(Dial(params).requestData, equals(params));

      var dial = Dial();
      dial.to = 'testing to';
      dial.from = 'callerid';
      dial.dialSequentially = true;

      expect(dial.requestData, equals(params));
    });

    test('if action auto defined', () {
      var params = {
        'to': 'testing to',
      };

      expect(Dial(params).requestData['action'], equals('dial'));
    });

    test('if required field not set', () {
      try {
        Dial().requestData;
        fail('passed when required field not set');
      } on RequiredFieldException {}
    });
  });
}
