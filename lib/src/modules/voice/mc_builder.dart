import 'package:moceansdk/src/modules/voice/mc/abstract_mc.dart';

class McBuilder {
  List<AbstractMc> _mc;

  McBuilder([List<AbstractMc> mc]) {
    mc ??= <AbstractMc>[];
    this._mc = mc;
  }

  McBuilder add(AbstractMc mc) {
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
