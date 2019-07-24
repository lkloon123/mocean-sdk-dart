import 'package:moceansdk/src/modules/voice/mccc/abstract_mccc.dart';

class Say extends AbstractMccc {
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

  @override
  String action() => 'say';

  @override
  List requiredKey() => ['text', 'language'];
}
