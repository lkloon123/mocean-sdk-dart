import 'dart:typed_data';

import 'package:http/http.dart';
import 'package:moceansdk/moceansdk.dart';
import 'package:test/test.dart';
import '../../testing_utils.dart';

main() {
  Mocean mocean;

  setUp(() {
    mocean = TestingUtils.getMoceanObject();
  });

  group('Test Recording', () {
    test('recording', () async {
      var transmitterMock = Transmitter(
        httpClient: TestingUtils.getMockHttpClient(
          'recording.json',
          (Request request) {
            expect(request.method, equalsIgnoringCase('get'));
            expect(
              request.url.queryParameters['mocean-call-uuid'],
              equals('xxx-xxx-xxx-xxx'),
            );
            expect(
              request.url.path,
              equals(TestingUtils.getTestUri('/voice/rec')),
            );
          },
        ),
      );

      mocean = TestingUtils.getMoceanObject(transmitterMock);
      var recording = await mocean.voice.recording('xxx-xxx-xxx-xxx');
      expect(recording['recordingBuffer'], isA<Uint8List>());
      expect(recording['filename'], isA<String>());
      expect(recording['filename'], equals('xxx-xxx-xxx-xxx.mp3'));
    });
  });
}
