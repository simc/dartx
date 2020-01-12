import 'dart:math' as math;

import 'package:dartx/dartx.dart';
import 'package:test/test.dart';

List<int> get _sortedList => [4, 2, 1, 3].sortedBy((it) => it);

void main() {
  test('sort', () {
    expect([4, 2, 1, 3].sortedBy((it) => it), [1, 2, 3, 4]);
  });
  group('_DelegatingIterable', () {
    test('any', () {
      expect(_sortedList.any((it) => it > 2), isTrue);
    });

    test('cast', () {
      expect(_sortedList.cast<num>(), isA<Iterable<num>>());
    });

    test('contains', () {
      expect(_sortedList.contains(2), isTrue);
      expect(_sortedList.contains(5), isFalse);
    });

    test('elementAt', () {
      expect(_sortedList.elementAt(0), 1);
    });

    test('every', () {
      expect(_sortedList.every((it) => it is num), isTrue);
      expect(_sortedList.every((it) => it is String), isFalse);
    });
    test('expand', () {
      expect(_sortedList.expand((it) => [it, it]), [1, 1, 2, 2, 3, 3, 4, 4]);
    });
    test('first', () {
      expect(_sortedList.first, 1);
    });
    test('firstWhere', () {
      expect(_sortedList.firstWhere((it) => it.isEven), 2);
    });
    test('fold', () {
      expect(_sortedList.fold(0, (a, b) => a + b), 10);
    });
    test('followedBy', () {
      expect(_sortedList.followedBy([2]), [1, 2, 3, 4, 2]);
    });
    test('forEach', () {
      final list = [];
      _sortedList.forEach(list.add);
      expect(list, [1, 2, 3, 4]);
    });
    test('isEmpty', () {
      expect(_sortedList.isEmpty, isFalse);
    });
    test('isNotEmpty', () {
      expect(_sortedList.isNotEmpty, isTrue);
    });
    test('iterator', () {
      expect(_sortedList.iterator, isA<Iterator<int>>());
      var iterator = _sortedList.iterator;
      expect(iterator.moveNext(), isTrue);
      expect(iterator.current, 1);
    });
    test('join', () {
      expect(_sortedList.join(','), '1,2,3,4');
    });
    test('last', () {
      expect(_sortedList.last, 4);
    });
    test('lastWhere', () {
      expect(_sortedList.lastWhere((it) => it < 3), 2);
    });
    test('length', () {
      expect(_sortedList.length, 4);
    });
    test('map', () {
      expect(_sortedList.map((it) => it.isEven), [false, true, false, true]);
    });
    test('reduce', () {
      expect(_sortedList.reduce((a, b) => a + b), 10);
    });
    test('single', () {
      expect(() => _sortedList.single, throwsA(isA<StateError>()));
    });
    test('singleWhere', () {
      expect(_sortedList.singleWhere((it) => it == 3), 3);
    });
    test('skip', () {
      expect(_sortedList.skip(1), [2, 3, 4]);
    });
    test('skipWhile', () {
      expect(_sortedList.skipWhile((it) => it < 3), [3, 4]);
    });
    test('take', () {
      expect(_sortedList.take(2), [1, 2]);
    });
    test('takeWhile', () {
      expect(_sortedList.takeWhile((_) => true), [1, 2, 3, 4]);
    });
    test('toList', () {
      expect(_sortedList.toList(), [1, 2, 3, 4]);
    });
    test('toSet', () {
      expect(_sortedList.toSet(), {1, 2, 3, 4});
    });
    test('where', () {
      expect(_sortedList.where((it) => it % 2 == 0), [2, 4]);
    });
    test('whereType', () {
      expect(_sortedList.whereType<int>(), [1, 2, 3, 4]);
    });
  });
  group('_DelegatingList', () {
    test('operator []', () {
      expect(_sortedList[2], 3);
    });
    test('operator =[]', () {
      final list = _sortedList;
      list[2] = 5;
      expect(list, [1, 2, 5, 4]);
    });
    test('operator +', () {
      expect(_sortedList + [1, 2], [1, 2, 3, 4, 1, 2]);
    });
    test('add', () {
      final list = _sortedList;
      list.add(1);
      expect(list, [1, 2, 3, 4, 1]);
    });
    test('addAll', () {
      final list = _sortedList;
      list.addAll([1, 2]);
      expect(list, [1, 2, 3, 4, 1, 2]);
    });
    test('asMap', () {
      expect(_sortedList.asMap(), {0: 1, 1: 2, 2: 3, 3: 4});
    });
    test('clear', () {
      final list = _sortedList;
      list.clear();
      expect(list, isEmpty);
    });
    test('fillRange', () {
      final list = _sortedList;
      list.fillRange(0, 2, 6);
      expect(list, [6, 6, 3, 4]);
    });
    test('set first', () {
      final list = _sortedList;
      list.first = 6;
      expect(list, [6, 2, 3, 4]);
    });
    test('getRange', () {
      expect(_sortedList.getRange(0, 2), [1, 2]);
    });
    test('indexOf', () {
      expect(_sortedList.indexOf(2), 1);
    });
    test('indexWhere', () {
      expect(_sortedList.indexWhere((it) => it == 2), 1);
    });
    test('insert', () {
      final list = _sortedList;
      list.insert(3, 6);
      expect(list, [1, 2, 3, 6, 4]);
    });
    test('insertAll', () {
      final list = _sortedList;
      list.insertAll(3, [6, 7]);
      expect(list, [1, 2, 3, 6, 7, 4]);
    });
    test('set last', () {
      final list = _sortedList;
      list.last = 5;
      expect(list, [1, 2, 3, 5]);
    });
    test('lastIndexOf', () {
      expect(_sortedList.lastIndexOf(3), 2);
    });
    test('lastIndexWhere', () {
      expect(_sortedList.lastIndexWhere((it) => it == 3), 2);
    });
    test('set length', () {
      final list = _sortedList;
      list.length = 5;
      expect(list, [1, 2, 3, 4, null]);
    });
    test('remove', () {
      final list = _sortedList;
      list.remove(3);
      expect(list, [1, 2, 4]);
    });
    test('removeAt', () {
      final list = _sortedList;
      list.removeAt(2);
      expect(list, [1, 2, 4]);
    });
    test('removeLast', () {
      final list = _sortedList;
      list.removeLast();
      expect(list, [1, 2, 3]);
    });
    test('removeRange', () {
      final list = _sortedList;
      list.removeRange(1, 3);
      expect(list, [1, 4]);
    });
    test('removeWhere', () {
      final list = _sortedList;
      list.removeWhere((it) => it % 2 == 0);
      expect(list, [1, 3]);
    });
    test('replaceRange', () {
      final list = _sortedList;
      list.replaceRange(1, 2, [6, 6]);
      expect(list, [1, 6, 6, 3, 4]);
    });
    test('retainWhere', () {
      final list = _sortedList;
      list.retainWhere((it) => it % 2 == 0);
      expect(list, [2, 4]);
    });
    test('reversed', () {
      expect(_sortedList.reversed, [4, 3, 2, 1]);
    });
    test('setAll', () {
      final list = _sortedList;
      list.setAll(1, [6, 6]);
      expect(list, [1, 6, 6, 4]);
    });
    test('setRange', () {
      final list = _sortedList;
      list.setRange(1, 3, [6, 7]);
      expect(list, [1, 6, 7, 4]);
    });
    test('random', () {
      final r = math.Random(42);
      final list = _sortedList;
      list.shuffle(r);
      expect(list, [2, 3, 1, 4]);
    });
    test('sort', () {
      final list = _sortedList;
      list.sort((a, b) => a - b);
      expect(list, [1, 2, 3, 4]);
    });
    test('sublist', () {
      expect(_sortedList.sublist(1, 2), [2]);
    });

    test('can sort items by 3 comparators', () {
      const itemList = [
        Item(0, 1, 2),
        Item(2, 1, 0),
        Item(1, 2, 0),
      ];

      final sorted = itemList
          .sortedBy((item) => item.a)
          .thenBy((item) => item.b)
          .thenBy((item) => item.c);

      expect(
          sorted.toList(),
          equals(const [
            Item(0, 1, 2),
            Item(1, 2, 0),
            Item(2, 1, 0),
          ]));
    });
  });
}

class Item {
  final int a;
  final int b;
  final int c;

  const Item(this.a, this.b, this.c);

  @override
  String toString() {
    return 'Item{a: $a, b: $b, c: $c}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Item &&
          runtimeType == other.runtimeType &&
          a == other.a &&
          b == other.b &&
          c == other.c;

  @override
  int get hashCode => a.hashCode ^ b.hashCode ^ c.hashCode;
}
