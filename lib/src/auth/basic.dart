import 'package:moceansdk/src/auth/auth_interface.dart';

class Basic implements AuthInterface {
  String _apiKey;
  String _apiSecret;

  Basic([this._apiKey, this._apiSecret]);

  set apiKey(String apiKey) {
    _apiKey = apiKey;
  }

  set apiSecret(String apiSecret) {
    _apiSecret = apiSecret;
  }

  @override
  String getAuthMethod() {
    return 'basic';
  }

  @override
  Map getParams() {
    return {
      'mocean-api-key': _apiKey,
      'mocean-api-secret': _apiSecret,
    };
  }
}
