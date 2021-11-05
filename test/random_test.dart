import 'dart:math';

import 'package:dartx/dartx.dart';
import 'package:test/test.dart';

void main() {
  final random = Random();
  final secureRandom = Random.secure();

  group('Random', () {
    test('.nextIntRange() range not empty', () {
      for (var i = 0; i < 100; i++) {
        final randomNumber = random.nextIntRange((-50).rangeTo(50).step(5));
        expect((-50).rangeTo(50).step(5).contains(randomNumber), true);
      }
    });

    test('.nextIntRange() range is empty', () {
      expect(() => random.nextIntRange(10.rangeTo(0)), throwsException);
      expect(() => random.nextIntRange(0.rangeTo(0)), throwsException);
    });

    test('.nextDoubleRange() range not empty', () {
      for (var i = 0; i < 100; i++) {
        final randomNumber = random.nextDoubleRange(10.0, 15.0);
        expect(10.0.rangeTo(15.0).contains(randomNumber), true);
      }
    });

    test('.nextDoubleRange() range is empty', () {
      expect(() => random.nextDoubleRange(10.0, 9.0), throwsException);
      expect(() => random.nextDoubleRange(0.0, 0.0), throwsException);
    });

    test('.choice()', () {
      final list = [1, 3, 51, 2, 6, 2, 5];
      for (var i = 0; i < 100; i++) {
        final randomNumber = random.choice(list);
        expect(list.contains(randomNumber), true);
      }
    });

    test('.choices() without weights', () {
      final list = [1, 3, 51, 2, 6, 2, 5, 8, 36, 85];
      for (var i = 0; i < 100; i++) {
        final randomNumbers = random.choices(list, length: 5);
        expect(randomNumbers.any((element) => list.contains(element)), true);
      }
    });

    test('.choices() with weights', () {
      final list = [6, 32, 41, 52, 3, 7, 9, 2, 6, 0, -5, -74];
      for (var i = 0; i < 100; i++) {
        final randomNumbers = random.choices(
          list,
          weights: [1, 1, 1, 2, 2, 2, 3, 3, 3, 4, 4, 4],
          length: 5,
        );
        expect(randomNumbers.any((element) => list.contains(element)), true);
      }
    });

    test('.choices() with invalid weights', () {
      expect(() => random.choices([1, 2, 3], weights: [1, 5]), throwsException);
    });
  });

  group('Iterable', () {
    test('.choice(Random)', () {
      final list = [1, 3, 51, 2, 6, 2, 5, 8, 36, 0];
      for (var i = 0; i < 100; i++) {
        final randomNumber = list.choice();
        expect(list.contains(randomNumber), true);
      }
    });

    test('.choice(Random.secure())', () {
      final list = [1, 3, 51, 2, 6, 2, 5, 8, 36, 0];
      for (var i = 0; i < 100; i++) {
        final randomNumber = list.choice(secureRandom);
        expect(list.contains(randomNumber), true);
      }
    });

    test('.choices(Random) without weights', () {
      final list = [1, 3, 51, 2, 6, 2, 5, 8, 36, 0];
      for (var i = 0; i < 100; i++) {
        final randomNumbers = list.choices(length: 3);
        expect(randomNumbers.any((element) => list.contains(element)), true);
      }
    });

    test('.choices(Random) with weights', () {
      final list = [1, 2, 3, 4, 5, 6];
      for (var i = 0; i < 100; i++) {
        final randomNumbers =
            list.choices(weights: [1, 1, 2, 1, 7, 1], length: 3);
        expect(randomNumbers.any((element) => list.contains(element)), true);
      }
    });

    test('.choices(Random) with invalid weights', () {
      expect(() => [1, 2, 3].choices(weights: [1, 5]), throwsException);
    });

    test('.choices(Random.secure()) without weights', () {
      final list = [1, 3, 51, 2, 6, 2, 5, 8, 36, 0];
      for (var i = 0; i < 100; i++) {
        final randomNumbers = list.choices(random: secureRandom, length: 3);
        expect(randomNumbers.any((element) => list.contains(element)), true);
      }
    });

    test('.choices(Random.secure()) with weights', () {
      final list = [1, 2, 3, 4, 5, 6];
      for (var i = 0; i < 100; i++) {
        final randomNumbers = list.choices(
          random: secureRandom,
          weights: [1, 1, 2, 1, 7, 1],
          length: 3,
        );
        expect(randomNumbers.any((element) => list.contains(element)), true);
      }
    });

    test('.choices(Random.secure()) with invalid weights', () {
      expect(
        () => [1, 2, 3].choices(random: secureRandom, weights: [1, 5]),
        throwsException,
      );
    });
  });

  group('Map', () {
    test('.choice(Random)', () {
      final map = {1: 'a', 2: 'b', 3: 'c', 4: 'd'};
      for (var i = 0; i < 100; i++) {
        final randomPair = map.choice();
        expect(map.containsKey(randomPair.first), true);
        expect(map.containsValue(randomPair.second), true);
      }
    });

    test('.choice(Random.secure())', () {
      final map = {1: 'a', 2: 'b', 3: 'c', 4: 'd'};
      for (var i = 0; i < 100; i++) {
        final randomPair = map.choice(secureRandom);
        expect(map.containsKey(randomPair.first), true);
        expect(map.containsValue(randomPair.second), true);
      }
    });
  });
}
