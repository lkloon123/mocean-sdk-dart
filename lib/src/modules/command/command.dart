import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:moceansdk/moceansdk.dart';
import 'package:moceansdk/src/auth/auth_interface.dart';
import 'package:moceansdk/src/modules/abstract_client.dart';
import 'package:moceansdk/src/modules/command/command_mc_builder.dart';
import 'package:moceansdk/src/modules/command/mc/abstract_mc.dart';

class Command extends AbstractClient {
  Command(AuthInterface objAuth, Transmitter transmitter)
      : super(objAuth, transmitter) {}

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

  Future execute([Map params]) async {
    if (params != null) {
      if (params.containsKey('mocean-command')) {
        var mc = params['mocean-command'];
        params.remove('mocean-command');
        this.moceanCommand = mc;
      }

      this.create(params);
    }
    this.isRequiredFieldSet();

    return await this.transmitter.post('/send-message', this.params);
  }

  @override
  List requiredKey() {
    var requiredKey = super.requiredKey();

    requiredKey.addAll(['mocean-command']);
    return requiredKey;
  }
}
