part of dartx;

/// Provides comparison operators for [Comparable] types.
extension ComparableX<T extends Comparable<T>> on T {
  bool operator <(T other) => compareTo(other) < 0;
  bool operator <=(T other) => compareTo(other) <= 0;
  bool operator >(T other) => compareTo(other) > 0;
  bool operator >=(T other) => compareTo(other) >= 0;

  /// Ensures that this value lies in the specified range [min]..[max].
  ///
  /// @return this value if it's in the range, or [min] if this value is
  /// less than [min], or [max] if this value is greater than [max].
  T coerceIn(T minimumValue, [T maximumValue]) {
    if (maximumValue != null && minimumValue > maximumValue) {
      throw ArgumentError('Cannot coerce value to an empty range: '
          'maximum $maximumValue is less than minimum $minimumValue.');
    }
    if (this < minimumValue) return minimumValue;
    if (maximumValue != null && this > maximumValue) return maximumValue;
    return this;
  }

  /// Ensures that this value is not less than the specified [min].
  ///
  /// @return this value if it's greater than or equal to the [min]
  /// or the [min] otherwise.
  T coerceAtLeast(T minimumValue) =>
      this < minimumValue ? minimumValue : this;

  /// Ensures that this value is not greater than the specified [max].
  ///
  /// @return this value if it's less than or equal to the [max]
  /// or the [max] otherwise.
  T coerceAtMost(T maximumValue) =>
      this > maximumValue ? maximumValue : this;
}
