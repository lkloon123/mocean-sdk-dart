import 'package:moceansdk/src/modules/voice/mc/dial.dart';
import 'package:moceansdk/src/modules/voice/mc/collect.dart';
import 'package:moceansdk/src/modules/voice/mc/play.dart';
import 'package:moceansdk/src/modules/voice/mc/say.dart';
import 'package:moceansdk/src/modules/voice/mc/sleep.dart';
import 'package:moceansdk/src/modules/voice/mc/record.dart';

class Mc {
  static Say say([text]) => Say()..text = text ?? null;

  static Play play([file]) => Play()..files = file ?? null;

  static Dial dial([to]) => Dial()..to = to ?? null;

  static Collect collect([eventUrl]) => Collect()..eventUrl = eventUrl ?? null;

  static Sleep sleep([duration]) => Sleep()..duration = duration ?? null;

  static Record record() => Record();
}
