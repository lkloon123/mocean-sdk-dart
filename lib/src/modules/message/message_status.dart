import 'package:moceansdk/src/auth/auth_interface.dart';
import 'package:moceansdk/src/modules/abstract_client.dart';
import 'package:moceansdk/src/modules/transmitter.dart';

class MessageStatus extends AbstractClient {
  MessageStatus(AuthInterface objAuth, Transmitter transmitter) : super(objAuth, transmitter);

  void set msgId(String value) {
    this.params['mocean-msgid'] = value;
  }

  Future inquiry([Map params]) async {
    if (params != null) {
      this.create(params);
    }
    this.isRequiredFieldSet();

    return await this.transmitter.get('/report/message', this.params);
  }

  @override
  List requiredKey() {
    var requiredKey = super.requiredKey();
    requiredKey.addAll(['mocean-msgid']);
    return requiredKey;
  }
}
