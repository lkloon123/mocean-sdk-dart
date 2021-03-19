import 'package:moceansdk/src/modules/command/mc/tg_send_photo.dart';
import 'package:moceansdk/src/modules/command/mc/tg_send_text.dart';
import 'package:moceansdk/src/modules/command/mc/tg_send_audio.dart';
import 'package:moceansdk/src/modules/command/mc/tg_send_animation.dart';
import 'package:moceansdk/src/modules/command/mc/tg_send_document.dart';
import 'package:moceansdk/src/modules/command/mc/tg_send_video.dart';
import 'package:moceansdk/src/modules/command/mc/tg_request_contact.dart';
import 'package:moceansdk/src/modules/command/mc/send_sms.dart';

class CommandMc {
  static TgSendText get tgSendText => TgSendText();

  static TgSendAudio get tgSendAudio => TgSendAudio();

  static TgSendAnimation get tgSendAnimation => TgSendAnimation();

  static TgSendDocument get tgSendDocument => TgSendDocument();

  static TgSendVideo get tgSendVideo => TgSendVideo();

  static TgSendPhoto get tgSendPhoto => TgSendPhoto();

  static TgRequestContact get tgRequestContact => TgRequestContact();

  static SendSMS get sendSMS => SendSMS();
}
