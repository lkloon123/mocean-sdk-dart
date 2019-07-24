import 'package:moceansdk/moceansdk.dart';
import 'package:test/test.dart';

main() {
  group('Test Mccc', () {
    test('mccc say', () {
      var say = Mccc.say();

      try {
        say.requestData;
        fail('passed when required field not set');
      } on RequiredFieldException {}

      say.text = 'testing text';
      expect(say.requestData['text'], equals('testing text'));

      expect(Mccc.say('testing text2').requestData['text'],
          equals('testing text2'));
    });

    test('mccc bridge', () {
      var bridge = Mccc.bridge();

      try {
        bridge.requestData;
        fail('passed when required field not set');
      } on RequiredFieldException {}

      bridge.to = 'testing to';
      expect(bridge.requestData['to'], equals('testing to'));

      expect(
          Mccc.bridge('testing to2').requestData['to'], equals('testing to2'));
    });

    test('mccc collect', () {
      var collect = Mccc.collect();

      try {
        collect.requestData;
        fail('passed when required field not set');
      } on RequiredFieldException {}

      collect.eventUrl = 'testing eventUrl';
      expect(collect.requestData['event-url'], equals('testing eventUrl'));

      expect(Mccc.collect('testing eventUrl2').requestData['event-url'],
          equals('testing eventUrl2'));
    });

    test('mccc play', () {
      var play = Mccc.play();

      try {
        play.requestData;
        fail('passed when required field not set');
      } on RequiredFieldException {}

      play.files = 'testing file';
      expect(play.requestData['file'], equals('testing file'));

      expect(Mccc.play('testing file2').requestData['file'],
          equals('testing file2'));
    });

    test('mccc sleep', () {
      var sleep = Mccc.sleep();

      try {
        sleep.requestData;
        fail('passed when required field not set');
      } on RequiredFieldException {}

      sleep.duration = 10000;
      expect(sleep.requestData['duration'], equals(10000));

      expect(Mccc.sleep(20000).requestData['duration'], equals(20000));
    });
  });
}
