import 'package:moceansdk/src/modules/command/mc/abstract_mc.dart';

class TgSendText extends AbstractMc {
  TgSendText from(String id, [String type = 'bot_username']) {
    this.params['from'] = {'type': type, 'id': id};
    return this;
  }

  TgSendText to(String id, [String type = 'chat_id']) {
    this.params['to'] = {
      'type': type,
      'id': id,
    };
    return this;
  }

  TgSendText content(String text) {
    this.params["content"] = {'type': 'text', 'text': text};
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
