import 'package:moceansdk/moceansdk.dart';
import 'package:moceansdk/src/modules/command/command_mc_builder.dart';
import 'package:moceansdk/src/modules/command/command_mc.dart';
import 'package:test/test.dart';

main() {
  group('Test McBuilder', () {
    test('add', () {
      var mc1 = CommandMc.tgSendText
          .from("test from")
          .to("test to")
          .content("test content");

      var builder = CommandMcBuilder();
      builder.add(mc1);
      expect(builder.build(), hasLength(1));
      expect(builder.build()[0], equals(mc1.requestData));
    });
  });
}
