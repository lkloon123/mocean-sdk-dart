import 'dart:convert';

import 'package:moceansdk/moceansdk.dart';
import 'package:moceansdk/src/modules/transmitter_config.dart';
import 'package:http/http.dart' as http;
import 'package:moceansdk/src/utils.dart';

class Transmitter {
  TransmitterConfig _transmitterConfig;
  http.Client _httpClient;

  Transmitter([TransmitterConfig transmitterConfig, http.Client httpClient]) {
    if (transmitterConfig == null) {
      transmitterConfig = TransmitterConfig.make();
    }

    if (httpClient == null) {
      httpClient = http.Client();
    }

    this._httpClient = httpClient;
    this._transmitterConfig = transmitterConfig;
  }

  Future get(String uri, Map params) async => this.send('get', uri, params);

  Future post(String uri, Map params) async => this.send('post', uri, params);

  Future send(String method, String uri, Map params) async {
    params['mocean-medium'] = 'DART-SDK';
    params['mocean-resp-format'] = 'json';

    var response;
    if (method == 'get') {
      response = await this._httpClient.get(
          "${this._transmitterConfig.baseUrl}/rest/${this._transmitterConfig.version}${uri}?${this.encodeMap(params)}");
    } else {
      response = await this._httpClient.post(
          "${this._transmitterConfig.baseUrl}/rest/${this._transmitterConfig.version}${uri}",
          body: params);
    }

    var decodedBody = json.decode(response.body);

    if (!Utils.isNullOrEmpty(decodedBody['status']) &&
        decodedBody['status'] != '0' &&
        decodedBody['status'] != 0) {
      throw MoceanErrorException(decodedBody['err_msg'], decodedBody);
    }

    return decodedBody;
  }

  String encodeMap(Map data) {
    return data.keys
        .map((key) =>
            "${Uri.encodeComponent(key)}=${Uri.encodeComponent(data[key])}")
        .join("&");
  }
}
