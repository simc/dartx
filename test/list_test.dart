import 'package:dartx/dartx.dart';
import 'package:test/test.dart';

void main() {
  group('ListX', () {
    test('.firstIndex', () {
      expect([].firstIndex, -1);
      expect([1, 2, 3].firstIndex, 0);
    });

    test('.lastIndex', () {
      expect([].lastIndex, -1);
      expect([1, 2, 3].lastIndex, 2);
    });

    test('.elementAtOrNull()', () {
      expect([1, 2, 3].elementAtOrNull(-1), null);
      expect([1, 2, 3].elementAtOrNull(0), 1);
      expect([1, 2, 3].elementAtOrNull(1), 2);
      expect([1, 2, 3].elementAtOrNull(2), 3);
      expect([1, 2, 3].elementAtOrNull(3), null);
    });

    test('.indices', () {
      expect([].indices, []);
      expect([1, 2, 3].indices, [0, 1, 2]);
    });

    test('.drop()', () {
      final list = [1, 2, 3];
      expect(() => list.drop(-1), throwsArgumentError);
      expect(list.drop(0), list);
      expect(list.drop(0) == list, false);
      expect(list.drop(1), [2, 3]);
      expect(list.drop(2), [3]);
      expect(list.drop(3), []);
      expect(list.drop(4), []);
    });

    test('.dropWhile()', () {
      final list = [1, 2, 3, 4, 5, 6];
      expect([].dropWhile((it) => true), []);
      expect(list.dropWhile((it) => true), []);
      expect(list.dropWhile((it) => false), list);
      expect(list.dropWhile((it) => it < 4), [4, 5, 6]);
    });

    test('.dropLast()', () {
      final list = [1, 2, 3];
      expect(() => list.dropLast(-1), throwsArgumentError);
      expect(list.dropLast(0), list);
      expect(list.dropLast(0) == list, false);
      expect(list.dropLast(1), [1, 2]);
      expect(list.dropLast(2), [1]);
      expect(list.dropLast(3), []);
      expect(list.dropLast(4), []);
    });

    test('.dropLastWhile()', () {
      final list = [1, 2, 3, 4, 5, 6];
      expect([].dropLastWhile((it) => true), []);
      expect(list.dropLastWhile((it) => true), []);
      expect(list.dropLastWhile((it) => false), list);
      expect(list.dropLastWhile((it) => it > 3), [1, 2, 3]);
    });

    test('.swap()', () {
      final list = [1, 2, 3, 4, 5];
      expect(list..swap(0, 0), [1, 2, 3, 4, 5]);
      expect(list..swap(1, 2), [1, 3, 2, 4, 5]);
      expect(() => list.swap(3, 9), throwsA(isA<RangeError>()));
    });

    test('.flatten()', () {
      // ignore: omit_local_variable_types
      final List<List<int>> nestedList = [
        [0, 0, 0],
        [1, 1, 1],
        [2, 2, 2],
      ];

      // ignore: omit_local_variable_types
      final List<int> flatten = nestedList.flatten();
      expect(flatten, [0, 0, 0, 1, 1, 1, 2, 2, 2]);
    });

    test('.move()', () {
      final list = [1, 2, 3];
      expect(list..move(1, 0), [1, 2, 3]);
      expect(list..move(1, 2), [2, 3, 1]);
      expect(list..move(3, 0), [3, 2, 1]);
      expect(() => list..move(3, 3), throwsA(isA<RangeError>()));
    });

    test('.moveAt()', () {
      final list = [1, 2, 3];
      expect(list..moveAt(0, 0), [1, 2, 3]);
      expect(list..moveAt(0, 2), [2, 3, 1]);
      expect(list..moveAt(1, 0), [3, 2, 1]);
      expect(() => list..moveAt(3, 0), throwsA(isA<RangeError>()));
      expect(() => list..moveAt(0, 3), throwsA(isA<RangeError>()));
    });

    test('.moveAll()', () {
      final list = [1, 2, 3];
      expect(
        list..moveAll(1, (element) => element < 3),
        [3, 1, 2],
      );
      expect(
        list..moveAll(1, (element) => element == 2),
        [3, 2, 1],
      );
      expect(
        () => list..moveAll(3, (element) => true),
        throwsA(isA<RangeError>()),
      );
    });

    test('.moveUp()', () {
      final list = [1, 2, 3];
      expect(list.moveUp(0), isFalse);
      expect(list, [1, 2, 3]);
      expect(list.moveUp(1), isFalse);
      expect(list, [1, 2, 3]);
      expect(list.moveUp(2), isTrue);
      expect(list, [2, 1, 3]);
      expect(list.moveUp(3), isTrue);
      expect(list, [2, 3, 1]);
    });

    test('.moveUpAt()', () {
      final list = [1, 2, 3];
      expect(list.moveUpAt(0), isFalse);
      expect(list, [1, 2, 3]);
      expect(list.moveUpAt(1), isTrue);
      expect(list, [2, 1, 3]);
      expect(list.moveUpAt(2), isTrue);
      expect(list, [2, 3, 1]);
      expect(() => list.moveUpAt(3), throwsA(isA<RangeError>()));
    });

    test('.moveDown()', () {
      final list = [1, 2, 3];
      expect(list.moveDown(0), isFalse);
      expect(list, [1, 2, 3]);
      expect(list.moveDown(3), isFalse);
      expect(list, [1, 2, 3]);
      expect(list.moveDown(2), isTrue);
      expect(list, [1, 3, 2]);
      expect(list.moveDown(1), isTrue);
      expect(list, [3, 1, 2]);
    });

    test('.moveDownAt()', () {
      final list = [1, 2, 3];
      expect(list.moveDownAt(2), isFalse);
      expect(list, [1, 2, 3]);
      expect(list.moveDownAt(1), isTrue);
      expect(list, [1, 3, 2]);
      expect(list.moveDownAt(0), isTrue);
      expect(list, [3, 1, 2]);
      expect(() => list.moveDownAt(3), throwsA(isA<RangeError>()));
    });
  });
}
