import 'package:moceansdk/src/modules/voice/mccc/abstract_mccc.dart';

class Dial extends AbstractMccc {
  Dial([params]) : super(params);

  set to(String value) {
    this.params['to'] = value;
  }

  set from(String value) {
    this.params['from'] = value;
  }

  set dialSequentially(bool value) {
    this.params['dial-sequentially'] = value;
  }

  @override
  String action() => 'dial';

  @override
  List requiredKey() => ['to'];
}
