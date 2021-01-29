import 'package:moceansdk/moceansdk.dart';
import 'package:moceansdk/src/modules/command/mc/tg_send_video.dart';
import 'package:test/test.dart';

main() {
  group('Test Telegram send video', () {
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

      var req = TgSendVideo();
      req.from('testing id');
      req.to('testing id');
      req.content('testing url', 'testing text');

      expect(req.requestData, equals(params));
    });

    test('if required field not set', () {
      try {
        TgSendVideo().requestData;
        fail('passed when required field not set');
      } on RequiredFieldException {}
    });
  });
}
