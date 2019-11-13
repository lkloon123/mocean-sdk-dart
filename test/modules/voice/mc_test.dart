import 'package:moceansdk/moceansdk.dart';
import 'package:test/test.dart';

main() {
  group('Test Mc', () {
    test('mc say', () {
      var say = Mc.say();

      try {
        say.requestData;
        fail('passed when required field not set');
      } on RequiredFieldException {}

      say.text = 'testing text';
      expect(say.requestData['text'], equals('testing text'));

      expect(
        Mc.say('testing text2').requestData['text'],
        equals('testing text2'),
      );
    });

    test('mc dial', () {
      var dial = Mc.dial();

      try {
        dial.requestData;
        fail('passed when required field not set');
      } on RequiredFieldException {}

      dial.to = 'testing to';
      expect(dial.requestData['to'], equals('testing to'));

      expect(
        Mc.dial('testing to2').requestData['to'],
        equals('testing to2'),
      );
    });

    test('mc collect', () {
      var collect = Mc.collect();

      try {
        collect.requestData;
        fail('passed when required field not set');
      } on RequiredFieldException {}

      collect.eventUrl = 'testing eventUrl';
      collect.min = 1;
      collect.max = 10;
      collect.timeout = 500;
      expect(collect.requestData['event-url'], equals('testing eventUrl'));

      collect = Mc.collect('testing eventUrl2');
      collect.min = 1;
      collect.max = 10;
      collect.timeout = 500;
      expect(
        collect.requestData['event-url'],
        equals('testing eventUrl2'),
      );
    });

    test('mc play', () {
      var play = Mc.play();

      try {
        play.requestData;
        fail('passed when required field not set');
      } on RequiredFieldException {}

      play.files = 'testing file';
      expect(play.requestData['file'], equals('testing file'));

      expect(
        Mc.play('testing file2').requestData['file'],
        equals('testing file2'),
      );
    });

    test('mc sleep', () {
      var sleep = Mc.sleep();

      try {
        sleep.requestData;
        fail('passed when required field not set');
      } on RequiredFieldException {}

      sleep.duration = 10000;
      expect(sleep.requestData['duration'], equals(10000));

      expect(Mc.sleep(20000).requestData['duration'], equals(20000));
    });

    test('mc record', () {
      var record = Mc.record();
      expect(record.requestData['action'], equals('record'));
    });
  });
}
