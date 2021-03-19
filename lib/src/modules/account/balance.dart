import 'package:moceansdk/src/auth/auth_interface.dart';
import 'package:moceansdk/src/modules/abstract_client.dart';
import 'package:moceansdk/src/modules/transmitter.dart';

class Balance extends AbstractClient {
  Balance(
    AuthInterface objAuth,
    Transmitter transmitter,
  ) : super(objAuth, transmitter);

  Future<Map<String, dynamic>> inquiry([Map<String, dynamic> params]) async {
    if (params != null) {
      this.create(params);
    }
    this.isRequiredFieldSet();

    return await this.transmitter.get('/account/balance', this.params);
  }
}
