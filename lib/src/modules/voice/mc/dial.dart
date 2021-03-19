import 'package:moceansdk/src/modules/voice/mc/abstract_mc.dart';

class Dial extends AbstractMc {
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
  List<String> requiredKey() => ['to'];
}
