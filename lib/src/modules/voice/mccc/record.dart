import 'package:moceansdk/src/modules/voice/mccc/abstract_mccc.dart';

class Record extends AbstractMccc {
  Record([params]) : super(params);

  @override
  String action() => 'record';

  @override
  List requiredKey() => [];
}
