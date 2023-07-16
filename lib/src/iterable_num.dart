/// Extensions for iterables
extension IterableNumSumExtension<T extends num> on Iterable<T> {
  /// Returns the sum of all elements in the collection.
  T sum() {
    num sum = 0.0;
    for (final current in this) {
      sum += current;
    }
    if (T == int) {
      return sum.toInt() as T;
    } else {
      return sum.toDouble() as T;
    }
  }
}

extension IterableNumAverageExtension<T extends num> on Iterable<T> {
  /// Returns the average of all elements in the collection.
  double average() {
    var count = 0;
    num sum = 0;
    for (final current in this) {
      sum += current;
      count++;
    }

    if (count == 0) {
      throw StateError('No elements in collection');
    } else {
      return sum / count;
    }
  }
}

extension IterableNumMedianExtension<T extends num> on Iterable<T> {
  /// Returns the median of the elements in this collection.
  ///
  /// Empty collections throw an error.
  double median() {
    if (length == 0) throw StateError('No elements in collection');
    final values = toList()..sort();
    final size = values.length;
    if (size.isOdd) {
      return values[(size / 2).floor()].toDouble();
    } else {
      final x = values[(size / 2).floor()];
      final y = values[(size / 2).floor() - 1];
      return (x + y) / 2;
    }
  }
}
