import 'package:moceansdk/src/modules/command/mc/abstract_mc.dart';

class TgSendDocument extends AbstractMc {
  TgSendDocument from(String id, [String type = 'bot_username']) {
    this.params['from'] = {'type': type, 'id': id};
    return this;
  }

  TgSendDocument to(String id, [String type = 'chat_id']) {
    this.params['to'] = {
      'type': type,
      'id': id,
    };
    return this;
  }

  TgSendDocument content(String url, [String text = '']) {
    this.params["content"] = {
      'type': 'document',
      'rich_media_url': url,
      'text': text,
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
