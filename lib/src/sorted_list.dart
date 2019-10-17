part of dartx;

Comparator<E> _getComparator<E>(int order, Comparable selector(E element)) {
  return (E a, E b) {
    return order * selector(a).compareTo(selector(b));
  };
}

/// Should only be used throught [$Iterable.sortedBy].
///
/// **Note:** The actual sorting is performed when an element is accessed for
/// the first time.
class SortedList<E> extends _DelegatingList<E> {
  final Comparator<E> _comparator;
  final Comparator<E> _parentComparator;
  List<E> _sortedResults;

  SortedList._(
    Iterable<E> source,
    this._comparator,
    this._parentComparator,
  );

  SortedList._withSelector(
    Iterable<E> source,
    Comparable selector(E element),
    int order,
    this._parentComparator,
  ) : _comparator = _getComparator(order, selector);

  /// Returns a new list with all elements sorted according to previously
  /// defined order and natural sort order of the values returned by specified
  /// [selector] function.
  ///
  /// **Note:** The actual sorting is performed when an element is accessed for
  /// the first time.
  SortedList<E> thenBy(Comparable selector(E element)) {
    return SortedList<E>._withSelector(this, selector, 1, _comparator);
  }

  /// Returns a new list with all elements sorted according to previously
  /// defined order and descending natural sort order of the values returned by
  /// specified [selector] function.
  ///
  /// **Note:** The actual sorting is performed when an element is accessed for
  /// the first time.
  SortedList<E> thenByDescending(Comparable selector(E element)) {
    return SortedList<E>._withSelector(this, selector, -1, _comparator);
  }

  /// Returns a new list with all elements sorted according to previously
  /// defined order and specified [comparator].
  ///
  /// **Note:** The actual sorting is performed when an element is accessed for
  /// the first time.
  SortedList<E> thenWith(Comparator<E> comparator) {
    return SortedList<E>._(this, comparator, _comparator);
  }

  int _compare(E element1, E element2) {
    int compare = 0;
    if (_parentComparator != null) {
      compare = _parentComparator(element1, element2);
    }
    if (compare == 0)
      return _comparator(element1, element2);
    else
      return compare;
  }

  @override
  List<E> get source {
    if (_sortedResults == null) {}
  }
}
