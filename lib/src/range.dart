part of dartx;

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

/// IntRange()
class IntRange extends IterableBase<int> {
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
      completed = true;
      return false;
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
