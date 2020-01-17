part of dartx;

/// Provides type casting for [Object] type.
extension ObjectX<T extends Object> on T {
  R as<R>() => this is R ? this as R : null;
}