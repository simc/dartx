// ignore_for_file: prefer_const_constructors

import 'package:dartx/dartx.dart';
import 'package:test/test.dart';

void main() {
  group('MapX', () {
    group('all', () {
      test('all() non-empty map', () {
        final map = {
          1: 'Bulbasaur',
          2: 'Ivysaur',
          3: 'Stegosaur',
        };
        expect(map.all((key, value) => key > 0 && value.contains('aur')), true);
        expect(map.all((key, value) => value == 'Bulbasaur'), false);
        expect(map.all((key, value) => value.isNotEmpty), true);
      });

      test('all() empty map', () {
        final map = {};
        expect(
          map.none((key, value) => key == 1 && value == 'Bulbasaur'),
          true,
        );
        expect(map.none((key, value) => false), true);
      });
    });

    group('any', () {
      test('any() non-empty map', () {
        final map = {
          1: 'Bulbasaur',
          2: 'Ivysaur',
          3: 'Stegosaur',
        };
        expect(map.any((key, value) => value == 'Bulbasaur'), true);
        expect(map.any((key, _) => key == -35), false);
      });

      test('any() empty map', () {
        final map = {};
        expect(
          map.any((key, value) => key == 1 && value == 'Bulbasaur'),
          false,
        );
        expect(map.any((key, value) => true), false);
        expect(map.any((key, value) => false), false);
      });
    });

    group('count', () {
      test('empty', () {
        expect(<String, int>{}.count(), 0);
      });

      test('count elements', () {
        expect({1: 'a', 2: 'b'}.count(), 2);
      });

      test('count even', () {
        final map = {1: 'a', 2: 'b', 3: 'c'};
        expect(map.count((it) => it.key.isEven), 1);
      });
    });

    group('filter', () {
      test('filter', () {
        final pokemon = {
          1: 'Bulbasaur',
          2: 'Ivysaur',
        };
        final filtered = pokemon.filter((entry) => entry.value.startsWith('I'));
        expect(filtered, {2: 'Ivysaur'});
      });
    });

    group('filterKeys', () {
      test('filterKeys', () {
        final pokemon = {
          1: 'Bulbasaur',
          2: 'Ivysaur',
        };
        final filtered = pokemon.filterKeys((k) => k == 2);
        expect(filtered, {2: 'Ivysaur'});
      });
    });

    group('filterValues', () {
      test('filterValues', () {
        final pokemon = {
          1: 'Bulbasaur',
          2: 'Ivysaur',
        };
        final filtered = pokemon.filterValues((v) => v.startsWith('I'));
        expect(filtered, {2: 'Ivysaur'});
      });
    });

    group('filterNot', () {
      test('filterNot', () {
        final pokemon = {
          1: 'Bulbasaur',
          2: 'Ivysaur',
        };
        final filtered =
            pokemon.filterNot((entry) => entry.value.startsWith('I'));
        expect(filtered, {1: 'Bulbasaur'});
      });
    });

    group('getOrElse', () {
      test('get', () {
        final pokemon = {
          1: 'Bulbasaur',
          2: 'Ivysaur',
        };
        expect(pokemon.getOrElse(1, () => 'None'), 'Bulbasaur');
      });
      test('else', () {
        final pokemon = {
          1: 'Bulbasaur',
          2: 'Ivysaur',
        };
        expect(pokemon.getOrElse(10, () => 'None'), 'None');
      });
    });

    group('mapEntries', () {
      test('map entries', () {
        final pokemon = {
          1: 'Bulbasaur',
          2: 'Ivysaur',
        };
        final mapped = pokemon
            .mapEntries((entry) => '${entry.value} ${entry.key}')
            .toList();
        expect(mapped[0], 'Bulbasaur 1');
        expect(mapped[1], 'Ivysaur 2');
        expect(mapped.length, 2);
      });
    });

    group('mapKeys', () {
      test('map keys', () {
        final pokemon = {
          1: 'Bulbasaur',
          2: 'Ivysaur',
        };
        final mapped = pokemon.mapKeys((entry) => entry.key.toString());
        expect(mapped['1'], 'Bulbasaur');
        expect(mapped['2'], 'Ivysaur');
        expect(mapped.length, 2);
      });
    });

    group('mapValues', () {
      test('map values', () {
        final pokemon = {
          1: 'Bulbasaur',
          2: 'Ivysaur',
        };
        final mapped = pokemon.mapValues((entry) => entry.value.toUpperCase());
        expect(mapped[1], 'BULBASAUR');
        expect(mapped[2], 'IVYSAUR');
        expect(mapped.length, 2);
      });
    });

    group('maxBy', () {
      test('gets max value', () {
        final map = {'2': 'Ivysaur', '1': 'Bulbasaur'};
        expect(map.maxBy((it) => int.parse(it.key))!.value, 'Ivysaur');
        expect(map.maxBy((it) => num.parse(it.key))!.value, 'Ivysaur');
      });

      test('empty iterable return null', () {
        final map = <int, String>{};
        expect(map.maxBy((it) => it.key), null);
        // with generic type
        expect(map.maxBy<num>((it) => it.key), null);
      });
    });

    group('maxWith', () {
      int _numKeyComparison(
        MapEntry<num, dynamic> value,
        MapEntry<num, dynamic> other,
      ) {
        return value.key.compareTo(other.key);
      }

      test('gets max value', () {
        final map = {2: 'Ivysaur', 1: 'Bulbasaur'};
        final max = map.maxWith(_numKeyComparison)!;
        expect(max.key, 2);
        expect(max.value, 'Ivysaur');
      });

      test('empty iterable return null', () {
        final map = <int, String>{};
        expect(map.maxWith(_numKeyComparison), null);
      });
    });

    group('minBy', () {
      test('gets min value', () {
        final map = {'2': 'Ivysaur', '1': 'Bulbasaur'};
        expect(map.minBy((it) => int.parse(it.key))!.value, 'Bulbasaur');
        expect(map.minBy((it) => num.parse(it.key))!.value, 'Bulbasaur');
      });

      test('empty iterable return null', () {
        final map = <int, String>{};
        expect(map.minBy((it) => it.key), null);
        // with generic type
        expect(map.minBy<int>((it) => it.key), null);
      });
    });

    group('minWith', () {
      int _numKeyComparison(
        MapEntry<num, dynamic> value,
        MapEntry<num, dynamic> other,
      ) {
        return value.key.compareTo(other.key);
      }

      test('gets min value', () {
        final map = {2: 'Ivysaur', 1: 'Bulbasaur'};
        final min = map.minWith(_numKeyComparison)!;
        expect(min.key, 1);
        expect(min.value, 'Bulbasaur');
      });

      test('empty iterable return null', () {
        final map = <int, String>{};
        expect(map.minWith(_numKeyComparison), null);
      });
    });

    group('orEmpty', () {
      test('null -> empty collection', () {
        const Map<int, String>? map = null;
        expect(map.orEmpty(), isNotNull);
        expect(map.orEmpty(), isA<Map<int, String>>());
        expect(map.orEmpty().isEmpty, isTrue);
        expect(map.orEmpty().length, 0);
      });
      test('collection -> just return the collection', () {
        final pokemon = {
          1: 'Bulbasaur',
          2: 'Ivysaur',
        };
        expect(pokemon.orEmpty(), pokemon);
        expect(identical(pokemon.orEmpty(), pokemon), isTrue);
      });
    });

    group('toList', () {
      test('makes a list which does not share memory', () {
        final map = {
          1: 'Bulbasaur',
          2: 'Ivysaur',
        };
        final list = map.toList();
        expect(list.length, map.length);
        map[3] = 'Venusaur';
        expect(map.length, 3);
        expect(list.length, 2);
      });

      test('make a copy of an empty map', () {
        final map = {};
        final copy = map.toList();
        expect(copy.length, map.length);
      });

      test('make a copy', () {
        final map = {
          1: 'Bulbasaur',
          2: 'Ivysaur',
        };
        final copy = map.toList();
        expect(copy, [const Pair(1, 'Bulbasaur'), const Pair(2, 'Ivysaur')]);
      });
    });

    group('toMap', () {
      test('makes a copy which does not share memory', () {
        final map = {
          1: 'Bulbasaur',
          2: 'Ivysaur',
        };
        final copy = map.toMap();
        expect(copy, map);
        map[3] = 'Venusaur';
        expect(map.length, 3);
        expect(copy.length, 2);
      });

      test('make a copy of an empty map', () {
        final map = {};
        final copy = map.toMap();
        expect(copy, map);
        expect(identical(copy, map), isFalse);
      });
    });

    group('none', () {
      test('none() non-empty map', () {
        final map = {
          1: 'Bulbasaur',
          2: 'Ivysaur',
          3: 'Stegosaur',
        };
        expect(
          map.none((key, value) => key == 1 && value == 'Bulbasaur'),
          false,
        );
        expect(map.none((_, value) => value == 'Random text'), true);
      });

      test('none() empty map', () {
        final map = {};
        expect(
          map.none((key, value) => key == 1 && value == 'Bulbasaur'),
          true,
        );
        expect(map.none((key, value) => false), true);
      });
    });
  });

  group('Pair', () {
    test('can be const', () {
      const a = Pair('a', 'b');
      const b = Pair('a', 'b');
      expect(identical(a, b), isTrue);
    });

    test('returns values put inside', () {
      const pair = Pair('a', 'b');
      expect(pair.first, 'a');
      expect(pair.second, 'b');
    });

    test('equals based on items', () {
      final p1 = Pair('a', 'b');
      final p2 = Pair('a', 'b');
      expect(identical(p1, p2), isFalse);
      expect(p1, p2);

      expect(Pair('a', 'b').hashCode, Pair('a', 'b').hashCode);
      expect(Pair('a', 'b'), isNot(equals(Pair('a', 'c'))));
      expect(
        Pair('a', 'b').hashCode,
        isNot(equals(Pair('a', 'c').hashCode)),
      );
      expect(Pair('a', 'b'), isNot(equals(Pair('c', 'b'))));
      expect(
        Pair('a', 'b').hashCode,
        isNot(equals(Pair('c', 'b').hashCode)),
      );

      expect(Pair(null, null), Pair(null, null));
      expect(Pair(null, null).hashCode, Pair(null, null).hashCode);
    });

    test('toString', () {
      expect(const Pair('a', 'b').toString(), '(a, b)');
      expect(const Pair(null, null).toString(), '(null, null)');
    });

    test('construct pair with T1.to(T2)', () {
      const Pair<String, int> pair = Pair('foo', 42);
      expect(pair.first, 'foo');
      expect(pair.second, 42);
    });

    test('toList', () {
      const pair = Pair('a', 'b');
      expect(pair.toList(), ['a', 'b']);
    });
  });
}
