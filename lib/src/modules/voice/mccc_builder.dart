import 'package:moceansdk/src/modules/voice/mccc/abstract_mccc.dart';

class McccBuilder {
  List _mccc;

  McccBuilder([mccc]) {
    mccc ??= [];
    this._mccc = mccc;
  }

  McccBuilder add(AbstractMccc mccc) {
    this._mccc.add(mccc);
    return this;
  }

  List build() {
    var converted = [];
    for (AbstractMccc mccc in this._mccc) {
      converted.add(mccc.requestData);
    }
    return converted;
  }
}
