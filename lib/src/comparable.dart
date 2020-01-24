part of dartx;

/// Provides comparison operators for [Comparable] types.
extension ComparableX<T extends Comparable<T>> on T {
  bool operator <(T other) => compareTo(other) < 0;
  bool operator <=(T other) => compareTo(other) <= 0;
  bool operator >(T other) => compareTo(other) > 0;
  bool operator >=(T other) => compareTo(other) >= 0;

  /// Ensures that this value lies in the specified range
  /// [minimumValue]..[maximumValue].
  ///
  /// @return this value if it's in the range, or [minimumValue]
  /// if this value is less than [minimumValue],
  /// or [maximumValue] if this value is greater than [maximumValue].
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
  /// @return this value if it's greater than or equal to the [minimumValue]
  /// or the [minimumValue] otherwise.
  T coerceAtLeast(T minimumValue) =>
      this < minimumValue ? minimumValue : this;

  /// Ensures that this value is not greater than the specified [maximumValue].
  ///
  /// @return this value if it's less than or equal to the [maximumValue]
  /// or the [maximumValue] otherwise.
  T coerceAtMost(T maximumValue) =>
      this > maximumValue ? maximumValue : this;

  /// Returns true if between [first] and [endInclusive].
  ///
  /// Equivalent to `ComparableRange(first, endInclusive).contains(this)`
  ///
  /// Uncomment this if it's useful for everyone
  //bool between(T first, T endInclusive) =>
  //  first <= this && this <= endInclusive;

  /// Returns true if in the [range].
  /// Uncomment this if it's useful for everyone
  //bool inRange(ComparableRange<T> range) => range.contains(this);

}
