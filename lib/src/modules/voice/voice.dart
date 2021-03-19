import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:moceansdk/moceansdk.dart';
import 'package:moceansdk/src/auth/auth_interface.dart';
import 'package:moceansdk/src/modules/abstract_client.dart';
import 'package:moceansdk/src/modules/voice/mc_builder.dart';
import 'package:moceansdk/src/modules/voice/mc/abstract_mc.dart';

class Voice extends AbstractClient {
  bool _isHangup;
  bool _isRecording;

  Voice(AuthInterface objAuth, Transmitter transmitter)
      : super(objAuth, transmitter) {
    this._isHangup = false;
    this._isRecording = false;
  }

  set to(String value) {
    this.params['mocean-to'] = value;
  }

  set eventUrl(String value) {
    this.params['mocean-event-url'] = value;
  }

  set moceanCommand(value) {
    if (value is McBuilder) {
      this.params['mocean-command'] = json.encode(value.build());
    } else if (value is AbstractMc) {
      this.params['mocean-command'] = json.encode([value.requestData]);
    } else if (value is List) {
      this.params['mocean-command'] = json.encode(value);
    } else {
      this.params['mocean-command'] = value;
    }
  }

  Future<Map<String, dynamic>> call([Map<String, dynamic> params]) async {
    if (params != null) {
      if (params.containsKey('mocean-command')) {
        var mc = params['mocean-command'];
        params.remove('mocean-command');
        this.moceanCommand = mc;
      }

      this.create(params);
    }
    this.isRequiredFieldSet();

    return await this.transmitter.post('/voice/dial', this.params);
  }

  Future<Map<String, dynamic>> hangup(String callUuid) async {
    this._isHangup = true;
    this.create({'mocean-call-uuid': callUuid});
    this.isRequiredFieldSet();

    return await this.transmitter.post('/voice/hangup', this.params);
  }

  Future<Map<String, dynamic>> recording(String callUuid) async {
    this._isRecording = true;
    this.create({'mocean-call-uuid': callUuid});
    this.isRequiredFieldSet();

    return this
        .transmitter
        .send('get', '/voice/rec', this.params)
        .then((http.Response response) => response.bodyBytes)
        .then((recordingBuffer) => {
              'recordingBuffer': recordingBuffer,
              'filename': "${callUuid}.mp3"
            });
  }

  @override
  List<String> requiredKey() {
    var requiredKey = super.requiredKey();

    if (this._isHangup || this._isRecording) {
      return requiredKey;
    }

    requiredKey.addAll(['mocean-to']);
    return requiredKey;
  }
}
