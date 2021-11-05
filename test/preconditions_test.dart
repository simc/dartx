import 'package:dartx/dartx.dart';
import 'package:test/test.dart';

void main() {
  group('Preconditions', () {
    test('require() requirements not met', () {
      expect(() => require(false), throwsException);
    });

    test('require() requirements met', () {
      expect(() => require(true), returnsNormally);
    });

    test('requireNotNull() value is null and requirements not met', () {
      expect(() => requireNotNull(null), throwsException);
    });

    test('requireNotNull() value is not null and requirements met', () {
      expect(requireNotNull('value'), 'value');
    });

    test('error()', () {
      expect(() => error('error massage'), throwsException);
    });
  });
}
