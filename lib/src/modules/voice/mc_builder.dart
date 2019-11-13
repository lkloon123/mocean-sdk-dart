import 'package:moceansdk/src/modules/voice/mc/abstract_mc.dart';

class McBuilder {
  List _mc;

  McBuilder([mc]) {
    mc ??= [];
    this._mc = mc;
  }

  McBuilder add(AbstractMc mc) {
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
