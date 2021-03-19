import 'package:moceansdk/src/modules/voice/mc/abstract_mc.dart';

class Say extends AbstractMc {
  Say([params]) : super(params) {
    this.params['language'] ??= 'en-US';
  }

  set language(String value) {
    this.params['language'] = value;
  }

  set text(String value) {
    this.params['text'] = value;
  }

  set bargeIn(bool value) {
    this.params['barge-in'] = value;
  }

  set clearDigitCache(bool value) {
    this.params['clear-digit-cache'] = value;
  }

  @override
  String action() => 'say';

  @override
  List<String> requiredKey() => ['text', 'language'];
}
