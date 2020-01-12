part of dartx;

extension CompararatorX<T> on Comparator<T> {
  /// return a new comparator,
  /// that sorts the items first by the criteria of this comparator,
  /// then by the criteria of the given comparator
  Comparator<T> compose(Comparator<T> then) {
    return (a, b) {
      final first = this(a, b);
      if (first != 0) {
        return first;
      }
      return then(a, b);
    };
  }

  /// reverse the sort order of this comparator
  Comparator<T> reverse() => (a, b) => this(b, a);
}
