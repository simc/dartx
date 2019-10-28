part of dartx;

extension TimeIntX on int {
  /// Returns a Duration represented in weeks
  Duration get weeks => Duration(days: this * 7);

  /// Returns a Duration represented in days
  Duration get days => Duration(days: this);

  /// Returns a Duration represented in hours
  Duration get hours => Duration(hours: this);

  /// Returns a Duration represented in minutes
  Duration get minutes => Duration(minutes: this);

  /// Returns a Duration represented in seconds
  Duration get seconds => Duration(seconds: this);

  /// Returns a Duration represented in milliseconds
  Duration get milliseconds => Duration(milliseconds: this);

  /// Returns a Duration represented in microseconds
  Duration get microseconds => Duration(microseconds: this);

  /// Returns a Duration represented in nanoseconds
  Duration get nanoseconds => Duration(microseconds: this ~/ 1000);
}

extension DateTimeX on DateTime {
  /// Adds this DateTime and Duration and returns the sum as a new DateTime object.
  DateTime operator +(Duration duration) => add(duration);

  /// Subtracts the Duration from this DateTime returns the difference as a new DateTime object.
  DateTime operator -(Duration duration) => subtract(duration);
}

extension DurationX on Duration {
  /// Returns the representation in weeks
  int get inWeeks => (inDays / 7).ceil();

  /// Adds the Duration to the current DateTime and returns a DateTime in the future
  DateTime get later => DateTime.now() + this;

  /// Subtracts the Duration from the current DateTime and returns a DateTime in the past
  DateTime get ago => DateTime.now() - this;
}
