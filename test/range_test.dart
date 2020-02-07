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
    test('never empty, at least emits the start value', () {
      expect(6.rangeTo(6).toList(), [6]);
    });

    test('isEmpty always returns false', () {
      expect(6.rangeTo(6).isEmpty, isFalse);
      expect(6.rangeTo(1).isEmpty, isFalse);
      expect(6.rangeTo(19).isEmpty, isFalse);
      expect(0.rangeTo(0).isEmpty, isFalse);
      expect(0.rangeTo(-1).isEmpty, isFalse);
    });

    test('isNotEmpty always returns true', () {
      expect(6.rangeTo(6).isNotEmpty, isTrue);
      expect(6.rangeTo(1).isNotEmpty, isTrue);
      expect(6.rangeTo(19).isNotEmpty, isTrue);
      expect(0.rangeTo(0).isNotEmpty, isTrue);
      expect(0.rangeTo(-1).isNotEmpty, isTrue);
    });

    test('inverse range is not equal', () {
      expect(3.rangeTo(9), isNot(9.rangeTo(3)));
    });
  });

  group('ClosedRange', () {
    test('==', () {
      final r1 = DateTime(1984, 11, 19).rangeTo(DateTime(2020, 1, 1));
      final r2 = DateTime(1984, 11, 19).rangeTo(DateTime(2020, 1, 1));
      expect(r1 == r2, isTrue);

      expect('a'.rangeTo('b'), 'a'.rangeTo('b'));
    });

    test('alphabetical range', () {
      final alphabet = 'a'.rangeTo('z');
      expect('d'.inRange(alphabet), isTrue);
      expect('A'.inRange(alphabet), isFalse);
    });

    test('isEmpty always returns false', () {
      var dateRange = DateTime(2020, 1, 1).rangeTo(DateTime(2020, 1, 1));
      expect(dateRange.contains(DateTime(2020, 1, 1)), isTrue);
      expect(dateRange.contains(DateTime(2020, 1, 2)), isFalse);
      expect(dateRange.start, DateTime(2020, 1, 1));
      expect(dateRange.endInclusive, DateTime(2020, 1, 1));
    });

    test("empty ranges aren't equal for unrelated types", () {
      final intRange = 1.rangeTo(1);
      expect(intRange.isEmpty, isFalse);
      expect(intRange.first, 1);
      expect(intRange.last, 1);
      final dateRange = DateTime(2020, 1, 1).rangeTo(DateTime(2020, 1, 1));

      expect(intRange, isNot(dateRange));
    });

    test('.toString', () {
      expect(DateTime(1984, 11, 19).rangeTo(DateTime(2020, 1, 1)).toString(),
          '1984-11-19 00:00:00.000..2020-01-01 00:00:00.000');
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
      expect(3.rangeTo(7).toIterable().first, 3);
    });

    test('last', () {
      expect(3.rangeTo(6).last, 6);
      expect(3.rangeTo(6).toIterable().last, 6);
      expect(3.rangeTo(6).step(2).last, 5);
      expect(3.rangeTo(6).step(2).toIterable().last, 5);
    });

    test('stepSize', () {
      expect(3.rangeTo(6).stepSize, 1);
      expect(3.rangeTo(6).step(2).stepSize, 2);
    });
  });

  group('IntRange', () {
    group('last', () {
      test(
          'empty means first == endInclusive, '
          'endInclusive and last are equivalent', () {
        expect(IntRange(0, 0).last, 0);
        expect(IntRange(0, 0).endInclusive, 0);
        expect(IntRange(0, 0).toIterable().last, 0);
        expect(IntRange(2, 2).last, 2);
        expect(IntRange(2, 2).endInclusive, 2);
        expect(IntRange(2, 2).toIterable().last, 2);
        expect(IntRange(-4, -4).last, -4);
        expect(IntRange(-4, -4).endInclusive, -4);
        expect(IntRange(-4, -4).toIterable().last, -4);
      });
      test('last returns the endInclusive value', () {
        expect(IntRange(0, 10).last, 10);
        expect(IntRange(0, 10).toIterable().last, 10);
      });
      test('step 2 returns the last value dividable by 2', () {
        expect(IntRange(0, 9, step: 2).last, 8);
        expect(IntRange(0, 9, step: 2).toIterable().last, 8);
      });

      test('lastWhere', () {
        final range = IntRange(0, 9, step: 3);
        bool isEven(it) => it % 2 == 0;
        expect(range.last, 9);
        expect(range.lastWhere(isEven), 6);
      });
    });

    group('first', () {
      test('empty means first == endInclusive, start and first are equivalent',
          () {
        expect(IntRange(0, 0).first, 0);
        expect(IntRange(0, 0).start, 0);
        expect(IntRange(0, 0).toIterable().first, 0);
        expect(IntRange(2, 2).first, 2);
        expect(IntRange(2, 2).start, 2);
        expect(IntRange(2, 2).toIterable().first, 2);
        expect(IntRange(-4, -4).first, -4);
        expect(IntRange(-4, -4).start, -4);
        expect(IntRange(-4, -4).toIterable().first, -4);
      });
      test('first returns the endInclusive value', () {
        expect(IntRange(2, 10).first, 2);
        expect(IntRange(2, 10).toIterable().first, 2);
      });
      test('step 2 returns the first value', () {
        // step 2 doesn't mean first needs to be dividable by 2.
        // It starts stepping at 2
        expect(IntRange(1, 9, step: 2).first, 1);
        expect(IntRange(1, 9, step: 2).toIterable().first, 1);
      });

      test('firstWhere minds the predicate', () {
        final range = IntRange(1, 10, step: 3);
        bool isEven(it) => it % 2 == 0;
        expect(range.first, 1);
        expect(range.firstWhere(isEven), 4);
      });
    });
    test('contains double', () {
      final range = (2).rangeTo(-2);
      expect(range.contains(3.0), isFalse);
      expect(range.contains(2.9), isFalse);
      expect(range.contains(2.1), isFalse);
      expect(range.contains(2.0), isTrue);
      expect(range.contains(1.0), isTrue);
      expect(range.contains(0.5), isFalse);
      expect(range.contains(0.0), isTrue);
      expect(range.contains(-0.5), isFalse);
      expect(range.contains(-1.0), isTrue);
      expect(range.contains(-2.0), isTrue);
      expect(range.contains(-2.1), isFalse);
      expect(range.contains(-2.9), isFalse);
      expect(range.contains(-3.0), isFalse);
    });

    test('contains double downwards', () {
      final range = (-2).rangeTo(2);
      expect(range.contains(-3.0), isFalse);
      expect(range.contains(-2.9), isFalse);
      expect(range.contains(-2.1), isFalse);
      expect(range.contains(-2.0), isTrue);
      expect(range.contains(-1.0), isTrue);
      expect(range.contains(-0.5), isFalse);
      expect(range.contains(0.0), isTrue);
      expect(range.contains(0.5), isFalse);
      expect(range.contains(1.0), isTrue);
      expect(range.contains(2.0), isTrue);
      expect(range.contains(2.1), isFalse);
      expect(range.contains(2.9), isFalse);
      expect(range.contains(3.0), isFalse);
    });

    test('contains double with step', () {
      final range = (-4).rangeTo(4).step(3); // [-4, -1, 2]
      expect(range.contains(-5.0), isFalse);
      expect(range.contains(-4.9), isFalse);
      expect(range.contains(-4.1), isFalse);
      expect(range.contains(-4.0), isTrue);
      expect(range.contains(-3.9), isFalse);
      expect(range.contains(-2.1), isFalse);
      expect(range.contains(-2.0), isFalse);
      expect(range.contains(-1.9), isFalse);
      expect(range.contains(-1.0), isTrue);
      expect(range.contains(-0.9), isFalse);
      expect(range.contains(0.0), isFalse);
      expect(range.contains(1.9), isFalse);
      expect(range.contains(2.0), isTrue);
      expect(range.contains(2.1), isFalse);
      expect(range.contains(3.0), isFalse);
      expect(range.contains(4.0), isFalse);
      expect(range.contains(5.0), isFalse);
    });

    test('contains double with step downwards', () {
      final range = (5).rangeTo(-4).step(3); // [5, 2, -1, -4]
      expect(range.contains(6.0), isFalse);
      expect(range.contains(5.1), isFalse);
      expect(range.contains(5.0), isTrue);
      expect(range.contains(4.9), isFalse);
      expect(range.contains(2.1), isFalse);
      expect(range.contains(2.0), isTrue);
      expect(range.contains(1.9), isFalse);
      expect(range.contains(0.9), isFalse);
      expect(range.contains(0.0), isFalse);
      expect(range.contains(-0.9), isFalse);
      expect(range.contains(-1.0), isTrue);
      expect(range.contains(-1.1), isFalse);
      expect(range.contains(-1.9), isFalse);
      expect(range.contains(-2.0), isFalse);
      expect(range.contains(-2.1), isFalse);
      expect(range.contains(-3.0), isFalse);
      expect(range.contains(-3.9), isFalse);
      expect(range.contains(-4.0), isTrue);
      expect(range.contains(-5.1), isFalse);
      expect(range.contains(-5.0), isFalse);
    });

    test('contains with step', () {
      final range = 10.rangeTo(19).step(2); // [10, 12, 14, 16, 18]

      expect(range.start, 10);
      expect(range.endInclusive, 18);
      expect(range.stepSize, 2);
      expect(range.contains(9), isFalse);
      expect(range.contains(10), isTrue);
      expect(range.contains(11), isFalse);
      expect(range.contains(12), isTrue);
      expect(range.contains(13), isFalse);
      expect(range.contains(14), isTrue);
      expect(range.contains(15), isFalse);
      expect(range.contains(16), isTrue);
      expect(range.contains(17), isFalse);
      expect(range.contains(18), isTrue);
      expect(range.contains(19), isFalse);
      expect(range.contains(20), isFalse);
    });

    test('contains with step downwards and negative', () {
      final range = 2.rangeTo(-10).step(3); // [2, -1, -4, -7, -10]
      expect(range.start, 2);
      expect(range.endInclusive, -10);
      expect(range.stepSize, 3);

      expect(range.contains(3), isFalse);
      expect(range.contains(2), isTrue);
      expect(range.contains(0), isFalse);
      expect(range.contains(-1), isTrue);
      expect(range.contains(-2), isFalse);
      expect(range.contains(-3), isFalse);
      expect(range.contains(-4), isTrue);
      expect(range.contains(-5), isFalse);
      expect(range.contains(-6), isFalse);
      expect(range.contains(-7), isTrue);
      expect(range.contains(-8), isFalse);
      expect(range.contains(-9), isFalse);
      expect(range.contains(-10), isTrue);
      expect(range.contains(-11), isFalse);
    });

    test('inRange()', () {
      expect(5.inRange(0.rangeTo(10)), isTrue);
      expect(10.inRange(0.rangeTo(10)), isTrue);
      expect(0.inRange(0.rangeTo(10)), isTrue);
      expect((-1).inRange(0.rangeTo(10)), isFalse);
      expect(11.inRange(0.rangeTo(10)), isFalse);
    });

    test('between()', () {
      expect(5.between(0, 10), isTrue);
      expect(10.between(0, 10), isTrue);
      expect(0.between(0, 10), isTrue);
      expect((-1).between(0, 10), isFalse);
      expect(11.between(0, 10), isFalse);
    });

    test('toString()', () {
      expect(0.rangeTo(1).toString(), '0..1');
    });
  });
}
