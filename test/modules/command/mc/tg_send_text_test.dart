import 'package:moceansdk/moceansdk.dart';
import 'package:moceansdk/src/modules/command/mc/tg_send_text.dart';
import 'package:test/test.dart';

main() {
  group('Test Telegram send text', () {
    test('params', () {
      var params = {
        'from': {'type': 'bot_username', 'id': 'testing id'},
        'to': {'type': 'chat_id', 'id': 'testing id'},
        'content': {'type': 'text', 'text': 'testing text'},
        'action': 'send-telegram',
      };

      var req = TgSendText();
      req.from('testing id');
      req.to('testing id');
      req.content('testing text');

      expect(req.requestData, equals(params));
    });

    test('if required field not set', () {
      try {
        TgSendText().requestData;
        fail('passed when required field not set');
      } on RequiredFieldException {}
    });
  });
}
