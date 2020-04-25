import 'package:dartx/dartx.dart';
import 'package:test/test.dart';

void main() {
  group('DoubleRange', () {
    test('rangeTo with two doubles returns DoubleRange', () {
      expect(4.2.rangeTo(2.2), isA<DoubleRange>());
    });
    test('start', () {
      expect(2.7.rangeTo(4.2).start, 2.7);
      expect(2.7.rangeTo(4.2).start, isA<double>());
    });
    test('endInclusive', () {
      expect(2.7.rangeTo(4.2).endInclusive, 4.2);
      expect(2.7.rangeTo(4.2).endInclusive, isA<double>());
    });
    test('contains double (upwards)', () {
      expect(2.7.rangeTo(4.2).contains(3.0), isTrue);
      expect(2.7.rangeTo(4.2).contains(5.0), isFalse);
    });
    test('contains int (upwards)', () {
      // compiler does the conversion from int to double
      expect(2.7.rangeTo(4.2).contains(3), isTrue);
      expect(2.7.rangeTo(4.2).contains(5), isFalse);

      // makes sure contains accepts num
      expect(2.7.rangeTo(4.2).contains(3.toInt()), isTrue);
      expect(2.7.rangeTo(4.2).contains(5.toInt()), isFalse);
    });
    test('contains double (downwards)', () {
      expect(4.2.rangeTo(2.7).contains(3.1), isTrue);
      expect(4.2.rangeTo(2.7).contains(5.1), isFalse);
    });
    test('contains int (downwards)', () {
      expect(4.2.rangeTo(2.7).contains(3), isTrue);
      expect(4.2.rangeTo(2.7).contains(5), isFalse);
    });
    test('mix with int returns DoubleRange', () {
      expect(4.2.rangeTo(2), isA<DoubleRange>());

      // This is impossible because dart doesn't support overrides
      // expect(4.rangeTo(2.7), isA<DoubleRange>());
    });
    test('toString', () {
      expect(4.2.rangeTo(2.7).toString(), '4.2..2.7');
    });
    test('hashcode equal no matter the order', () {
      expect(4.2.rangeTo(2.7).hashCode, 2.7.rangeTo(4.2).hashCode);
    });
    test('equals same range', () {
      expect(4.2.rangeTo(2.7), 4.2.rangeTo(2.7));
    });
    test('not equals when items swapped', () {
      expect(4.2.rangeTo(2.7), isNot(2.7.rangeTo(4.2)));
    });
    test('start has to be non-null', () {
      try {
        DoubleRange(null, 1.0);
        fail('did not throw');
      } catch (e) {
        expect(
            e,
            isA<ArgumentError>()
                .having((it) => it.message, 'message', 'start can\'t be null'));
      }
    });
    test('endInclusive has to be non-null', () {
      try {
        DoubleRange(1.0, null);
        fail('did not throw');
      } catch (e) {
        expect(
            e,
            isA<ArgumentError>().having(
                (it) => it.message, 'message', 'endInclusive can\'t be null'));
      }
    });
  });

  group('ComparableRange', () {
    test('start', () {
      expect(DateTime(1995).rangeTo(DateTime(2020)).start, DateTime(1995));
      expect(DateTime(1995).rangeTo(DateTime(2020)).start, isA<DateTime>());
    });
    test('endInclusive', () {
      expect(
          DateTime(1995).rangeTo(DateTime(2020)).endInclusive, DateTime(2020));
      expect(
          DateTime(1995).rangeTo(DateTime(2020)).endInclusive, isA<DateTime>());
    });
    test('contains (upwards)', () {
      expect(DateTime(1995).rangeTo(DateTime(2020)).contains(DateTime(2016)),
          isTrue);
      expect(DateTime(1995).rangeTo(DateTime(2020)).contains(DateTime(1988)),
          isFalse);
    });
    test('contains (downwards)', () {
      expect(DateTime(2020).rangeTo(DateTime(1995)).contains(DateTime(2016)),
          isTrue);
      expect(DateTime(2020).rangeTo(DateTime(1995)).contains(DateTime(1988)),
          isFalse);
    });
    test('rangeTo returns ComparableRange<DateTime>', () {
      expect(DateTime(1995).rangeTo(DateTime(2020)),
          isA<ComparableRange<DateTime>>());
    });
    test('hashcode equal no matter the order', () {
      expect(DateTime(1995).rangeTo(DateTime(2020)).hashCode,
          DateTime(2020).rangeTo(DateTime(1995)).hashCode);
    });
    test('equal', () {
      expect(DateTime(1995).rangeTo(DateTime(2020)),
          DateTime(1995).rangeTo(DateTime(2020)));
      expect('a'.rangeTo('b'), 'a'.rangeTo('b'));
    });
    test('not equals when items swapped', () {
      expect(DateTime(1995).rangeTo(DateTime(2020)),
          isNot(DateTime(2020).rangeTo(DateTime(1995))));
    });
    test('toString', () {
      expect(DateTime(1995).rangeTo(DateTime(2020)).toString(),
          '1995-01-01 00:00:00.000..2020-01-01 00:00:00.000');
    });
    test('start has to be non-null', () {
      try {
        ComparableRange(null, DateTime(1));
        fail('did not throw');
      } catch (e) {
        expect(
            e,
            isA<ArgumentError>()
                .having((it) => it.message, 'message', 'start can\'t be null'));
      }
    });
    test('endInclusive has to be non-null', () {
      try {
        ComparableRange(DateTime(1), null);
        fail('did not throw');
      } catch (e) {
        expect(
            e,
            isA<ArgumentError>().having(
                (it) => it.message, 'message', 'endInclusive can\'t be null'));
      }
    });
    test('alphabetical range', () {
      final alphabet = 'a'.rangeTo('z');
      expect(alphabet.contains('a'), isTrue);
      expect(alphabet.contains('b'), isTrue);
      expect(alphabet.contains('y'), isTrue);
      expect(alphabet.contains('z'), isTrue);

      expect(alphabet.contains('A'), isFalse);
      expect(alphabet.contains('B'), isFalse);
      expect(alphabet.contains('Y'), isFalse);
      expect(alphabet.contains('Z'), isFalse);
    });
  });

  group('IntRange', () {
    test('start', () {
      expect(12.rangeTo(17).start, 12);
      expect(12.rangeTo(17).start, isA<int>());
    });
    test('endInclusive', () {
      expect(12.rangeTo(17).endInclusive, 17);
      expect(12.rangeTo(17).endInclusive, isA<int>());
    });
    test('contains double (upwards)', () {
      expect(12.rangeTo(17).contains(13.1), isTrue);
      expect(12.rangeTo(17).contains(18.1), isFalse);
    });
    test('contains int (upwards)', () {
      // compiler does the conversion from int to double
      expect(12.rangeTo(17).contains(13), isTrue);
      expect(12.rangeTo(17).contains(18), isFalse);
    });
    test('contains double (downwards)', () {
      expect(17.rangeTo(12).contains(13.1), isTrue);
      expect(17.rangeTo(12).contains(18.1), isFalse);
    });
    test('contains int (downwards)', () {
      expect(17.rangeTo(12).contains(13), isTrue);
      expect(17.rangeTo(12).contains(18), isFalse);
    });
    test('rangeTo with two ints returns IntRange', () {
      expect(17.rangeTo(12), isA<IntRange>());
    });
    test('hashcode equal no matter the order', () {
      expect(12.rangeTo(17).hashCode, 17.rangeTo(12).hashCode);
    });
    test('not equals when items swapped', () {
      expect(3.rangeTo(9), isNot(9.rangeTo(3)));
    });
    test('equal', () {
      expect(3.rangeTo(9), 3.rangeTo(9));
    });
    test('toString', () {
      expect(3.rangeTo(9).toString(), '3..9');
    });
    test('start has to be non-null', () {
      try {
        IntRange(null, 1);
        fail('did not throw');
      } catch (e) {
        expect(
            e,
            isA<ArgumentError>()
                .having((it) => it.message, 'message', 'start can\'t be null'));
      }
    });
    test('endInclusive has to be non-null', () {
      try {
        IntRange(1, null);
        fail('did not throw');
      } catch (e) {
        expect(
            e,
            isA<ArgumentError>().having(
                (it) => it.message, 'message', 'endInclusive can\'t be null'));
      }
    });
  });

  group('IntProgression', () {
    test('stepSize', () {
      expect(5.rangeTo(10).step(2).stepSize, 2);
    });
    test('upwards', () {
      expect(5.rangeTo(10).toList(), [5, 6, 7, 8, 9, 10]);
    });
    test('downwards', () {
      expect(6.rangeTo(3).toList(), [6, 5, 4, 3]);
    });
    test('never empty, at least emits the start value', () {
      expect(6.rangeTo(6).toList(), [6]);
    });
    test('step upwards', () {
      expect(5.rangeTo(10).step(2).toList(), [5, 7, 9]);
    });
    test('step downwards', () {
      expect(6.rangeTo(3).step(2).toList(), [6, 4]);
    });
    test('step must be positive', () {
      expect(() => 1.rangeTo(10).step(0), throwsA(isA<RangeError>()));
      expect(() => 1.rangeTo(10).step(-2), throwsA(isA<RangeError>()));
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
    test('start has to be non-null', () {
      try {
        IntProgression(null, 1);
        fail('did not throw');
      } catch (e) {
        expect(
            e,
            isA<ArgumentError>()
                .having((it) => it.message, 'message', 'start can\'t be null'));
      }
    });
    test('endInclusive has to be non-null', () {
      try {
        IntProgression(1, null);
        fail('did not throw');
      } catch (e) {
        expect(
            e,
            isA<ArgumentError>().having(
                (it) => it.message, 'message', 'endInclusive can\'t be null'));
      }
    });
    test('endInclusive has to be non-null', () {
      try {
        IntProgression(1, 2, step: null);
        fail('did not throw');
      } catch (e) {
        expect(
            e,
            isA<ArgumentError>()
                .having((it) => it.message, 'message', 'step can\'t be null'));
      }
    });
    group('contains', () {
      test('contains double', () {
        final range = 2.rangeTo(-2);
        expect(range.contains(3.0), isFalse);
        expect(range.contains(2.9), isFalse);
        expect(range.contains(2.1), isFalse);
        expect(range.contains(2.0), isTrue);
        expect(range.contains(1.0), isTrue);
        expect(range.contains(0.5), isTrue);
        expect(range.contains(0.0), isTrue);
        expect(range.contains(-0.5), isTrue);
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
        expect(range.contains(-0.5), isTrue);
        expect(range.contains(0.0), isTrue);
        expect(range.contains(0.5), isTrue);
        expect(range.contains(1.0), isTrue);
        expect(range.contains(2.0), isTrue);
        expect(range.contains(2.1), isFalse);
        expect(range.contains(2.9), isFalse);
        expect(range.contains(3.0), isFalse);
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
    });
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
        expect(IntProgression(0, 9, step: 2).last, 8);
        expect(IntProgression(0, 9, step: 2).toIterable().last, 8);
      });
      test('lastWhere', () {
        final range = IntProgression(0, 9, step: 3);
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
        expect(IntProgression(1, 9, step: 2).first, 1);
        expect(IntProgression(1, 9, step: 2).toIterable().first, 1);
      });
      test('firstWhere minds the predicate', () {
        final range = IntProgression(1, 10, step: 3);
        bool isEven(it) => it % 2 == 0;
        expect(range.first, 1);
        expect(range.firstWhere(isEven), 4);
      });
    });
  });
}
