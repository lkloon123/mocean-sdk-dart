import 'dart:convert';
import 'package:moceansdk/moceansdk.dart';
import 'package:moceansdk/src/auth/auth_interface.dart';
import 'package:moceansdk/src/modules/abstract_client.dart';
import 'package:moceansdk/src/modules/voice/mccc_builder.dart';
import 'package:moceansdk/src/modules/voice/mccc/abstract_mccc.dart';

class Voice extends AbstractClient {
  Voice(AuthInterface objAuth, Transmitter transmitter)
      : super(objAuth, transmitter);

  set to(String value) {
    this.params['mocean-to'] = value;
  }

  set callEventUrl(String value) {
    this.params['mocean-call-event-url'] = value;
  }

  set callControlCommands(value) {
    if (value is McccBuilder) {
      this.params['mocean-call-control-commands'] = json.encode(value.build());
    } else if (value is AbstractMccc) {
      this.params['mocean-call-control-commands'] =
          json.encode([value.requestData]);
    } else if (value is List) {
      this.params['mocean-call-control-commands'] = json.encode(value);
    } else {
      this.params['mocean-call-control-commands'] = value;
    }
  }

  Future call([Map params]) async {
    if (params != null) {
      if (params.containsKey('mocean-call-control-commands')) {
        var mccc = params['mocean-call-control-commands'];
        params.remove('mocean-call-control-commands');
        this.callControlCommands = mccc;
      }

      this.create(params);
    }
    this.isRequiredFieldSet();

    return await this.transmitter.post('/voice/dial', this.params);
  }

  @override
  List requiredKey() {
    var requiredKey = super.requiredKey();
    requiredKey.addAll(['mocean-to']);
    return requiredKey;
  }
}
