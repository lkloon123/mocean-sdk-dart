import 'package:moceansdk/src/modules/voice/mc/abstract_mc.dart';

class Sleep extends AbstractMc {
  Sleep([params]) : super(params);

  set duration(int value) {
    this.params['duration'] = value;
  }

  @override
  String action() => 'sleep';

  @override
  List<String> requiredKey() => ['duration'];
}
