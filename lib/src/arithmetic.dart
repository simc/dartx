part of dartx;

extension NumArithmeticX<T extends num> on T {
  /// Minus val if if it not null else returns `this`
  T? minus(T? val) => val == null ? this : this - val as T?;

  /// returns null if val is null else returns `this` - val
  T? minusOrNull(T? val) => val == null ? null : this - val as T?;

  /// Adds val if if it not null else returns `this`
  T? plus(T? val) => val == null ? this : this + val as T?;

  /// returns null if val is null else returns `this` + val
  T? plusOrNull(T? val) => val == null ? null : this + val as T?;
}
