import 'package:moceansdk/moceansdk.dart';
import 'package:moceansdk/src/modules/command/mc/tg_request_contact.dart';
import 'package:test/test.dart';

main() {
  group('Test Telegram send animation', () {
    test('params', () {
      var params = {
        'tg_keyboard': {
          'button_text': 'Share contact',
          'button_request': 'contact'
        },
        'from': {'type': 'bot_username', 'id': 'testing id'},
        'to': {'type': 'chat_id', 'id': 'testing id'},
        'content': {'type': 'text', 'text': 'testing text'},
        'action': 'send-telegram',
      };

      var req = TgRequestContact();
      req.buttonText('Share contact');
      req.from('testing id');
      req.to('testing id');
      req.content('testing text');

      expect(req.requestData, equals(params));
    });

    test('if required field not set', () {
      try {
        TgRequestContact().requestData;
        fail('passed when required field not set');
      } on RequiredFieldException {}
    });
  });
}
