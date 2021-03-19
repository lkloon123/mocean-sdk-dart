import 'package:moceansdk/moceansdk.dart';
import 'package:moceansdk/src/auth/auth_interface.dart';
import 'package:moceansdk/src/modules/abstract_client.dart';

class NumberLookup extends AbstractClient {
  NumberLookup(
    AuthInterface objAuth,
    Transmitter transmitter,
  ) : super(objAuth, transmitter);

  set to(String value) {
    this.params['mocean-to'] = value;
  }

  set nlUrl(String value) {
    this.params['mocean-nl-url'] = value;
  }

  Future<Map<String, dynamic>> inquiry([Map<String, dynamic> params]) async {
    if (params != null) {
      this.create(params);
    }
    this.isRequiredFieldSet();

    return await this.transmitter.post('/nl', this.params);
  }

  @override
  List<String> requiredKey() {
    var requiredKey = super.requiredKey();
    requiredKey.addAll(['mocean-to']);
    return requiredKey;
  }
}
