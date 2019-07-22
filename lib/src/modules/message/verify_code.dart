import 'package:moceansdk/moceansdk.dart';
import 'package:moceansdk/src/auth/auth_interface.dart';
import 'package:moceansdk/src/modules/abstract_client.dart';

class VerifyCode extends AbstractClient {
  VerifyCode(AuthInterface objAuth, Transmitter transmitter)
      : super(objAuth, transmitter);

  void set reqId(String value) {
    this.params['mocean-reqid'] = value;
  }

  void set code(String value) {
    this.params['mocean-code'] = value;
  }

  Future send([Map params = null]) async {
    if (params != null) {
      this.create(params);
    }
    this.isRequiredFieldSet();

    return await this.transmitter.post('/verify/check', this.params);
  }

  @override
  List requiredKey() {
    var requiredKey = super.requiredKey();
    requiredKey.addAll(['mocean-reqid', 'mocean-code']);
    return requiredKey;
  }
}
