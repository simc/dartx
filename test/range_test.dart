import 'package:dartx/dartx.dart';
import 'package:test/test.dart';

void main() {
  group('rangeTo', () {
    test('upwards', () {
      expect(5.rangeTo(10).toList(), [5, 6, 7, 8, 9, 10]);
    });
    test('downwards', () {
      expect(6.rangeTo(3).toList(), [6, 5, 4, 3]);
    });
    test('empty when start == end', () {
      expect(6.rangeTo(6).toList(), []);
    });
  });

  group('rangeTo with step()', () {
    test('upwards', () {
      expect(5.rangeTo(10).step(2).toList(), [5, 7, 9]);
    });
    test('downwards', () {
      expect(6.rangeTo(3).step(2).toList(), [6, 4]);
    });

    test('step must be positive', () {
      expect(() => 1.rangeTo(10).step(0), throwsA(isA<RangeError>()));
      expect(() => 1.rangeTo(10).step(-2), throwsA(isA<RangeError>()));
    });
  });

  group('IntRange properties', () {
    test('first', () {
      expect(3.rangeTo(7).first, 3);
    });

    test('last', () {
      expect(3.rangeTo(6).last, 6);
      expect(3.rangeTo(6).step(2).last, 5);
    });

    test('stepSize', () {
      expect(3.rangeTo(6).stepSize, 1);
      expect(3.rangeTo(6).step(2).stepSize, 2);
    });
  });

  group('IntRange contains', () {
    test('contains', () {
      expect(0.rangeTo(10).step(2).contains(1), isFalse);
      expect(0.rangeTo(10).step(2).contains(0), isTrue);
      expect(0.rangeTo(10).step(2).contains(10), isTrue);
    });
  });
}
