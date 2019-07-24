import 'package:moceansdk/src/modules/voice/mccc/abstract_mccc.dart';

class Play extends AbstractMccc {
  Play([params]) : super(params);

  set files(String value) {
    this.params['file'] = value;
  }

  set bargeIn(bool value) {
    this.params['barge-in'] = value;
  }

  @override
  String action() => 'play';

  @override
  List requiredKey() => ['file'];
}
