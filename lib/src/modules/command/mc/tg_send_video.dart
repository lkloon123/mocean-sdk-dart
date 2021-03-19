import 'package:moceansdk/src/modules/command/mc/abstract_mc.dart';

class TgSendVideo extends AbstractMc {
  TgSendVideo from(String id, [String type = 'bot_username']) {
    this.params['from'] = {'type': type, 'id': id};
    return this;
  }

  TgSendVideo to(String id, [String type = 'chat_id']) {
    this.params['to'] = {
      'type': type,
      'id': id,
    };
    return this;
  }

  TgSendVideo content(String url, [String text = '']) {
    this.params["content"] = {
      'type': 'video',
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
