import 'dart:convert';

import 'package:moceansdk/moceansdk.dart';
import 'package:moceansdk/src/modules/transmitter_config.dart';
import 'package:http/http.dart' as http;
import 'package:moceansdk/src/utils.dart';

class Transmitter {
  TransmitterConfig _transmitterConfig;
  http.Client _httpClient;

  Transmitter({TransmitterConfig transmitterConfig, http.Client httpClient}) {
    transmitterConfig ??= TransmitterConfig.make();
    httpClient ??= http.Client();

    this._httpClient = httpClient;
    this._transmitterConfig = transmitterConfig;
  }

  Future<Map<String, dynamic>> get(
    String uri,
    Map<String, dynamic> params,
  ) async {
    return this.sendAndReturnDecodedBody('get', uri, params);
  }

  Future<Map<String, dynamic>> post(
    String uri,
    Map<String, dynamic> params,
  ) async {
    return this.sendAndReturnDecodedBody('post', uri, params);
  }

  Future<Map<String, dynamic>> sendAndReturnDecodedBody(
    String method,
    String uri,
    Map<String, dynamic> params,
  ) async {
    http.Response response = await this.send(method, uri, params);

    var decodedBody = json.decode(response.body);

    if (!Utils.isNullOrEmpty(decodedBody['status']) &&
        decodedBody['status'] != '0' &&
        decodedBody['status'] != 0) {
      throw MoceanErrorException(decodedBody['err_msg'], decodedBody);
    }

    return decodedBody;
  }

  Future<http.Response> send(
    String method,
    String uri,
    Map<String, dynamic> params,
  ) async {
    params['mocean-medium'] = 'DART-SDK';
    params['mocean-resp-format'] = 'json';

    var response;
    if (method == 'get') {
      response = await this._httpClient.get(
            "${this._transmitterConfig.baseUrl}/rest/${this._transmitterConfig.version}${uri}?${this.encodeMap(params)}",
          );
    } else {
      response = await this._httpClient.post(
            "${this._transmitterConfig.baseUrl}/rest/${this._transmitterConfig.version}${uri}",
            body: params,
          );
    }

    return response;
  }

  String encodeMap(Map<String, dynamic> data) {
    return data.keys.map((key) {
      return "${Uri.encodeComponent(key)}=${Uri.encodeComponent(data[key])}";
    }).join("&");
  }
}
