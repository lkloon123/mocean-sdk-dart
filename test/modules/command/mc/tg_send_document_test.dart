import 'package:moceansdk/moceansdk.dart';
import 'package:moceansdk/src/modules/command/mc/tg_send_document.dart';
import 'package:test/test.dart';

main() {
  group('Test Telegram send document', () {
    test('params', () {
      var params = {
        'from': {'type': 'bot_username', 'id': 'testing id'},
        'to': {'type': 'chat_id', 'id': 'testing id'},
        'content': {
          'type': 'document',
          'rich_media_url': 'testing url',
          'text': 'testing text'
        },
        'action': 'send-telegram',
      };

      var req = TgSendDocument();
      req.from('testing id');
      req.to('testing id');
      req.content('testing url', 'testing text');

      expect(req.requestData, equals(params));
    });

    test('if required field not set', () {
      try {
        TgSendDocument().requestData;
        fail('passed when required field not set');
      } on RequiredFieldException {}
    });
  });
}
