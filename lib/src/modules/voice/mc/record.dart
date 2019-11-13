import 'package:moceansdk/src/modules/voice/mc/abstract_mc.dart';

class Record extends AbstractMc {
  Record([params]) : super(params);

  @override
  String action() => 'record';

  @override
  List requiredKey() => [];
}
