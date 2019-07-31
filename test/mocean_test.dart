import 'package:moceansdk/moceansdk.dart';
import 'package:moceansdk/src/auth/auth_interface.dart';
import 'package:test/test.dart';

void main() {
  Basic basic;

  setUp(() {
    basic = Basic('test api key', 'test api secret');
  });

  group('Test Client', () {
    test('client creation error when no api key or api secret', () {
      expect(
        () => Mocean(Basic()),
        throwsA(TypeMatcher<RequiredFieldException>()),
      );
      expect(
        () => Mocean(Basic('', '')),
        throwsA(TypeMatcher<RequiredFieldException>()),
      );
      expect(
        () => Mocean(Basic('test api key', '')),
        throwsA(TypeMatcher<RequiredFieldException>()),
      );
      expect(
        () => Mocean(Basic('', 'test api secret')),
        throwsA(TypeMatcher<RequiredFieldException>()),
      );
      expect(
        () => Mocean(Basic('test api key', null)),
        throwsA(TypeMatcher<RequiredFieldException>()),
      );
      expect(
        () => Mocean(Basic(null, 'test api secret')),
        throwsA(TypeMatcher<RequiredFieldException>()),
      );
    });

    test('able to construct mocean object', () {
      try {
        Mocean(basic);
      } on Exception catch (e) {
        fail(e.toString());
      }
    });

    test('create client with unsupported auth', () {
      expect(
        () => Mocean(DummyAuth()),
        throwsA(TypeMatcher<MoceanErrorException>()),
      );
    });
  });
}

class DummyAuth implements AuthInterface {
  @override
  String getAuthMethod() {
    return 'test';
  }

  @override
  Map getParams() {
    return {};
  }
}
