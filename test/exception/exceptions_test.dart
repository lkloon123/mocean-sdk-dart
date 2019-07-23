import 'dart:convert';

import 'package:moceansdk/moceansdk.dart';
import 'package:test/test.dart';

import '../testing_utils.dart';

main() {
  group('Test Mocean Error Exception', () {
    test('throw with error response', () async {
      var transmitterMock = Transmitter(
          null, TestingUtils.getMockHttpClient('error_response.json'));
      try {
        await transmitterMock.send('get', '/test', {});
        fail('response with error passed without throw');
      } on MoceanErrorException catch (e) {
        expect(e.toString(),
            equals('${e.runtimeType.toString()}: Authorization failed'));

        expect(
            e.errorResponse,
            equals(json
                .decode(TestingUtils.getResponseStr('error_response.json'))));

        expect(e.errorResponse['status'], equals(1));
      }
    });
  });
}
