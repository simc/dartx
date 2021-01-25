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
        sum = (sum + current) as T;
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
        var v = current as num;
        sum += v;
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
    if (length == 0) throw StateError('No elements in collection');
    final values = toList()
      ..removeWhere((item) => item == null)
      ..sort();
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

/// Extensions for iterables
extension IterableNumNullX<T extends num?> on Iterable<T> {
  /// Returns the sum of all elements in the collection.
  ///
  /// All elements have to be of type [num] or `null`. `null` elements are not
  /// counted.
  num sum() {
    // There is a bug in the dart lang that neither is int or is int? return
    // true for a generic class with int? at the type.
    num sum = (T is int || T is int? ? 0 : 0.0);
    for (var current in this) {
      if (current != null) {
        sum = (sum + current);
      }
    }
    return sum as num;
  }

  /// Returns the average of all elements in the collection.
  ///
  /// `null` elements are counted as 0. Empty collections throw an error.
  double average() {
    var count = 0;
    num sum = 0;
    for (var current in this) {
      if (current != null) {
        var v = current as num;
        sum += v;
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
    if (length == 0) throw StateError('No elements in collection');
    final List<num> values = List.from(toList()
      ..removeWhere((item) => item == null))
      ..sort();
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
