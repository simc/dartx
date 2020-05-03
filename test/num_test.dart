import 'package:test/test.dart';
import 'package:dartx/dartx.dart';

void main() {
  group('NumX', () {
    test('.coerceIn()', () {
      expect(10.coerceIn(0), 10);
      expect(10.coerceIn(12), 12);
      expect(10.coerceIn(0, 11), 10);
      expect(10.coerceIn(0, 9), 9);
      expect(() => 10.coerceIn(3, 2), throwsArgumentError);
    });

    test('.coerceAtLeast()', () {
      expect(10.coerceAtLeast(0), 10);
      expect(10.coerceAtLeast(12), 12);
    });

    test('.coerceAtMost()', () {
      expect(10.coerceAtMost(12), 10);
      expect(10.coerceAtMost(5), 5);
    });

    test('.toBytes()', () {});

    test('int.inRange()', () {
      expect(5.inRange(0.rangeTo(10)), isTrue);
      expect(10.inRange(0.0.rangeTo(10.0)), isTrue);
      expect(0.inRange(0.rangeTo(10)), isTrue);
      expect((-1).inRange(0.0.rangeTo(10.0)), isFalse);
      expect(11.inRange(0.rangeTo(10)), isFalse);
    });

    test('double.inRange()', () {
      expect(5.0.inRange(0.rangeTo(10)), isTrue);
      expect(10.0.inRange(0.0.rangeTo(10.0)), isTrue);
      expect(0.0.inRange(0.rangeTo(10)), isTrue);
      expect((-1.0).inRange(0.0.rangeTo(10.0)), isFalse);
      expect(11.0.inRange(0.rangeTo(10)), isFalse);
    });

    test('int.between()', () {
      expect(5.between(0.0, 10.0), isTrue);
      expect(10.between(0, 10), isTrue);
      expect(0.between(0.0, 10.0), isTrue);
      expect((-1).between(0, 10), isFalse);
      expect(11.between(0.0, 10.0), isFalse);

      // reverse order
      expect(5.between(10, 0), isTrue);
      expect(10.between(10.0, 0.0), isTrue);
      expect(0.between(10, 0), isTrue);
      expect((-1).between(10.0, 0.0), isFalse);
      expect(11.between(10, 0), isFalse);
    });

    test('double.between()', () {
      expect(5.0.between(0.0, 10.0), isTrue);
      expect(10.0.between(0, 10), isTrue);
      expect(0.0.between(0.0, 10.0), isTrue);
      expect((-1.0).between(0, 10), isFalse);
      expect(11.0.between(0.0, 10.0), isFalse);

      // reverse order
      expect(5.0.between(10, 0), isTrue);
      expect(10.0.between(10.0, 0.0), isTrue);
      expect(0.0.between(10, 0), isTrue);
      expect((-1.0).between(10.0, 0.0), isFalse);
      expect(11.0.between(10, 0), isFalse);
    });
  });
}
