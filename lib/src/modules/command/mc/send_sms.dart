import 'package:moceansdk/src/modules/command/mc/abstract_mc.dart';

class SendSMS extends AbstractMc {
  SendSMS from(String id, [String type = 'phone_num']) {
    this.params['from'] = {
      'type': type,
      'id': id,
    };
    return this;
  }

  SendSMS to(String id, [String type = 'phone_num']) {
    this.params['to'] = {
      'type': type,
      'id': id,
    };
    return this;
  }

  SendSMS content(String text) {
    this.params["content"] = {'type': 'text', 'text': text};
    return this;
  }

  @override
  String action() {
    return "send-sms";
  }

  @override
  List requiredKey() {
    return ["from", "to", "content"];
  }
}
