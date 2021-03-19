import 'package:moceansdk/src/auth/auth_interface.dart';
import 'package:moceansdk/src/modules/abstract_client.dart';
import 'package:moceansdk/src/modules/transmitter.dart';

class Sms extends AbstractClient {
  Sms(
    AuthInterface objAuth,
    Transmitter transmitter,
  ) : super(objAuth, transmitter);

  set from(String value) {
    this.params['mocean-from'] = value;
  }

  set to(String value) {
    this.params['mocean-to'] = value;
  }

  set text(String value) {
    this.params['mocean-text'] = value;
  }

  set udh(String value) {
    this.params['mocean-udh'] = value;
  }

  set coding(String value) {
    this.params['mocean-coding'] = value;
  }

  set dlrMask(String value) {
    this.params['mocean-dlr-mask'] = value;
  }

  set dlrUrl(String value) {
    this.params['mocean-dlr-url'] = value;
  }

  set schedule(String value) {
    this.params['mocean-schedule'] = value;
  }

  set mClass(String value) {
    this.params['mocean-mclass'] = value;
  }

  set altDcs(String value) {
    this.params['mocean-alt-dcs'] = value;
  }

  set charSet(String value) {
    this.params['mocean-charset'] = value;
  }

  set validity(String value) {
    this.params['mocean-validity'] = value;
  }

  Future<Map<String, dynamic>> send([Map<String, dynamic> params]) async {
    if (params != null) {
      this.create(params);
    }
    this.isRequiredFieldSet();

    return await this.transmitter.post('/sms', this.params);
  }

  @override
  List<String> requiredKey() {
    var requiredKey = super.requiredKey();
    requiredKey.addAll(['mocean-from', 'mocean-to', 'mocean-text']);
    return requiredKey;
  }
}
