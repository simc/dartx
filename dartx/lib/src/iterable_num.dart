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
  /// All elements must be of type [Comparable].
  /// `null` elements are counted as 0. Empty collections return null.
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
}
