import 'package:moceansdk/moceansdk.dart';
import 'package:test/test.dart';

main() {
  group('Test Transmitter Config', () {
    test('make method should return instance', () {
      expect(TransmitterConfig.make(), isA<TransmitterConfig>());
    });

    test('should have default value', () {
      var transmitterConfig = TransmitterConfig();

      expect(transmitterConfig.baseUrl, isNotNull);
      expect(transmitterConfig.version, isNotNull);
    });

    test('setter method', () {
      var transmitterConfig = TransmitterConfig();

      transmitterConfig.baseUrl = 'test base url';
      expect(transmitterConfig.baseUrl, isNotNull);
      expect(transmitterConfig.baseUrl, equals('test base url'));

      transmitterConfig.version = '1';
      expect(transmitterConfig.version, isNotNull);
      expect(transmitterConfig.version, equals('1'));
    });

    test('set config through constructor', () {
      var transmitterConfig = TransmitterConfig('test base url', '1');

      expect(transmitterConfig.baseUrl, equals('test base url'));
      expect(transmitterConfig.version, equals('1'));
    });
  });
}
