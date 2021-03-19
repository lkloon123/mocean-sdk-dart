import 'package:moceansdk/src/modules/command/mc/abstract_mc.dart';

class TgSendPhoto extends AbstractMc {
  TgSendPhoto from(String id, [String type = 'bot_username']) {
    this.params['from'] = {'type': type, 'id': id};
    return this;
  }

  TgSendPhoto to(String id, [String type = 'chat_id']) {
    this.params['to'] = {
      'type': type,
      'id': id,
    };
    return this;
  }

  TgSendPhoto content(String url, [String text = '']) {
    this.params["content"] = {
      'type': 'photo',
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
