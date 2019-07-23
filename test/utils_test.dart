import 'package:moceansdk/src/utils.dart';
import 'package:test/test.dart';

main() {
  group('Test Utils', () {
    test('is null or empty', () {
      expect(Utils.isNullOrEmpty(''), isTrue);
      expect(Utils.isNullOrEmpty(null), isTrue);
      expect(Utils.isNullOrEmpty('test'), isFalse);
    });
  });
}
