import 'dart:async';
import 'dart:collection';
import 'dart:math';

import 'package:dartx/dartx.dart';
import 'package:fake_async/fake_async.dart';
import 'package:test/test.dart';

void main() {
  group('IterableX', () {
    group('.second', () {
      test('returns second element', () {
        expect([1, 2, 3, 4].second, 2);
      });

      test('throws RangeError if there is no second element', () {
        expect(() => [1].second, throwsRangeError);
      });
    });

    group('.third', () {
      test('returns third element', () {
        expect([1, 2, 3, 4].third, 3);
      });

      test('throws RangeError if there is no third element', () {
        expect(() => [1, 2].third, throwsRangeError);
      });
    });

    group('.fourth', () {
      test('returns fourth element', () {
        expect([1, 2, 3, 4].fourth, 4);
      });

      test('throws RangeError if there is no fourth element', () {
        expect(() => [1, 2, 3].fourth, throwsRangeError);
      });
    });

    test('.elementAtOrNull()', () {
      expect([1, 2, 3].elementAtOrNull(-1), null);
      expect([1, 2, 3].elementAtOrNull(0), 1);
      expect([1, 2, 3].elementAtOrNull(1), 2);
      expect([1, 2, 3].elementAtOrNull(2), 3);
      expect([1, 2, 3].elementAtOrNull(3), null);
    });

    test('.elementAtOrDefault()', () {
      expect([1, 2, 3].elementAtOrDefault(-1, 999), 999);
      expect([1, 2, 3].elementAtOrDefault(0, 999), 1);
      expect([1, 2, 3].elementAtOrDefault(1, 999), 2);
      expect([1, 2, 3].elementAtOrDefault(2, 999), 3);
      expect([1, 2, 3].elementAtOrDefault(3, 999), 999);
    });

    test('.elementAtOrElse()', () {
      expect([1, 2, 3].elementAtOrElse(-1, (i) => i), -1);
      expect([1, 2, 3].elementAtOrElse(0, (i) => i), 1);
      expect([1, 2, 3].elementAtOrElse(1, (i) => i), 2);
      expect([1, 2, 3].elementAtOrElse(2, (i) => i), 3);
      expect([1, 2, 3].elementAtOrElse(3, (i) => i), 3);
    });

    test('.firstOrNull', () {
      expect([1, 2, 3].firstOrNull, 1);
      expect([].firstOrNull, null);
    });

    test('.firstOrDefault()', () {
      expect([1, 2, 3].firstOrDefault(999), 1);
      expect([].firstOrDefault(999), 999);
    });

    test('.firstOrNullWhere()', () {
      expect([1, 2, 3, 4, 5].firstOrNullWhere((e) => e < 6), 1);
      expect([1, 2, 3, 4, 5].firstOrNullWhere((e) => e > 3), 4);
      expect([1, 2, 3, 4, 5].firstOrNullWhere((e) => e > 5), null);
      expect([].firstOrNullWhere((e) => true), null);
    });

    test('.lastOrNull', () {
      expect([1, 2, 3].lastOrNull, 3);
      expect([].lastOrNull, null);
    });

    test('.lastOrElse()', () {
      expect([1, 2, 3].lastOrElse(999), 3);
      expect([].lastOrElse(999), 999);
    });

    test('.lastOrNullWhere()', () {
      expect([1, 2, 3, 4, 5].lastOrNullWhere((e) => e < 6), 5);
      expect([1, 2, 3, 4, 5].lastOrNullWhere((e) => e < 3), 2);
      expect([1, 2, 3, 4, 5].lastOrNullWhere((e) => e > 5), null);
      expect([].lastOrNullWhere((e) => true), null);
    });

    test('.requireNoNulls()', () {
      [].requireNoNulls();
      [1, 2, 3].requireNoNulls();
      expect(() => [1, 2, null, 3].requireNoNulls(), throwsStateError);
    });

    test('.all()', () {
      expect([1, 2, 3].all((e) => e != 4), true);
      expect([1, 2, 3].all((e) => e != 3), false);
      expect([1, 2, 3].all((e) => e == 2), false);
      expect([1, 2, 3].all((e) => true), true);
      expect([].all((e) => false), true);
    });

    test('.none()', () {
      expect([1, 2, 3].none((e) => e == 4), true);
      expect([1, 2, 3].none((e) => e == 3), false);
      expect([1, 2, 3].none((e) => e != 2), false);
      expect([1, 2, 3].none((e) => true), false);
      expect([].all((e) => true), true);
    });

    group('.slice()', () {
      var elements = const [0, 1, 2, 3, 4, 5, 6];
      test('index in range', () {
        expect(elements.slice(0), elements);
        expect(elements.slice(4), [4, 5, 6]);
        expect(elements.slice(4, 6), [4, 5, 6]);
        expect(elements.slice(2, 5), [2, 3, 4, 5]);
        expect(elements.slice(-1), [6]);
        expect(elements.slice(-4), [3, 4, 5, 6]);
        expect(elements.slice(-4, 5), [3, 4, 5]);
        expect(elements.slice(-4, 3), [3]);
        expect(elements.slice(-5, -2), [2, 3, 4, 5]);
        expect(elements.slice(-5, -5), [2]);
        expect(elements.slice(3, -2), [3, 4, 5]);
        expect(elements.slice(3, -4), [3]);
      });

      test('index out of range', () {
        expect(() => [].slice(0), throwsRangeError);
        expect(() => [].slice(0, 2), throwsRangeError);
        expect(() => [].slice(-1), throwsRangeError);
        expect(() => [].slice(0, -5), throwsRangeError);
        expect(() => elements.slice(7), throwsRangeError);
        expect(() => elements.slice(-8), throwsRangeError);
        expect(() => elements.slice(0, 7), throwsRangeError);
        expect(() => elements.slice(-2, 4), throwsRangeError);
        expect(() => elements.slice(3, 1), throwsRangeError);
      });
    });

    test('.forEachIndexed()', () {
      var index = 0;
      [6, 5, 4, 3, 2, 1, 0].forEachIndexed((it, i) {
        expect(it, 6 - index);
        expect(i, index);
        index++;
      });
    });

    test('.containsAll()', () {
      var list1 = const ['test', 'test', 'tes', 't'];
      var list2 = const ['test', 't', 'test', 'tes'];

      expect(['a', ...list1].containsAll(list2.toList()), true);
      expect(list1.containsAll(['a', ...list2]), false);
      expect(list1.contentEquals(list1), true);
    });

    test('.containsAny()', () {
      var list1 = const [1, 2, 3, 4, 5];
      var list2 = const [1, 3, 6];

      expect(list1.containsAny(list2), true);
      expect(list2.containsAny([2, 4, 7]), false);
    });

    test('.contentEquals()', () {
      var list1 = const ['test', 'test', 'tom', 'true'];
      var list2 = const ['test', 't', 'te', 'tes'];
      var list3 = const [0, 1, 2, 3, 4, 5];
      var list4 = const [0, 1, 2, 3, 4, 5, 6];

      expect(list1.contentEquals(list2.toList()), false);
      expect(list1.contentEquals(list2), false);
      var compare = (e1, e2) => e1.codeUnitAt(0) == e2.codeUnitAt(0);
      expect(list1.contentEquals(list2, compare), true);
      expect(list3.contentEquals(list4), false);
      expect(list4.contentEquals(list3), false);
    });

    test('.sorted()', () {
      expect([].sorted(), []);
      expect([6, 3, 2, 4, 5, 1, 0].sorted(), [0, 1, 2, 3, 4, 5, 6]);
    });

    test('.sortedDescending()', () {
      expect([].sortedDescending(), []);
      expect([6, 3, 2, 4, 5, 1, 0].sortedDescending(), [6, 5, 4, 3, 2, 1, 0]);
    });

    test('.sortedBy()', () {
      expect([].sortedBy((it) => 1), []);
      expect(['this', 'is', 'a', 'abcde'].sortedBy((it) => it.length),
          ['a', 'is', 'this', 'abcde']);
    });

    test('.sortedWith()', () {
      expect([].sortedWith((a, b) => 0), []);
      expect(
          ['this', 'is', 'a', 'abcde']
              .sortedWith((a, b) => a.length.compareTo(b.length)),
          ['a', 'is', 'this', 'abcde']);
    });

    test('.sortedByDescending()', () {
      expect([].sortedByDescending((it) => 1), []);
      expect(['this', 'is', 'a', 'abcde'].sortedByDescending((it) => it.length),
          ['abcde', 'this', 'is', 'a']);
    });

    test('.joinToString()', () {
      expect([].joinToString(), '');
      expect([0, 1, 2, 3, 4].joinToString(), '0, 1, 2, 3, 4');
      expect([0, 1, 2, 3, 4].joinToString(separator: '-'), '0-1-2-3-4');
      expect([0, 1, 2].joinToString(prefix: 'pre'), 'pre0, pre1, pre2');
      expect([0, 1, 2].joinToString(postfix: 'post'), '0post, 1post, 2post');
      expect(
        [0, 1, 2, 3, 4].joinToString(transform: (it) => (it * 2).toString()),
        '0, 2, 4, 6, 8',
      );
      expect([0, 1, 2, 3, 4].joinToString(limit: 3), '0, 1, 2...');
      expect(
        [0, 1, 2, 3, 4].joinToString(limit: 4, truncated: ' etc.'),
        '0, 1, 2, 3 etc.',
      );
    });

    test('.sumBy()', () {
      expect([].sumBy((it) => 0.0), 0);
      expect(['t', 'te', 'tes'].sumBy((it) => it.length), 6);
      expect(['t', null, '', 'tes', null].sumBy((it) => it?.length), 4);
    });

    test('.averageBy()', () {
      expect(() => [].averageBy((it) => 0.0), throwsStateError);
      expect(['t', 'te', 'tes'].averageBy((it) => it.length), 2.0);
      expect(['te', null, 'test'].averageBy((it) => it?.length), 2.0);
    });

    test('.min()', () {
      expect([].min(), null);
      expect([3].min(), 3);
      expect([0, 1, 2, 3, 4, 5, 6].min(), 0);
    });

    test('.max()', () {
      expect([].max(), null);
      expect([3].max(), 3);
      expect([0, 1, 2, 3, 4, 5, 6].max(), 6);
    });

    test('.minBy()', () {
      expect([].minBy((it) => 0), null);
      expect(['test'].minBy((it) => it.length), 'test');
      expect(['t', 'te', 'tes'].minBy((it) => it.length), 't');
    });

    test('.maxBy()', () {
      expect([].maxBy((it) => 0), null);
      expect(['test'].maxBy((it) => it.length), 'test');
      expect(['t', 'te', 'tes'].maxBy((it) => it.length), 'tes');
    });

    test('.minWith()', () {
      expect([].minWith((e1, e2) => 0), null);
      expect(
        ['abc'].minWith((e1, e2) {
          return e1.codeUnitAt(1).compareTo(e2.codeUnitAt(1));
        }),
        'abc',
      );
      expect(
        ['xd', 'qb', 'mc', 'pa', 're'].minWith((e1, e2) {
          return e1.codeUnitAt(1).compareTo(e2.codeUnitAt(1));
        }),
        'pa',
      );
    });

    test('.maxWith()', () {
      expect([].maxWith((e1, e2) => 0), null);
      expect(
        ['abc'].maxWith((e1, e2) {
          return e1.codeUnitAt(1).compareTo(e2.codeUnitAt(1));
        }),
        'abc',
      );
      expect(
        ['xd', 'qb', 'mc', 'pa', 're'].maxWith((e1, e2) {
          return e1.codeUnitAt(1).compareTo(e2.codeUnitAt(1));
        }),
        're',
      );
    });

    test('.count()', () {
      expect([].count(), 0);
      expect([].count((it) => true), 0);
      expect(['t', 'te', 'tes'].count(), 3);
      expect(['t', 'te', 'tes'].count((it) => it.length > 1), 2);
    });

    group('.reversed', () {
      test('List', () {
        expect([].reversed, []);
        expect(['t', 'te', 'tes'].reversed, ['t', 'te', 'tes'].reversed);
      });

      test('Iterable', () {
        expect([].toIterable().reversed, []);
        var iterable = ['t', 'te', 'tes'].toIterable();
        expect(iterable.reversed, ['t', 'te', 'tes'].reversed);
      });
    });

    test('.takeFirst()', () {
      expect([].takeFirst(0), []);
      expect([1, 2, 3].takeFirst(0), []);
      expect([1, 2, 3].takeFirst(2), [1, 2]);
    });

    test('.takeLast()', () {
      expect([].takeLast(0), []);
      expect([1, 2, 3].takeLast(0), []);
      expect([1, 2, 3].takeLast(2), [2, 3]);
    });

    test('.firstWhile()', () {
      expect([].firstWhile((e) => true), []);
      expect([1, 2, 3].firstWhile((e) => false), []);
      expect([1, 2, 3].firstWhile((e) => e < 3), [1, 2]);
      expect([1, 2, 3].firstWhile((e) => true), [1, 2, 3]);
    });

    test('.lastWhile()', () {
      expect([].lastWhile((e) => true), []);
      expect([1, 2, 3].lastWhile((e) => false), []);
      expect([1, 2, 3].lastWhile((e) => e > 1), [2, 3]);
      expect([1, 2, 3].lastWhile((e) => true), [1, 2, 3]);
    });

    test('.filterIndexed()', () {
      var result = [6, 5, 4, 3, 2, 1, 0].filter((it) => it % 2 == 0);
      expect(result, [6, 4, 2, 0]);
    });

    test('.filterIndexed()', () {
      var index = 0;
      var result = [6, 5, 4, 3, 2, 1, 0].filterIndexed((it, i) {
        expect(it, 6 - index);
        expect(i, index);
        index++;
        return i > 3;
      });
      expect(result, [2, 1, 0]);
    });

    test('.filterTo()', () {
      var list = <int>[];
      [1, 2, 3, 4, 3, 2, 1].filterTo(list, (e) => e % 2 == 0);
      expect(list, [2, 4, 2]);
    });

    test('.filterToIndexed()', () {
      var index = 0;
      var list = <int>[];
      [1, 2, 3, 4, 3, 2, 1].filterIndexedTo(list, (e, i) {
        expect(index++, i);
        return e % 2 == 0;
      });
      expect(list, [2, 4, 2]);
    });

    test('.filterNot()', () {
      expect([1, 2, 3, 4, 3, 2, 1].filterNot((e) => e % 2 == 0), [1, 3, 3, 1]);
    });

    test('.filterNotIndexed()', () {
      var index = 0;
      expect(
        [1, 2, 3, 4, 3, 2, 1].filterNotIndexed((e, i) {
          expect(index++, i);
          return e % 2 == 0;
        }),
        [1, 3, 3, 1],
      );
    });

    test('.filterNotTo()', () {
      var list = <int>[];
      [1, 2, 3, 4, 3, 2, 1].filterNotTo(list, (e) => e % 2 == 0);
      expect(list, [1, 3, 3, 1]);
    });

    test('.filterToIndexed()', () {
      var index = 0;
      var list = <int>[];
      [1, 2, 3, 4, 3, 2, 1].filterNotToIndexed(list, (e, i) {
        expect(index++, i);
        return e % 2 == 0;
      });
      expect(list, [1, 3, 3, 1]);
    });

    test('.filterNotNull()', () {
      expect([0, null, 1, null, null, 2].filterNotNull(), [0, 1, 2]);
    });

    test('.whereIndexed()', () {
      var index = 0;
      var result = [6, 5, 4, 3, 2, 1, 0].whereIndexed((it, i) {
        expect(it, 6 - index);
        expect(i, index);
        index++;
        return i > 3;
      });
      expect(result, [2, 1, 0]);
    });

    test('.whereTo()', () {
      var list = <int>[];
      [1, 2, 3, 4, 3, 2, 1].whereTo(list, (e) => e % 2 == 0);
      expect(list, [2, 4, 2]);
    });

    test('.whereToIndexed()', () {
      var index = 0;
      var list = <int>[];
      [1, 2, 3, 4, 3, 2, 1].whereIndexedTo(list, (e, i) {
        expect(index++, i);
        return e % 2 == 0;
      });
      expect(list, [2, 4, 2]);
    });

    test('.whereNot()', () {
      expect([1, 2, 3, 4, 3, 2, 1].whereNot((e) => e % 2 == 0), [1, 3, 3, 1]);
    });

    test('.whereNotIndexed()', () {
      var index = 0;
      expect(
        [1, 2, 3, 4, 3, 2, 1].whereNotIndexed((e, i) {
          expect(index++, i);
          return e % 2 == 0;
        }),
        [1, 3, 3, 1],
      );
    });

    test('.whereNotTo()', () {
      var list = <int>[];
      [1, 2, 3, 4, 3, 2, 1].whereNotTo(list, (e) => e % 2 == 0);
      expect(list, [1, 3, 3, 1]);
    });

    test('.whereToIndexed()', () {
      var index = 0;
      var list = <int>[];
      [1, 2, 3, 4, 3, 2, 1].whereNotToIndexed(list, (e, i) {
        expect(index++, i);
        return e % 2 == 0;
      });
      expect(list, [1, 3, 3, 1]);
    });

    test('.whereNotNull()', () {
      expect([0, null, 1, null, null, 2].whereNotNull(), [0, 1, 2]);
    });

    test('.mapNotNull()', () {
      expect([].mapNotNull((it) => 1), []);
      expect([1, 2, 3, 4].mapNotNull((it) => null), []);
      expect(
          [1, 2, 3, 4].mapNotNull((it) => it % 2 == 0 ? it * 2 : null), [4, 8]);
    });

    test('.mapIndexed()', () {
      expect([].mapIndexed((index, it) => 1), []);
      expect([1, 2, 3, 4].mapIndexed((index, it) => null),
          [null, null, null, null]);
      expect([5, 4, null, 2].mapIndexed((index, it) => index), [0, 1, 2, 3]);
      expect(
          [1, 2, 3, 4].mapIndexed((index, it) => it % 2 == 0 ? it * 2 : null),
          [null, 4, null, 8]);
    });

    test('.mapIndexedNotNull()', () {
      expect([].mapIndexedNotNull((index, it) => 1), []);
      expect([1, 2, 3, 4].mapIndexedNotNull((index, it) => null), []);
      expect([5, 4, null, 2].mapIndexedNotNull((index, it) => index),
          [0, 1, 2, 3]);
      expect(
          [1, 2, 3, 4]
              .mapIndexedNotNull((index, it) => it % 2 == 0 ? it * 2 : null),
          [4, 8]);
    });

    test('.onEach()', () {
      expect([].onEach((it) => 1), []);
      expect(
        [
          [1],
          [2],
          [3]
        ].onEach((it) => it.add(it.first)),
        [
          [1, 1],
          [2, 2],
          [3, 3]
        ],
      );
    });

    test('.distinct()', () {
      expect([].distinct(), []);
      var list = ['h', 'hi', 'h', 'test', 'hi', 'test', 'hi', 'h', 'hello'];
      expect(list.distinct(), ['h', 'hi', 'test', 'hello']);
    });

    test('.distinctBy()', () {
      expect([].distinctBy((it) => 1), []);
      var list = ['oh', 'hi', 'oh', 'test1', 'hi', 'test1', 'hi', 'hello'];
      expect(list.distinctBy((it) => it.length), ['oh', 'test1']);
    });

    test('.chunked()', () {
      var list = List.generate(50, (i) => i);
      expect(() => list.chunked(0), throwsArgumentError);
      expect([].chunked(1), <List<int>>[]);
      expect(list.chunked(1), list.map((it) => [it]));

      expect(list.chunked(10).length, 5);
      expect(list.chunked(10).elementAt(3),
          [30, 31, 32, 33, 34, 35, 36, 37, 38, 39]);

      expect(list.chunked(11).length, 5);
      expect(list.chunked(11).elementAt(4), [44, 45, 46, 47, 48, 49]);

      expect(list.chunked(60), [list]);
    });

    group('.chunkWhile()', () {
      test('regular list', () {
        var list = [1, 1, 1, 2, 2, 3, 4, 4];
        expect(list.chunkWhile((a, b) => a == b), [
          [1, 1, 1],
          [2, 2],
          [3],
          [4, 4],
        ]);
      });

      test('size 1', () {
        expect(
          [1].chunkWhile((a, b) => fail('Should not call predicate')),
          [
            [1]
          ],
        );
      });
    });

    test('.splitWhen()', () {
      var list = [1, 1, 1, 2, 2, 3, 4, 4];
      expect(list.splitWhen((a, b) => a != b), [
        [1, 1, 1],
        [2, 2],
        [3],
        [4, 4],
      ]);
    });

    group('.windowed()', () {
      test('size 1', () {
        expect([].windowed(1), []);
        expect([0, 1, 2, 3, 4, 5].windowed(1), [
          [0],
          [1],
          [2],
          [3],
          [4],
          [5]
        ]);
      });

      test('size 4', () {
        var result = [0, 1, 2, 3, 4, 5].windowed(4);
        expect(result, [
          [0, 1, 2, 3],
          [1, 2, 3, 4],
          [2, 3, 4, 5]
        ]);
      });

      test('partialWindows', () {
        var result = [0, 1, 2, 3, 4, 5].windowed(4, partialWindows: true);
        expect(result, [
          [0, 1, 2, 3],
          [1, 2, 3, 4],
          [2, 3, 4, 5],
          [3, 4, 5],
          [4, 5],
          [5]
        ]);
      });

      test('steps', () {
        var result = [0, 1, 2, 3, 4, 5].windowed(3, step: 2);
        expect(result, [
          [0, 1, 2],
          [2, 3, 4]
        ]);
      });

      test('steps & partialWindows', () {
        var result =
            [0, 1, 2, 3, 4, 5].windowed(3, step: 2, partialWindows: true);
        expect(result, [
          [0, 1, 2],
          [2, 3, 4],
          [4, 5]
        ]);
      });
    });

    test('.flatMap()', () {
      expect([].flatMap((it) => <int>[]), []);
      expect(
        [0, 1, 2].flatMap((it) => [it, it, it]),
        [0, 0, 0, 1, 1, 1, 2, 2, 2],
      );
    });

    group('.asStream()', () {
      test('.asStream()', () {
        expect([0, 1, 2, 3, 4, 5].asStream(), emitsInOrder([0, 1, 2, 3, 4, 5]));
        expect([100, 99, 98, 95].asStream(), emitsInOrder([100, 99, 98, 95]));
      });

      test('.asStreamAwaited()', () {
        fakeAsync((async) {
          final futures = [
            Future.delayed(Duration(seconds: 1)).then((_) => 0),
            Future.delayed(Duration(seconds: 2)).then((_) => 1),
            Future.delayed(Duration(seconds: 100)).then((_) => 42),
            Future.delayed(Duration(seconds: 3)).then((_) => 3),
          ].asStreamAwaited();

          final received = <int>[];
          futures.listen(received.add);
          async.elapse(Duration(seconds: 3));
          expect(received, [0, 1, 3]);
          async.elapse(Duration(seconds: 100));
          expect(received, [0, 1, 3, 42]);
        });
      });
    });

    group('.flatten()', () {
      test('for iterables of the same type', () {
        // ignore: omit_local_variable_types
        Iterable<Iterable<int>> iterableOfIterables =
            Iterable.generate(3, (index) sync* {
          yield index;
          yield index + 1;
          yield index + 2;
        });
        // ignore: omit_local_variable_types
        Iterable<int> iterable = iterableOfIterables.flatten();
        expect(iterable, [0, 1, 2, 1, 2, 3, 2, 3, 4]);
        expect(iterable, isA<Iterable<int>>());
        expect(iterable.toList(), isA<List<int>>());
      });

      test('dynamic type', () {
        // ignore: omit_local_variable_types
        Iterable<Iterable<dynamic>> iterableOfIterables = () sync* {
          yield [1, 2, 3];
          yield ['a', 'b'];
        }();
        // ignore: omit_local_variable_types
        Iterable<dynamic> iterable = iterableOfIterables.flatten();
        expect(iterable, [1, 2, 3, 'a', 'b']);
        expect(iterable, isA<Iterable<dynamic>>());
      });
    });

    group('.cycle()', () {
      test('with count', () {
        expect(() => [].cycle(3).elementAt(0), throwsRangeError);

        var result = [0, 1, 2].cycle(2);
        expect(result.elementAt(0), 0);
        expect(result.elementAt(1), 1);
        expect(result.elementAt(2), 2);
        expect(result.elementAt(3), 0);
        expect(result.elementAt(4), 1);
        expect(result.elementAt(5), 2);
        expect(() => result.elementAt(6), throwsRangeError);
      });

      test('infinite', () {
        expect(() => [].cycle().elementAt(0), throwsRangeError);

        var result = [0, 1, 2].cycle();
        expect(result.elementAt(0), 0);
        expect(result.elementAt(1), 1);
        expect(result.elementAt(2), 2);
        expect(result.elementAt(3), 0);
        expect(result.elementAt(4), 1);
        expect(result.elementAt(5), 2);
        expect(result.elementAt(30), 0);
        expect(result.elementAt(31), 1);
        expect(result.elementAt(32), 2);
      });
    });

    test('.intersect()', () {
      expect([].intersect([]), []);
      expect([].intersect([3, 4, 5]), []);
      expect([3, 4, 5].intersect([]), []);
      expect([3, 4, 5].intersect([0, 1, 2, 3, 4, 5, 6]), [3, 4, 5]);
      expect([0, 1, 2, 3, 4, 5, 6].intersect([3, 4, 5]), [3, 4, 5]);
      expect([3, 4, 5].intersect([4, 10, 20]), [4]);
    });

    test('.except()', () {
      expect([].except([]), []);
      expect([3, 4, 5].except([]), [3, 4, 5]);
      expect([1, 2, 3, 4, 5, 6].except([3, 4, 5]), [1, 2, 6]);
      expect([3, 4, 5].except([0, 1, 2, 3, 4, 5, 6]), []);
    });

    test('operator-', () {
      expect([0, 1, 2, 3, 4, 5, 6] - [3, 4, 5], [0, 1, 2, 6]);
    });

    test('.exceptElement()', () {
      expect([].exceptElement(5), []);
      expect([0, 1, 2].exceptElement(1), [0, 2]);
      expect([0, 1, 2].exceptElement(4), [0, 1, 2]);
    });

    test('.prepend()', () {
      expect([].prepend([]), []);
      expect([].prepend([]), []);
      expect([].prepend([0, 1, 2]), [0, 1, 2]);
      expect([0, 1, 2].prepend([]), [0, 1, 2]);
      expect([0, 1, 2].prepend([3, 4, 5]), [3, 4, 5, 0, 1, 2]);
      expect([3, 4, 5].prepend([0, 1, 2]), [0, 1, 2, 3, 4, 5]);
    });

    test('.append()', () {
      expect([].append([]), []);
      expect([].append([]), []);
      expect([].append([0, 1, 2]), [0, 1, 2]);
      expect([0, 1, 2].append([]), [0, 1, 2]);
      expect([0, 1, 2].append([3, 4, 5]), [0, 1, 2, 3, 4, 5]);
      expect([3, 4, 5].append([0, 1, 2]), [3, 4, 5, 0, 1, 2]);
    });

    test('operator+', () {
      expect([3, 4, 5] + [0, 1, 2], [3, 4, 5, 0, 1, 2]);
    });

    test('.prependElement()', () {
      expect([].prependElement(2), [2]);
      expect([3, 4, 5].prependElement(2), [2, 3, 4, 5]);
    });

    test('.appendElement()', () {
      expect([].appendElement(6), [6]);
      expect([3, 4, 5].appendElement(6), [3, 4, 5, 6]);
    });

    test('.union()', () {
      expect([].union([]), []);
      expect([].union([3, 4, 5]), [3, 4, 5]);
      expect([3, 4, 5].union([]), [3, 4, 5]);
      expect([3, 4, 5].union([0, 1, 2, 3, 4, 5, 6]), [3, 4, 5, 0, 1, 2, 6]);
      expect([0, 1, 2, 3, 4, 5, 6].union([3, 4, 5]), [0, 1, 2, 3, 4, 5, 6]);
      expect([3, 4, 5].union([4, 10, 20]), [3, 4, 5, 10, 20]);
    });

    group('.zip()', () {
      test('with same types', () {
        expect([].zip([], (e1, e2) => null), []);
        expect(
          [1, 2, 3].zip([2, 4, 6], (e1, int e2) => e1 / e2),
          [0.5, 0.5, 0.5],
        );
        expect(
          [2, 4, 6].zip([1, 2, 3], (e1, int e2) => e1 / e2),
          [2.0, 2.0, 2.0],
        );

        // with type definitions
        expect(
          [1, 2, 3].zip([2, 4, 6], (int e1, int e2) => e1 / e2),
          [0.5, 0.5, 0.5],
        );
      });

      test('with same types and different length', () {
        expect([1, 2, 3].zip([2, 4], (e1, int e2) => e1 / e2), [0.5, 0.5]);
        expect([2, 4].zip([2, 2, 2], (e1, int e2) => e1 / e2), [1.0, 2.0]);
      });

      test('with different types', () {
        final amounts = [2, 3, 4];
        final animals = ['dogs', 'birds', 'cats'];
        expect(
          amounts.zip(animals, (amount, String animal) => '$amount $animal'),
          ['2 dogs', '3 birds', '4 cats'],
        );
      });

      test('with different types and different lengths', () {
        final amounts = [2, 3];
        final animals = ['dogs', 'birds', 'cats'];
        expect(
          amounts.zip(animals, (amount, String animal) => '$amount $animal'),
          ['2 dogs', '3 birds'],
        );
      });
    });

    test('.toIterable()', () {
      expect([].toIterable(), []);
      expect([1, 2, 3].toIterable() == [1, 2, 3], false);
      expect([1, 2, 3].toIterable(), [1, 2, 3]);
    });

    test('.toHashSet()', () {
      expect([].toHashSet(), HashSet<int>());
      expect([1, 2, 3].toHashSet(), HashSet<int>.from([1, 2, 3]));
    });

    test('.toUnmodifiable()', () {
      var result = [1, 2, 3].toUnmodifiable();
      expect(() => result[0] = 2, throwsUnsupportedError);
      expect(() => result.length = 4, throwsUnsupportedError);
      expect(() => result.clear(), throwsUnsupportedError);
    });

    test('.shuffled()', () {
      expect([].shuffled(), []);
      expect(
        [1, 2, 3, 4, 5].shuffled(Random(123)),
        [1, 2, 3, 4, 5].toList()..shuffle(Random(123)),
      );
    });

    test('.associate()', () {
      expect([].associate((it) => MapEntry(0, 0)), <int, int>{});

      expect(
        [1, 2, 3].associate((it) => MapEntry('$it', it)),
        {'1': 1, '2': 2, '3': 3},
      );
    });

    test('.associateBy()', () {
      expect([].associateBy((it) => 0), <int, int>{});

      expect(
        [1, 2, 3].associateBy((it) => '$it'),
        {'1': 1, '2': 2, '3': 3},
      );
    });

    test('.associateWith()', () {
      expect([].associateWith((it) => 0), <int, int>{});

      expect(
        [1, 2, 3].associateWith((it) => '$it'),
        {1: '1', 2: '2', 3: '3'},
      );
    });

    test('groupBy', () {
      expect(
        ['foo', 'bar', 'baz', 'bop', 'qux']
            .groupBy((dynamic string) => string[1]),
        equals({
          'o': ['foo', 'bop'],
          'a': ['bar', 'baz'],
          'u': ['qux']
        }),
      );
    });

    test('.partition()', () {
      expect([].partition((it) => false), <List<int>>[[], []]);
      expect([1, 2, 3, 4, 5, 6].partition((it) => it % 2 == 1), [
        [1, 3, 5],
        [2, 4, 6]
      ]);
    });

    group('cached', () {
      test('does not re-evaluate elements when re-accessed', () {
        var accessCount = 0;
        final iterable = [0, 1, 2].map((e) {
          accessCount++;
          return e;
        }).cached;

        expect(accessCount, 0);
        expect(iterable, [0, 1, 2]);
        expect(accessCount, 3);
        expect(iterable, [0, 1, 2]);
        expect(accessCount, 3);
      });
      test('concurrent access', () {
        var accessCount = 0;
        final iterable = [0, 1, 2].map((e) {
          accessCount++;
          return e;
        }).cached;

        for (final _ in iterable) {
          expect(iterable, [0, 1, 2]);
        }

        expect(accessCount, 3);
      });
      test('partial population', () {
        var accessCount = 0;
        final iterable = [0, 1, 2].map((e) {
          accessCount++;
          return e;
        }).cached;

        for (final item in iterable) {
          if (item == 1) {
            break;
          }
        }

        expect(accessCount, 2);
        expect(iterable, [0, 1, 2]);
        expect(accessCount, 3);
      });
    });
  });
}
