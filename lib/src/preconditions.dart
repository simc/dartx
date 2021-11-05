part of dartx;

/// Throws an [Exception] with the result of calling [message] if the [value] is false.
// ignore: avoid_positional_boolean_parameters
void require(bool value, [dynamic message = 'Failed requirement.']) {
  if (!value) {
    throw Exception(message);
  }
}

/// Throws an [Exception] with the result of calling [message] if the [value] is null. Otherwise
/// returns the not null value.
T requireNotNull<T>(T? value, [dynamic message = 'Required value was null.']) {
  if (value == null) {
    throw Exception(message);
  } else {
    return value;
  }
}

/// Throws an [IllegalStateException] with the given [message].
void error(dynamic message) => throw Exception(message);
