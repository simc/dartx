import 'package:dartx/dartx.dart';
import 'package:test/test.dart';

class _WrappedInt implements Comparable<_WrappedInt> {
  final int value;

  _WrappedInt(this.value);

  @override
  int compareTo(_WrappedInt other) => value.compareTo(other.value);
}

void main() {
  group('ComparableX', () {
    test('.coerceIn()', () {
      expect(DateTime(1984, 11, 19).coerceIn(DateTime(1984, 11, 1)),
          DateTime(1984, 11, 19));
      expect(
          DateTime(1984, 11, 19).coerceIn(
            DateTime(1984, 11, 1),
            DateTime(1984, 11, 20),
          ),
          DateTime(1984, 11, 19));
      expect(
          DateTime(1984, 10, 28).coerceIn(
            DateTime(1984, 11, 1),
            DateTime(1984, 11, 20),
          ),
          DateTime(1984, 11, 1));
      expect(
          DateTime(1984, 12, 1).coerceIn(
            DateTime(1984, 11, 1),
            DateTime(1984, 11, 20),
          ),
          DateTime(1984, 11, 20));
      expect(() => 10.coerceIn(3, 2), throwsArgumentError);
      expect(
          () => DateTime.now().coerceIn(
                DateTime(1984, 11, 20),
                DateTime(1984, 11, 1),
              ),
          throwsArgumentError);
    });

    test('.coerceAtLeast()', () {
      expect(DateTime(1984, 11, 19).coerceAtLeast(DateTime(1984, 1, 1)),
          DateTime(1984, 11, 19));
      expect(DateTime(1984, 11, 19).coerceAtLeast(DateTime(1984, 11, 20)),
          DateTime(1984, 11, 20));
    });

    test('.coerceAtMost()', () {
      expect(DateTime(1984, 11, 19).coerceAtMost(DateTime(1984, 11, 20)),
          DateTime(1984, 11, 19));
      expect(DateTime(1984, 11, 19).coerceAtMost(DateTime(1984, 11, 1)),
          DateTime(1984, 11, 1));
    });

    test('.between()', () {
      var start = DateTime(1984, 11, 19);
      var end = DateTime(2020, 01, 01);
      expect(DateTime(1984, 11, 19).between(start, end), true);
      expect(DateTime(2019, 11, 19).between(start, end), true);
      expect(DateTime(2020, 01, 01).between(start, end), true);
      expect(DateTime(2020, 01, 02).between(start, end), false);
      expect(DateTime(1984, 11, 18).between(start, end), false);

      // reverse order
      expect(DateTime(1984, 11, 19).between(end, start), true);
      expect(DateTime(2019, 11, 19).between(end, start), true);
      expect(DateTime(2020, 01, 01).between(end, start), true);
      expect(DateTime(2020, 01, 02).between(end, start), false);
      expect(DateTime(1984, 11, 18).between(end, start), false);
    });

    test('.inRange()', () {
      final range = DateTime(1984, 11, 19).rangeTo(DateTime(2020, 1, 1));

      expect(DateTime(1984, 11, 19).inRange(range), true);
      expect(DateTime(2019, 11, 19).inRange(range), true);
      expect(DateTime(2020, 1, 1).inRange(range), true);
      expect(DateTime(2020, 1, 2).inRange(range), false);
      expect(DateTime(1984, 11, 18).inRange(range), false);
    });

    test('comparable extension operators', () {
      final one = _WrappedInt(1);
      final ten = _WrappedInt(10);
      final hundred = _WrappedInt(100);

      expect(one < ten, isTrue);
      expect(one < one, isFalse);

      expect(one <= ten, isTrue);
      expect(ten <= ten, isTrue);
      expect(hundred <= ten, isFalse);

      expect(ten >= ten, isTrue);
      expect(ten >= one, isTrue);
      expect(ten >= hundred, isFalse);

      expect(ten > one, isTrue);
      expect(ten > ten, isFalse);
    });
  });
}
