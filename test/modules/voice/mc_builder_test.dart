import 'package:moceansdk/moceansdk.dart';
import 'package:test/test.dart';

main() {
  group('Test McBuilder', () {
    test('add', () {
      var play = Mc.play('testing file');

      var builder = McBuilder();
      builder.add(play);
      expect(builder.build(), hasLength(1));
      expect(builder.build()[0], equals(play.requestData));

      play.files = 'testing file2';
      builder.add(play);
      expect(builder.build(), hasLength(2));
      expect(builder.build()[1], equals(play.requestData));
    });
  });
}
