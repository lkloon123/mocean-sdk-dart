import 'package:moceansdk/moceansdk.dart';
import 'package:moceansdk/src/modules/command/mc/tg_send_animation.dart';
import 'package:test/test.dart';

main() {
  group('Test Telegram send animation', () {
    test('params', () {
      var params = {
        'from': {'type': 'bot_username', 'id': 'testing id'},
        'to': {'type': 'chat_id', 'id': 'testing id'},
        'content': {
          'type': 'animation',
          'rich_media_url': 'testing url',
          'text': 'testing text'
        },
        'action': 'send-telegram',
      };

      var req = TgSendAnimation();
      req.from('testing id');
      req.to('testing id');
      req.content('testing url', 'testing text');

      expect(req.requestData, equals(params));
    });

    test('if required field not set', () {
      try {
        TgSendAnimation().requestData;
        fail('passed when required field not set');
      } on RequiredFieldException {}
    });
  });
}
