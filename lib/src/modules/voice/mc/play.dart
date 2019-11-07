import 'package:moceansdk/src/modules/voice/mc/abstract_mc.dart';

class Play extends AbstractMc {
  Play([params]) : super(params);

  set files(String value) {
    this.params['file'] = value;
  }

  set bargeIn(bool value) {
    this.params['barge-in'] = value;
  }

  set clearDigitCache(bool value) {
    this.params['clear-digit-cache'] = value;
  }

  @override
  String action() => 'play';

  @override
  List requiredKey() => ['file'];
}
