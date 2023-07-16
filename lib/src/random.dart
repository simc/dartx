part of dartx;

final _rand = Random();

extension RandomNextIntRange on Random {
  /// Gets the next random `int` from the random number generator in the specified [range].
  ///
  /// Generates an `int` random value uniformly distributed in the specified [range] :
  /// from `range.first` inclusive to `range.endInclusive` inclusive with `range.stepSize`.
  ///
  /// * [throws] IllegalArgumentException if [range] is empty.
  ///
  /// #### Example :
  ///
  /// ```dart
  /// final rand = Random();
  /// final randomNumber = rand.nextIntRange((-10).rangeTo(10).step(2)));
  /// // print a number from [-10, -8, -6, -4, -2, 0, 2, 4, 6, 8, 10]
  /// ```
  int nextIntRange(IntProgression range) {
    final start = range.start;
    final end = range.endInclusive;
    final step = range.stepSize;

    _checkRangeBounds(start, end);
    return nextInt((end + step - start) ~/ step) * step + start;
  }
}

extension RandomNextDoubleRange on Random {
  /// Gets the next random `double` from the random number generator in the specified range.
  ///
  /// Generates a `double` random value uniformly distributed between the specified [start] (inclusive) and [end] (exclusive) bounds.
  ///
  /// [start] and [end] must be finite otherwise the behavior is unspecified.
  ///
  /// * [throws] IllegalArgumentException if [start] is greater than or equal to [end].
  ///
  /// #### Example :
  ///
  /// ```dart
  /// final rand = Random();
  /// final randomNumber = rand.nextDoubleRange(10, 11);
  /// // a random number in range [10.0..11)
  /// ```
  double nextDoubleRange(double start, double end) {
    _checkRangeBounds(start, end);

    final size = end - start;
    final double r;
    if (size.isInfinite && start.isFinite && end.isFinite) {
      final r1 = nextDouble() * (end / 2 - start / 2);
      r = start + r1 + r1;
    } else {
      r = start + nextDouble() * size;
    }
    return r >= end ? end.roundToDouble() : r;
  }
}

void _checkRangeBounds(num start, num end) =>
    require(end > start, 'Cannot get random in empty range: $start..$end');

extension RandomChoice on Random {
  /// Returns a random element from this list
  ///
  /// #### Example :
  ///
  /// ```dart
  /// final rand = Random();
  /// final randomNumber = rand.choice([1, 2, 3, 4, 5, 6, 7, 8, 9]);
  /// // choice a number from [1, 2, 3, 4, 5, 6, 7, 8, 9]
  /// ```
  T choice<T>(List<T> elements) => elements[nextInt(elements.length)];
}

extension RandomChoices on Random {
  /// Returns a list with the randomly selected element from the specified sequence
  ///
  /// [weights] Optional. a list were you can weigh the possibility for each value. default null
  ///
  /// [length] Optional. an integer defining the length of the returned list
  ///
  /// #### Example :
  ///
  /// ```dart
  /// final rand = Random();
  /// final randomList = rand.choices([1, 2, 3, 4, 5], weights: [100, 1, 1, 1, 100], length: 4);
  /// // create a list like that [1, 5, 5, 1]
  /// ```
  List<T> choices<T>(List<T> elements, {List<int>? weights, int length = 1}) {
    if (weights != null) {
      require(
        weights.length == elements.length,
        'Weights size must be equals to numbers size',
      );
    }
    final randoms = <T>[];

    if (weights != null) {
      final random = _RandomWeight(weights);
      for (var i = 0; i < length; i++) {
        final index = random.pickIndex();
        randoms.add(elements[index]);
      }
    } else {
      for (var i = 0; i < length; i++) {
        randoms.add(elements.choice());
      }
    }
    return randoms;
  }
}

extension IterableChoice<T> on Iterable<T> {
  /// Returns a random element from this [Iterable]
  ///
  /// #### Example :
  ///
  /// ```dart
  /// final randomNumber = [1, 2, 3, 4, 5, 6, 7, 8, 9].choice();
  /// // choice a number from [1, 2, 3, 4, 5, 6, 7, 8, 9]
  /// ```
  T choice([Random? random]) => (random ?? _rand).choice(toList());
}

extension IterableChoices<T> on Iterable<T> {
  /// Returns a list with the randomly selected element from the specified sequence
  ///
  /// [weights] Optional. a list were you can weigh the possibility for each value. default null
  ///
  /// [length] Optional. an integer defining the length of the returned list
  ///
  /// #### Example :
  ///
  /// ```dart
  /// final randomList = [1, 2, 3, 4, 5].choices(weights: [100, 1, 1, 1, 100], length: 4);
  /// // create a list like that [1, 5, 5, 1]
  /// ```
  List<T> choices({Random? random, List<int>? weights, int length = 1}) =>
      (random ?? _rand).choices(toList(), weights: weights, length: length);
}

extension MapChoice<K, V> on Map<K, V> {
  /// Returns a random element from this [Map]
  ///
  /// #### Example :
  ///
  /// ```dart
  /// final randomNumber = <int, String>{1: 'a', 2: 'b', 3: 'c'}.choice();
  /// // choice a number from {1: 'a', 2: 'b', 3: 'c'}
  /// ```
  Pair<K, V> choice([Random? random]) {
    final choice = (random ?? _rand).choice(keys.toList());
    return Pair(choice, this[choice] as V);
  }
}

class _RandomWeight {
  _RandomWeight(List<int> weights) {
    _summedWt = List.filled(weights.length, 0);
    _summedWt[0] = weights[0];

    for (final index in weights.indices) {
      _upBound += weights[index];
      if (index >= 1) {
        _summedWt[index] = weights[index] + _summedWt[index - 1];
      }
    }
  }

  var _summedWt = <int>[];
  var _upBound = 0;

  int pickIndex() {
    // Generate a random index between 1 and upBound (both inclusive)
    final key = _rand.nextInt(_upBound) + 1;

    // Search for the key in the sorted summedWt array
    return _binSearch(key);
  }

  int _binSearch(int key) {
    var lo = 0;
    var hi = _summedWt.length - 1;
    var mid = (lo + (hi - lo) / 2).toInt();

    while (lo < hi) {
      // If the key belongs to the current bucket
      if (_summedWt[mid] == key ||
          _summedWt[mid] > key && mid - 1 >= 0 && _summedWt[mid - 1] < key) {
        break;
      } else if (_summedWt[mid] < key && _summedWt[mid + 1] >= key) {
        mid += 1;
        break;
      } else if (_summedWt[mid] < key) {
        lo = mid + 1;
      } else {
        hi = mid - 1;
      }

      // Compute the new mid
      mid = (lo + (hi - lo) / 2).toInt();
    }
    return mid;
  }
}
