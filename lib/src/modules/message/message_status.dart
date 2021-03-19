import 'package:moceansdk/src/auth/auth_interface.dart';
import 'package:moceansdk/src/modules/abstract_client.dart';
import 'package:moceansdk/src/modules/transmitter.dart';

class MessageStatus extends AbstractClient {
  MessageStatus(
    AuthInterface objAuth,
    Transmitter transmitter,
  ) : super(objAuth, transmitter);

  set msgId(String value) {
    this.params['mocean-msgid'] = value;
  }

  Future<Map<String, dynamic>> inquiry([Map<String, dynamic> params]) async {
    if (params != null) {
      this.create(params);
    }
    this.isRequiredFieldSet();

    return await this.transmitter.get('/report/message', this.params);
  }

  @override
  List<String> requiredKey() {
    var requiredKey = super.requiredKey();
    requiredKey.addAll(['mocean-msgid']);
    return requiredKey;
  }
}
