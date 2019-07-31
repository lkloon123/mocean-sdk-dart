import 'package:moceansdk/src/auth/auth_interface.dart';
import 'package:moceansdk/src/modules/abstract_client.dart';
import 'package:moceansdk/src/modules/transmitter.dart';

class Pricing extends AbstractClient {
  Pricing(
    AuthInterface objAuth,
    Transmitter transmitter,
  ) : super(objAuth, transmitter);

  set mcc(String value) {
    this.params['mocean-mcc'] = value;
  }

  set mnc(String value) {
    this.params['mocean-mnc'] = value;
  }

  set delimiter(String value) {
    this.params['mocean-delimiter'] = value;
  }

  Future inquiry([Map params]) async {
    if (params != null) {
      this.create(params);
    }
    this.isRequiredFieldSet();

    return await this.transmitter.get('/account/pricing', this.params);
  }
}
