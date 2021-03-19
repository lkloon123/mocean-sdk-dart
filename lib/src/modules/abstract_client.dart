import 'package:moceansdk/moceansdk.dart';
import 'package:moceansdk/src/auth/auth_interface.dart';
import 'package:moceansdk/src/modules/transmitter.dart';
import 'package:moceansdk/src/utils.dart';

abstract class AbstractClient {
  Map<String, dynamic> params;
  AuthInterface objAuth;
  Transmitter transmitter;

  AbstractClient(this.objAuth, this.transmitter) {
    this.params = this.objAuth.getParams();
  }

  void create(params) {
    this.params.addAll(params);
  }

  void isRequiredFieldSet() {
    for (var required in this.requiredKey()) {
      if (Utils.isNullOrEmpty(this.params[required])) {
        throw RequiredFieldException(
          "${required} is mandatory field, can't be empty",
        );
      }
    }
  }

  List<String> requiredKey() {
    return ['mocean-api-key', 'mocean-api-secret'];
  }
}
