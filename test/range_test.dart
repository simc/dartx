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

  group('ClosedRange', () {
    test('==', () {
      expect(
        DateTime(1984, 11, 19).rangeTo(DateTime(2020, 1, 1)) ==
        ComparableRange(DateTime(1984, 11, 19), DateTime(2020, 1, 1)),
        isTrue
      );

      final num zero = 0.0;
      final num one = 1.0;
      final numRange = zero.rangeTo(one);
      // ComparableRange<num>.==(IntRange)
      expect(0.rangeTo(1) == numRange, isTrue);
    });

    test('.toString', () {
      expect(
        DateTime(1984, 11, 19).rangeTo(DateTime(2020, 1, 1)).toString(),
        "1984-11-19 00:00:00.000..2020-01-01 00:00:00.000"
      );
      final num zero = 0;
      final num one = 1;
      final numRange = zero.rangeTo(one);
      expect(numRange.toString(), '0..1');
      final num zeroDouble = 0.0;
      final num oneDouble = 1.0;
      expect(zeroDouble.rangeTo(oneDouble).toString(), '0.0..1.0');
    });
  });

  group('ComparableRange', () {
    test('.contains()', () {
      final dateRange = DateTime(1984, 11, 19).rangeTo(DateTime(2020, 1, 1));
      expect(dateRange.contains(DateTime(1984, 11, 19)), isTrue);
      expect(dateRange.contains(DateTime(2019, 11, 19)), isTrue);
      expect(dateRange.contains(DateTime(2020, 1, 1)), isTrue);
      expect(dateRange.contains(DateTime(2020, 1, 2)), isFalse);
      expect(dateRange.contains(DateTime(1984, 11, 18)), isFalse);
    });
    test('.isEmpty', () {
      expect(
        DateTime(1984, 11, 19).rangeTo(DateTime(2020, 1, 1)).isEmpty,
        false
      );
      expect(
        DateTime(2020, 1, 1).rangeTo(DateTime(1984, 11, 19)).isEmpty,
        isTrue
      );
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

    test('contains', () {
      expect(0.rangeTo(1).toString(), '0..1');
    });
  });
}
