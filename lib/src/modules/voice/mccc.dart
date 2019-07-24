import 'package:moceansdk/src/modules/voice/mccc/bridge.dart';
import 'package:moceansdk/src/modules/voice/mccc/collect.dart';
import 'package:moceansdk/src/modules/voice/mccc/play.dart';
import 'package:moceansdk/src/modules/voice/mccc/say.dart';
import 'package:moceansdk/src/modules/voice/mccc/sleep.dart';

class Mccc {
  static Say say([text]) => Say()..text = text ?? null;

  static Play play([file]) => Play()..files = file ?? null;

  static Bridge bridge([to]) => Bridge()..to = to ?? null;

  static Collect collect([eventUrl]) => Collect()..eventUrl = eventUrl ?? null;

  static Sleep sleep([duration]) => Sleep()..duration = duration ?? null;
}
