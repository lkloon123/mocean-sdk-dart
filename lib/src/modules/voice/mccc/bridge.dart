import 'package:moceansdk/src/modules/voice/mccc/abstract_mccc.dart';

class Bridge extends AbstractMccc {
  Bridge([params]) : super(params);

  set to(String value) {
    this.params['to'] = value;
  }

  @override
  String action() => 'dial';

  @override
  List requiredKey() => ['to'];
}
