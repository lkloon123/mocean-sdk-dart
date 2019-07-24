import 'package:moceansdk/src/modules/voice/mccc/abstract_mccc.dart';

class Collect extends AbstractMccc {
  Collect([params]) : super(params) {
    this.params['min'] ??= 1;
    this.params['max'] ??= 10;
    this.params['terminators'] ??= '#';
    this.params['timeout'] ??= 5000;
  }

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
  List requiredKey() => ['event-url', 'min', 'max', 'terminators', 'timeout'];
}
