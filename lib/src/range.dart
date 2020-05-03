part of dartx;

/// Represents a range of values (for example, numbers or characters)
/// with a fixed [start] value and a fixed [endInclusive] value.
///
/// T extends `Comparable` and not `Comparable<T>` because `T` is [int] for
/// [IntRange] but [int] implements `Comparable<num>` not `Comparable<int>`.
///
/// [ComparableRange] shows
abstract class Range<T extends Comparable> {
  const Range();

  /// The first value in the range.
  T get start;

  /// The last value in the range (inclusive).
  T get endInclusive;

  /// Checks whether the specified [value] belongs to the range, is equal to
  /// [start] or [endInclusive] or lies between them
  bool contains(T value) {
    if (start.compareTo(endInclusive) <= 0) {
      return start.compareTo(value) <= 0 && value.compareTo(endInclusive) <= 0;
    } else {
      return endInclusive.compareTo(value) <= 0 && value.compareTo(start) <= 0;
    }
  }

  @override
  String toString() => '$start..$endInclusive';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Range &&
          runtimeType == other.runtimeType &&
          start == other.start &&
          endInclusive == other.endInclusive;

  @override
  int get hashCode => start.hashCode ^ endInclusive.hashCode;
}

/// Represents a range of [Comparable] values such as [String] or [DateTime]
///
/// Implementation of [Range] which tightens the type for `T` to
/// `Comparable<T>` for ranges of the same type
class ComparableRange<T extends Comparable<T>> extends Range<T> {
  /// Create a range of [Comparable] values such as [String] or [DateTime]
  ///
  /// The order of [start] and [endInclusive] doesn't matter.
  ComparableRange(this.start, this.endInclusive)
      : assert(() {
          if (start == null) throw ArgumentError("start can't be null");
          if (endInclusive == null) {
            throw ArgumentError("endInclusive can't be null");
          }
          return true;
        }());

  @override
  final T start;

  @override
  final T endInclusive;
}

extension ComparableRangeX<T extends Comparable<T>> on T {
  /// Creates a [Range] from this [Comparable] value
  /// to the specified [endInclusive] value.
  ComparableRange<T> rangeTo(T endInclusive) =>
      ComparableRange<T>(this, endInclusive);
}

/// The equivalent for [double] is [DoubleRangeExtension]
extension IntRangeExtension on int {
  /// Creates a [IntRange] with a step count of 1
  ///
  /// ```
  /// 5.rangeTo(10).forEach(print);
  /// // 5, 6, 7, 8, 9, 10
  /// ```
  ///
  /// IntRanges also work downwards
  /// ```
  /// 10.rangeTo(5).forEach(print);
  /// // 10, 9, 8, 7, 6, 5
  /// ```
  ///
  /// The step size can be customized but is required to be positive
  /// ```
  /// 5.rangeTo(10).step(2).forEach(print);
  /// // 5, 7, 9
  /// 10.rangeTo(5).step(2).forEach(print);
  /// // 10, 8, 6
  /// ```
  IntRange rangeTo(int endInclusive) => IntRange(this, endInclusive);
}

/// Special variant for [double] which implements `Comparable<num>` and
/// therefore doesn't work for the `Comparable<T>.rangeTo(T)` extension
///
/// The equivalent for [int] is [IntRangeExtension]
extension DoubleRangeExtension on double {
  DoubleRange rangeTo(double endInclusive) => DoubleRange(this, endInclusive);
}

class DoubleRange extends Range<double> {
  DoubleRange(this.start, this.endInclusive)
      : assert(() {
          if (start == null) throw ArgumentError("start can't be null");
          if (endInclusive == null) {
            throw ArgumentError("endInclusive can't be null");
          }
          return true;
        }());
  @override
  final double endInclusive;

  @override
  final double start;

  @override
  bool contains(covariant num value) {
    if (start <= endInclusive) {
      return start <= value && value <= endInclusive;
    } else {
      return endInclusive <= value && value <= start;
    }
  }
}

/// A iterable range between two ints which is iterable with a specific step
/// size
///
/// Difference to `ComparableRange<num>` that [IntRange] is also a
/// [IntProgression] and  therefore can be used to iterate over the values
/// in the range.
///
/// A special form of [IntProgression] where [stepSize] is `1` which also acts
/// as [Range] for [int]
class IntRange extends IntProgression implements Range<int> {
  IntRange(int first, int endInclusive) : super(first, endInclusive);

  @override
  bool contains(covariant num value) {
    assert(stepSize == 1);
    if (start <= endInclusive) {
      return start <= value && value <= endInclusive;
    } else {
      return endInclusive <= value && value <= start;
    }
  }
}

class IntProgression extends IterableBase<int> {
  IntProgression(int first, int endInclusive, {int step = 1})
      : assert(() {
          if (first == null) throw ArgumentError("start can't be null");
          if (endInclusive == null) {
            throw ArgumentError("endInclusive can't be null");
          }
          if (step == null) throw ArgumentError("step can't be null");
          return true;
        }()),
        _first = first,
        // can't initialize directly du to naming conflict with step() method
        // ignore: prefer_initializing_formals
        stepSize = step,
        _last = _getProgressionLastElement(first, endInclusive, step);

  @override
  Iterator<int> get iterator => _IntRangeIterator(_first, _last, stepSize);

  /// The first element in the range.
  final int _first;

  /// The last element in the range.
  final int _last;

  /// The step of the range.
  final int stepSize;

  int get endInclusive => _last;

  int get start => _first;

  @override
  int get first => _first;

  @override
  int get last => _last;

  @override
  String toString() => '$start..$endInclusive';

  @override
  // ignore: avoid_renaming_method_parameters
  bool contains(covariant int value) {
    bool inRange;
    if (start <= endInclusive) {
      inRange = start <= value && value <= endInclusive;
    } else {
      inRange = endInclusive <= value && value <= start;
    }
    if (!inRange) return false;
    return _differenceModulo(value, start, stepSize) == 0;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IntProgression &&
          runtimeType == other.runtimeType &&
          _first == other._first &&
          _last == other._last &&
          stepSize == other.stepSize;

  @override
  int get hashCode => _first.hashCode ^ _last.hashCode ^ stepSize.hashCode;

  /// Creates a [IntRange] with a different [stepSize],
  /// keeps first and last value
  IntProgression step(int step) => IntProgression(_first, _last, step: step);
}

int _getProgressionLastElement(int start, int end, int step) {
  if (step <= 0) {
    throw RangeError.range(step, 1, null);
  }
  if (start >= end) {
    return end;
  }
  return end - _differenceModulo(end, start, step);
}

// (a - b) mod c
int _differenceModulo(int a, int b, int c) {
  return _mod(_mod(a, c) - _mod(b, c), c);
}

int _mod(int a, int b) {
  final mod = a % b;
  return mod >= 0 ? mod : mod + b;
}

class _IntRangeIterator extends Iterator<int> {
  _IntRangeIterator(this.first, this.last, this.step);

  final int first;
  final int step;
  final int last;

  @override
  int get current => _current;
  int _current;
  bool completed = false;

  @override
  bool moveNext() {
    if (completed) return false;

    if (first == last) {
      _current = first;
      completed = true;
      return true;
    }

    final now = _current ?? first;
    var next = now;
    if (_current != null) {
      assert(first != last);
      if (first <= last) {
        next += step;
      } else {
        next -= step;
      }
    }
    // exit when beyond end
    if (first <= last) {
      if (next > last) {
        _current = null;
        completed = true;
        return false;
      }
    } else {
      if (next < last) {
        _current = null;
        completed = true;
        return false;
      }
    }

    _current = next;
    return true;
  }
}
