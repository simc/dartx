part of dartx;

/// Extensions for iterables
extension IterableNumX<T extends num> on Iterable<T> {
  /// Returns the sum of all elements in the collection.
  ///
  /// All elements have to be of type [num] or `null`. `null` elements are not
  /// counted.
  T sum() {
    var sum = (T == int ? 0 : 0.0) as T;
    for (var current in this) {
      if (current != null) {
        sum += current;
      }
    }
    return sum;
  }

  /// Returns the average of all elements in the collection.
  ///
  /// `null` elements are counted as 0. Empty collections throw an error.
  double average() {
    var count = 0;
    num sum = 0;
    for (var current in this) {
      if (current != null) {
        sum += current;
      }
      count++;
    }

    if (count == 0) {
      throw StateError('No elements in collection');
    } else {
      return sum / count;
    }
  }

  /// Returns the median of the elements in this collection.
  ///
  /// Empty collections throw an error.
  /// `null` values are ignored.
  double median() {
    if (isEmpty) throw StateError('No elements in collection');
    final values = whereNotNull().toList()..sort();
    final size = values.length;
    if (size.isOdd) {
      return values[(size / 2).floor()].toDouble();
    } else {
      final x = values[(size / 2).floor()];
      final y = values[(size / 2).floor() - 1];
      return (x + y) / 2;
    }
  }

  /// Returns the "mode" of the elements in this collection, or the element
  /// which appears most often.
  ///
  /// Empty collections throw an error.
  /// `null` values are ignored.
  ///
  /// Collections with multiple modes (or multiple elements tied for the highest
  /// number of occurrences) return one of those modes.
  num mode() {
    if (isEmpty) throw StateError('No elements in collection');
    final values = toList();
    var occurrences = <num, int>{};
    num bestElem;
    for (num value in values) {
      if (value == null) continue;
      bestElem ??= value;
      occurrences[value] ??= 0;
      occurrences[value]++;
      if (occurrences[value] > occurrences[bestElem]) {
        bestElem = value;
      }
    }
    return bestElem;
  }

  /// Returns the variance of this collection. The formula for variance changes
  /// slightly based on whether this collection represents a population
  /// or a sample of a population. By default, this method assumes that this
  /// collection is a sample, but you can tweak that behavior with the [sample]
  /// parameter.
  ///
  /// `null` values are ignored, and empty collections return 0.
  double variance({bool sample = true}) {
    if (isEmpty || length == 1) {
      return 0.0;
    }
    var data = whereNotNull();
    var varianceSum = 0.0;
    var avg = data.average();
    for (var elem in data) {
      varianceSum += pow(elem - avg, 2);
    }
    return varianceSum / (data.length - (sample == true ? 1 : 0));
  }

  /// Returns the standard deviation of this collection. The formula for
  /// standard deviation changes slightly based on whether this collection
  /// represents a population or a sample of a population. By default, this
  /// method assumes that this collection is a sample, but you can tweak that
  /// behavior with the [sample] parameter.
  ///
  /// `null` values are ignored, and empty collections return 0.
  double stdDev({bool sample = true}) {
    return sqrt(variance(sample: sample));
  }
}
