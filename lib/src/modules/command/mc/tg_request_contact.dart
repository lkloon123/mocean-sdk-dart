import 'package:moceansdk/src/modules/command/mc/abstract_mc.dart';

class TgRequestContact extends AbstractMc {
  TgRequestContact([params]) : super(params) {
    this.buttonText("Share contact");
  }

  TgRequestContact from(String id, [String type = 'bot_username']) {
    this.params['from'] = {'type': type, 'id': id};
    return this;
  }

  TgRequestContact to(String id, [String type = 'chat_id']) {
    this.params['to'] = {
      'type': type,
      'id': id,
    };
    return this;
  }

  TgRequestContact content(String text) {
    this.params["content"] = {'type': 'text', 'text': text};
    return this;
  }

  TgRequestContact buttonText(String text) {
    this.params['tg_keyboard'] = {
      'button_text': text,
      'button_request': 'contact'
    };
    return this;
  }

  @override
  String action() {
    return "send-telegram";
  }

  @override
  List<String> requiredKey() {
    return ["from", "to", "content"];
  }
}
