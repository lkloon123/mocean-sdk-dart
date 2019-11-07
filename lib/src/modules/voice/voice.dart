import 'dart:convert';
import 'package:moceansdk/moceansdk.dart';
import 'package:moceansdk/src/auth/auth_interface.dart';
import 'package:moceansdk/src/modules/abstract_client.dart';
import 'package:moceansdk/src/modules/voice/mc_builder.dart';
import 'package:moceansdk/src/modules/voice/mc/abstract_mc.dart';

class Voice extends AbstractClient {
  bool _isHangup;

  Voice(AuthInterface objAuth, Transmitter transmitter)
      : super(objAuth, transmitter) {
    this._isHangup = false;
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
      this.params['mocean-command'] =
          json.encode([value.requestData]);
    } else if (value is List) {
      this.params['mocean-command'] = json.encode(value);
    } else {
      this.params['mocean-command'] = value;
    }
  }

  Future call([Map params]) async {
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

  Future hangup(String callUuid) async {
    this._isHangup = true;
    this.create({});
    this.isRequiredFieldSet();

    return await this.transmitter.post('/voice/hangup/$callUuid', this.params);
  }

  @override
  List requiredKey() {
    var requiredKey = super.requiredKey();

    if (this._isHangup) {
      return requiredKey;
    }

    requiredKey.addAll(['mocean-to']);
    return requiredKey;
  }
}
