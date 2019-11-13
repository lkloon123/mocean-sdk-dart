import 'package:moceansdk/src/modules/voice/mc/record.dart';
import 'package:test/test.dart';

main() {
  group('Test Record', () {
    test('if action auto defined', () {
      expect(Record().requestData['action'], equals('record'));
    });
  });
}
