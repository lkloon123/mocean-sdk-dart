import 'package:moceansdk/moceansdk.dart';
import 'package:test/test.dart';

main() {
  group('Test McccBuilder', () {
    test('add', () {
      var play = Mccc.play('testing file');

      var builder = McccBuilder();
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
