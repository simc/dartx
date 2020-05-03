part of dartx;

extension NumX<T extends num> on T {
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
    return this;
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
  T coerceAtLeast(T minimumValue) => this < minimumValue ? minimumValue : this;

  /// Ensures that this value is not greater than the specified [maximumValue].
  ///
  /// Return this value if it's less than or equal to the [maximumValue] or the
  /// [maximumValue] otherwise.
  ///
  /// ```dart
  /// print(10.coerceAtMost(5)) // 5
  /// print(10.coerceAtMost(20)) // 10
  /// ```
  T coerceAtMost(T maximumValue) => this > maximumValue ? maximumValue : this;

  /// Returns true if in the [range].
  bool inRange(Range<num> range) => range.contains(this);

  /// Returns true if between [first] and [endInclusive].
  ///
  /// Alias for `first.rangeTo(endInclusive).contains(this)`
  bool between(num first, num endInclusive) =>
      first.rangeTo(endInclusive).contains(this);
}

extension IntX<T extends int> on T {
  /// Converts this value to binary form.
  Uint8List toBytes([Endian endian = Endian.big]) {
    final data = ByteData(8);
    data.setInt64(0, this, endian);
    return data.buffer.asUint8List();
  }
}

extension DoubleX<T extends double> on T {
  /// Converts this value to binary form.
  Uint8List toBytes([Endian endian = Endian.big]) {
    final data = ByteData(8);
    data.setFloat64(0, this, endian);
    return data.buffer.asUint8List();
  }
}
