import 'package:moceansdk/moceansdk.dart';
import 'package:moceansdk/src/auth/auth_interface.dart';
import 'package:moceansdk/src/modules/transmitter.dart';
import 'package:moceansdk/src/utils.dart';

abstract class AbstractClient {
  Map params;
  AuthInterface objAuth;
  Transmitter transmitter;

  AbstractClient(AuthInterface this.objAuth, Transmitter this.transmitter) {
    this.params = objAuth.getParams();
  }

  AbstractClient create(params) {
    this.params.addAll(params);
    return this;
  }

  void isRequiredFieldSet() {
    for (var required in this.requiredKey()) {
      if (Utils.isNullOrEmpty(this.params[required])) {
        throw RequiredFieldException(
            "${required} is mandatory field, can't be empty");
      }
    }
  }

  List requiredKey() {
    return ['mocean-api-key', 'mocean-api-secret'];
  }
}
