import 'package:test/test.dart';
import 'package:dartx/dartx.dart';

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

    test('.indices', () {
      expect([].indices, []);
      expect([1, 2, 3].indices, [0, 1, 2]);
    });

    test('.drop()', () {
      var list = [1, 2, 3];
      expect(() => list.drop(-1), throwsArgumentError);
      expect(list.drop(0), list);
      expect(list.drop(0) == list, false);
      expect(list.drop(1), [2, 3]);
      expect(list.drop(2), [3]);
      expect(list.drop(3), []);
      expect(list.drop(4), []);
    });

    test('.dropLast()', () {
      var list = [1, 2, 3];
      expect(() => list.dropLast(-1), throwsArgumentError);
      expect(list.dropLast(0), list);
      expect(list.dropLast(0) == list, false);
      expect(list.dropLast(1), [1, 2]);
      expect(list.dropLast(2), [1]);
      expect(list.dropLast(3), []);
      expect(list.dropLast(4), []);
    });
  });
}
