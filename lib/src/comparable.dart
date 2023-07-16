import 'package:dartx/dartx.dart';

/// Provides comparison operators for [Comparable] types.
extension ComparableSmallerExtension<T extends Comparable<T>> on T {
  bool operator <(T other) => compareTo(other) < 0;
}

extension ComparableSmallerEqualsExtension<T extends Comparable<T>> on T {
  bool operator <=(T other) => compareTo(other) <= 0;
}

extension ComparableBiggerExtension<T extends Comparable<T>> on T {
  bool operator >(T other) => compareTo(other) > 0;
}

extension ComparableBiggerEqualsExtension<T extends Comparable<T>> on T {
  bool operator >=(T other) => compareTo(other) >= 0;
}

extension ComparableCoerceInExtension<T extends Comparable<T>> on T {
  /// Ensures that this value lies in the specified range
  /// [minimumValue]..[maximumValue].
  ///
  /// @return this value if it's in the range, or [minimumValue]
  /// if this value is less than [minimumValue],
  /// or [maximumValue] if this value is greater than [maximumValue].
  T coerceIn(T minimumValue, [T? maximumValue]) {
    if (maximumValue != null && minimumValue > maximumValue) {
      throw ArgumentError(
        'Cannot coerce value to an empty range: '
        'maximum $maximumValue is less than minimum $minimumValue.',
      );
    }
    if (this < minimumValue) return minimumValue;
    if (maximumValue != null && this > maximumValue) return maximumValue;
    return this;
  }
}

extension ComparableCoerceAtLeastExtension<T extends Comparable<T>> on T {
  /// Ensures that this value is not less than the specified [minimumValue].
  ///
  /// @return this value if it's greater than or equal to the [minimumValue]
  /// or the [minimumValue] otherwise.
  T coerceAtLeast(T minimumValue) => this < minimumValue ? minimumValue : this;
}

extension ComparableCoerceAtMostExtension<T extends Comparable<T>> on T {
  /// Ensures that this value is not greater than the specified [maximumValue].
  ///
  /// @return this value if it's less than or equal to the [maximumValue]
  /// or the [maximumValue] otherwise.
  T coerceAtMost(T maximumValue) => this > maximumValue ? maximumValue : this;
}

extension ComparableBetweenExtension<T extends Comparable<T>> on T {
  /// Returns true when between [first] and [endInclusive]. The order of the
  /// arguments doesn't matter.
  ///
  /// Alias for `first.rangeTo(endInclusive).contains(this)`
  bool between(T first, T endInclusive) =>
      first.rangeTo(endInclusive).contains(this);
}

extension ComparableInRangeExtension<T extends Comparable<T>> on T {
  /// Returns true if in the [range].
  bool inRange(Range<T> range) => range.contains(this);
}
