import 'package:moceansdk/src/modules/command/mc/abstract_mc.dart';

class TgSendAudio extends AbstractMc {
  TgSendAudio from(String id, {String type: 'bot_username'}) {
    this.params['from'] = {'type': type, 'id': id};
    return this;
  }

  TgSendAudio to(String id, {String type: 'chat_id'}) {
    this.params['to'] = {
      'type': type,
      'id': id,
    };
    return this;
  }

  TgSendAudio content(String url, [String text = '']) {
    this.params["content"] = {
      'type': 'audio',
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
  List requiredKey() {
    return ["from", "to", "content"];
  }
}
