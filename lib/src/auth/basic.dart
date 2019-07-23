import 'package:moceansdk/src/auth/auth_interface.dart';

class Basic implements AuthInterface {
  Map params;

  Basic([String apiKey, String apiSecret]) {
    this.params = Map();

    if (apiKey != null) {
      this.params['mocean-api-key'] = apiKey;
    }

    if (apiSecret != null) {
      this.params['mocean-api-secret'] = apiSecret;
    }
  }

  set apiKey(String apiKey) {
    this.params['mocean-api-key'] = apiKey;
  }

  set apiSecret(String apiSecret) {
    this.params['mocean-api-secret'] = apiSecret;
  }

  @override
  String getAuthMethod() {
    return 'basic';
  }

  @override
  Map getParams() {
    return this.params;
  }
}
