import 'package:moceansdk/src/auth/auth_interface.dart';
import 'package:moceansdk/src/modules/abstract_client.dart';
import 'package:moceansdk/src/modules/transmitter.dart';

class Sms extends AbstractClient {
  Sms(AuthInterface objAuth, Transmitter transmitter)
      : super(objAuth, transmitter);

  void set from(String value) {
    this.params['mocean-from'] = value;
  }

  void set to(String value) {
    this.params['mocean-to'] = value;
  }

  void set text(String value) {
    this.params['mocean-text'] = value;
  }

  void set udh(String value) {
    this.params['mocean-udh'] = value;
  }

  void set coding(String value) {
    this.params['mocean-coding'] = value;
  }

  void set dlrMask(String value) {
    this.params['mocean-dlr-mask'] = value;
  }

  void set dlrUrl(String value) {
    this.params['mocean-dlr-url'] = value;
  }

  void set schedule(String value) {
    this.params['mocean-schedule'] = value;
  }

  void set mClass(String value) {
    this.params['mocean-mclass'] = value;
  }

  void set altDcs(String value) {
    this.params['mocean-alt-dcs'] = value;
  }

  void set charSet(String value) {
    this.params['mocean-charset'] = value;
  }

  void set validity(String value) {
    this.params['mocean-validity'] = value;
  }

  Future send([Map params]) async {
    if (params != null) {
      this.create(params);
    }
    this.isRequiredFieldSet();

    return await this.transmitter.post('/sms', this.params);
  }

  @override
  List requiredKey() {
    var requiredKey = super.requiredKey();
    requiredKey.addAll(['mocean-from', 'mocean-to', 'mocean-text']);
    return requiredKey;
  }
}
