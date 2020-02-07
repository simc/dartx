part of dartx;

/// Represents a range of values (for example, numbers or characters)
/// with a fixed [start] value and a fixed [endInclusive] value.
abstract class ClosedRange<T extends Comparable<T>> {
  /// The first value in the range.
  T get start;

  /// The last value in the range (inclusive).
  T get endInclusive;

  /// Checks whether the specified [value] belongs to the range, is equal to
  /// [start] or [endInclusive] or lies between them
  bool contains(T value);

  @override
  String toString() => '$start..$endInclusive';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ClosedRange &&
          runtimeType == other.runtimeType &&
          start == other.start &&
          endInclusive == other.endInclusive;

  @override
  int get hashCode => start.hashCode ^ endInclusive.hashCode;
}

/// Represents a range of [Comparable] values such as [String] or [DateTime]
class ComparableRange<T extends Comparable<T>> extends ClosedRange<T> {
  /// Create a range of [Comparable] values such as [String] or [DateTime]
  ///
  /// The order of [first] and [endInclusive] doesn't matter.
  ComparableRange(T first, T endInclusive)
      : _first = first,
        _last = endInclusive,
        assert(() {
          if (first == null) throw ArgumentError("start can't be null");
          if (endInclusive == null) {
            throw ArgumentError("endInclusive can't be null");
          }
          return true;
        }());

  @override
  T get start => _first;

  /// The first element in the range.
  final T _first;

  @override
  T get endInclusive => _last;

  /// The last element in the range.
  final T _last;

  @override
  bool contains(T value) {
    if (start <= endInclusive) {
      return start <= value && value <= endInclusive;
    } else {
      return endInclusive <= value && value <= start;
    }
  }
}

extension ComparableRangeX<T extends Comparable<T>> on T {
  /// Creates a [ComparableRange] from this [Comparable] value
  /// to the specified [that] value.
  ComparableRange<T> rangeTo(T that) => ComparableRange<T>(this, that);
}

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
  ///
  ///
  IntRange rangeTo(int endInclusive) => IntRange(this, endInclusive, step: 1);
}

/// A iterable range between two ints which is iterable with a specific step
/// size
///
/// int doesn't extend Comparable<int>, uses ClosedRange<num> instead.
class IntRange extends IterableBase<int> implements ClosedRange<num> {
  /// Creates a range between two ints ([first], [endInclusive]) which can be
  /// iterated through.
  ///
  /// [step] (optional, defaults to 1) has to be positive even when iterating
  /// downwards.
  IntRange(int first, int endInclusive, {int step = 1})
      : _first = first,
        // can't initialize directly du to naming conflict with step() method
        // ignore: prefer_initializing_formals
        stepSize = step,
        _last = _getProgressionLastElement(first, endInclusive, step),
        assert(() {
          if (first == null) throw ArgumentError("start can't be null");
          if (endInclusive == null) {
            throw ArgumentError("endInclusive can't be null");
          }
          if (step == null) throw ArgumentError("step can't be null");
          return true;
        }());

  /// The first element in the range.
  final int _first;

  /// The last element in the range.
  final int _last;

  /// The step of the range.
  final int stepSize;

  @override
  Iterator<int> get iterator => _IntRangeIterator(_first, _last, stepSize);

  @override
  int get endInclusive => _last;

  @override
  int get start => _first;

  @override
  int get first => _first;

  @override
  int get last => _last;

  @override
  String toString() => '$start..$endInclusive';

  @override
  bool contains(Object element) {
    if (element is! int) return false;
    final value = element as int;
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
      other is IntRange &&
          runtimeType == other.runtimeType &&
          _first == other._first &&
          _last == other._last &&
          stepSize == other.stepSize;

  @override
  int get hashCode => _first.hashCode ^ _last.hashCode ^ stepSize.hashCode;
}

extension IntRangeX on IntRange {
  /// Creates a [IntRange] with a different [stepSize],
  /// keeps first and last value
  IntRange step(int step) => IntRange(_first, _last, step: step);
}

int _getProgressionLastElement(int start, int end, int step) {
  if (step <= 0) {
    throw RangeError.range(step, 1, null);
  }
  if (start >= end) {
    return end;
  } else {
    return end - _differenceModulo(end, start, step);
  }
}

// (a - b) mod c
int _differenceModulo(int a, int b, int c) {
  return _mod(_mod(a, c) - _mod(b, c), c);
}

int _mod(int a, int b) {
  final mod = a % b;
  if (mod >= 0) {
    return mod;
  } else {
    return mod + b;
  }
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
