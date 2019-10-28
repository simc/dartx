part of dartx;

extension DateTimeX on DateTime {
  /// Adds this DateTime and Duration and returns the sum as a new DateTime
  /// object.
  DateTime operator +(Duration duration) => add(duration);

  /// Subtracts the Duration from this DateTime returns the difference as a new
  /// DateTime object.
  DateTime operator -(Duration duration) => subtract(duration);
}

extension DurationX on Duration {
  /// Returns the representation in weeks
  int get inWeeks => (inDays / 7).ceil();

  /// Adds the Duration to the current DateTime and returns a DateTime in the
  /// future
  DateTime get later => DateTime.now() + this;

  /// Subtracts the Duration from the current DateTime and returns a DateTime
  /// in the past
  DateTime get ago => DateTime.now() - this;
}
