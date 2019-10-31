import 'package:moceansdk/src/modules/voice/mccc/dial.dart';
import 'package:moceansdk/src/modules/voice/mccc/collect.dart';
import 'package:moceansdk/src/modules/voice/mccc/play.dart';
import 'package:moceansdk/src/modules/voice/mccc/say.dart';
import 'package:moceansdk/src/modules/voice/mccc/sleep.dart';
import 'package:moceansdk/src/modules/voice/mccc/record.dart';

class Mccc {
  static Say say([text]) => Say()..text = text ?? null;

  static Play play([file]) => Play()..files = file ?? null;

  static Dial dial([to]) => Dial()..to = to ?? null;

  static Collect collect([eventUrl]) => Collect()..eventUrl = eventUrl ?? null;

  static Sleep sleep([duration]) => Sleep()..duration = duration ?? null;

  static Record record() => Record();
}
