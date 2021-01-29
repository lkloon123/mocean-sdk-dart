import 'package:moceansdk/src/modules/command/mc/abstract_mc.dart';

class CommandMcBuilder {
  List _mc;

  CommandMcBuilder([mc]) {
    mc ??= [];
    this._mc = mc;
  }

  CommandMcBuilder add(AbstractMc mc) {
    this._mc.add(mc);
    return this;
  }

  List build() {
    var converted = [];
    for (AbstractMc mc in this._mc) {
      converted.add(mc.requestData);
    }
    return converted;
  }
}
