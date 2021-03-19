import 'package:moceansdk/src/modules/command/mc/abstract_mc.dart';

class CommandMcBuilder {
  List<AbstractMc> _mc;

  CommandMcBuilder([List<AbstractMc> mc]) {
    mc ??= <AbstractMc>[];
    this._mc = mc;
  }

  CommandMcBuilder add(AbstractMc mc) {
    this._mc.add(mc);
    return this;
  }

  List<Map<String, dynamic>> build() {
    List<Map<String, dynamic>> converted = <Map<String, dynamic>>[];
    for (AbstractMc mc in this._mc) {
      converted.add(mc.requestData);
    }
    return converted;
  }
}
