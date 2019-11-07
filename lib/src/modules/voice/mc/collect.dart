import 'package:moceansdk/src/modules/voice/mc/abstract_mc.dart';

class Collect extends AbstractMc {
  Collect([params]) : super(params);

  set eventUrl(String value) {
    this.params['event-url'] = value;
  }

  set min(int value) {
    this.params['min'] = value;
  }

  set max(int value) {
    this.params['max'] = value;
  }

  set terminators(String value) {
    this.params['terminators'] = value;
  }

  set timeout(int value) {
    this.params['timeout'] = value;
  }

  @override
  String action() => 'collect';

  @override
  List requiredKey() => ['event-url', 'min', 'max', 'timeout'];
}
