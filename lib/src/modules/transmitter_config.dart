class TransmitterConfig {
  String _baseUrl;
  String _version;

  TransmitterConfig([String baseUrl, String version]) {
    if (baseUrl == null) {
      baseUrl = 'https://rest.moceanapi.com';
    }
    if (version == null) {
      version = '2';
    }

    this._baseUrl = baseUrl;
    this._version = version;
  }

  static TransmitterConfig make() => TransmitterConfig();

  String get baseUrl => _baseUrl;

  set baseUrl(String value) {
    this._baseUrl = value;
  }

  String get version => _version;

  set version(String value) {
    this._version = value;
  }
}
