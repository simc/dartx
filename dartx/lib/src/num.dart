part of dartx;

extension NumX<T extends num> on T {
  /// Returns a [Duration] equal to this [int] number of microseconds.
  Duration get microseconds {
    return Duration(microseconds: toInt());
  }

  /// Returns a [Duration] equal to this [int] number of milliseconds.
  Duration get milliseconds {
    if (this is int) {
      return Duration(milliseconds: this as int);
    } else {
      var microseconds = this * Duration.microsecondsPerMillisecond;
      return Duration(microseconds: microseconds.toInt());
    }
  }

  /// Returns a [Duration] equal to this [int] number of seconds.
  Duration get seconds {
    if (this is int) {
      return Duration(seconds: this as int);
    } else {
      var microseconds = this * Duration.microsecondsPerSecond;
      return Duration(microseconds: microseconds.toInt());
    }
  }

  /// Returns a [Duration] equal to this [int] number of minutes.
  Duration get minutes {
    if (this is int) {
      return Duration(minutes: this as int);
    } else {
      var microseconds = this * Duration.microsecondsPerMinute;
      return Duration(microseconds: microseconds.toInt());
    }
  }

  /// Returns a [Duration] equal to this [int] number of hours.
  Duration get hours {
    if (this is int) {
      return Duration(hours: this as int);
    } else {
      var microseconds = this * Duration.microsecondsPerHour;
      return Duration(microseconds: microseconds.toInt());
    }
  }

  /// Returns a [Duration] equal to this [int] number of days.
  Duration get days {
    if (this is int) {
      return Duration(days: this as int);
    } else {
      var microseconds = this * Duration.microsecondsPerDay;
      return Duration(microseconds: microseconds.toInt());
    }
  }

  /// Returns a [Duration] equal to this [int] number of weeks.
  Duration get weeks {
    if (this is int) {
      return Duration(days: (this as int) * 7);
    } else {
      var microseconds = this * Duration.microsecondsPerDay;
      return Duration(microseconds: microseconds.toInt() * 7);
    }
  }

  /// Ensures that this value lies in the specified range
  /// [minimumValue]..[maximumValue].
  ///
  /// Return this value if it's in the range, or [minimumValue] if this value
  /// is less than [minimumValue], or [maximumValue] if this value is greater
  /// than [maximumValue].
  ///
  /// ```dart
  /// print(10.coerceIn(1, 100)) // 10
  /// print(0.coerceIn(1, 100)) // 1
  /// print(500.coerceIn(1, 100)) // 100
  /// 10.coerceIn(100, 0) // will fail with ArgumentError
  /// ````
  T coerceIn(T minimumValue, [T maximumValue]) {
    if (maximumValue != null && minimumValue > maximumValue) {
      throw ArgumentError('Cannot coerce value to an empty range: '
          'maximum $maximumValue is less than minimum $minimumValue.');
    }
    if (this < minimumValue) return minimumValue;
    if (maximumValue != null && this > maximumValue) return maximumValue;
    return this as T;
  }

  /// Ensures that this value is not less than the specified [minimumValue].
  ///
  /// Return this value if it's greater than or equal to the [minimumValue]
  /// or the [minimumValue] otherwise.
  ///
  /// ```dart
  /// print(10.coerceAtLeast(5)) // 10
  /// print(10.coerceAtLeast(20)) // 20
  /// ```
  T coerceAtLeast(T minimumValue) =>
      this < minimumValue ? minimumValue : this as T;

  /// Ensures that this value is not greater than the specified [maximumValue].
  ///
  /// Return this value if it's less than or equal to the [maximumValue] or the
  /// [maximumValue] otherwise.
  ///
  /// ```dart
  /// print(10.coerceAtMost(5)) // 5
  /// print(10.coerceAtMost(20)) // 10
  /// ```
  T coerceAtMost(T maximumValue) =>
      this > maximumValue ? maximumValue : this as T;

  /// Converts this value to binary form.
  Uint8List toBytes([Endian endian = Endian.big]) {
    var data = ByteData(8);
    if (this is int) {
      data.setInt64(0, this as int, endian);
    } else if (this is double) {
      data.setFloat64(0, this as double, endian);
    } else {
      throw ArgumentError('Unsupported num type');
    }
    return data.buffer.asUint8List();
  }
}
