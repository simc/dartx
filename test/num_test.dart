import 'dart:typed_data';

import 'package:dartx/dartx.dart';
import 'package:test/test.dart';

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

  group('IntX', () {
    test('toBytes', () {
      expect(
        123456789.toBytes(),
        Uint8List.fromList([0, 0, 0, 0, 7, 91, 205, 21]),
      );
      expect(
        123456789.toBytes(Endian.little),
        Uint8List.fromList([21, 205, 91, 7, 0, 0, 0, 0]),
      );
    });

    test('.toChar()', () {
      expect(97.toChar(), 'a');
      expect(65.toChar(), 'A');
      expect(37.toChar(), '%');
    });
  });

  group('DoubleX', () {
    test('toBytes', () {
      expect(
        123.456.toBytes(),
        Uint8List.fromList([64, 94, 221, 47, 26, 159, 190, 119]),
      );
      expect(
        123.455.toBytes(Endian.little),
        Uint8List.fromList([133, 235, 81, 184, 30, 221, 94, 64]),
      );
    });
  });
}
