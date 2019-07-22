class TransmitterConfig {
  String _baseUrl = 'https://rest.moceanapi.com';
  String _version = '2';

  TransmitterConfig([String baseUrl = null, String version = null]) {
    if (baseUrl != null) {
      this._baseUrl = baseUrl;
    }
    if (version != null) {
      this._version = version;
    }
  }

  static TransmitterConfig make() => TransmitterConfig();

  String get baseUrl => _baseUrl;

  void set baseUrl(String value) {
    this._baseUrl = value;
  }

  String get version => _version;

  void set version(String value) {
    this._version = value;
  }
}
