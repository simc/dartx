part of dartx;

Comparator<E> _getComparator<E>(int order, Comparable selector(E element)) {
  return (E a, E b) {
    return order * selector(a).compareTo(selector(b));
  };
}

class _SortedList<E> extends DelegatingList<E> {
  final Iterable<E> _source;
  final Comparator<E> _comparator;
  final Comparator<E> _parentComparator;
  List<E> _sortedResults;

  _SortedList._(
    this._source,
    this._comparator,
    this._parentComparator,
  );

  _SortedList._withSelector(
    this._source,
    Comparable selector(E element),
    int order,
    this._parentComparator,
  ) : _comparator = _getComparator(order, selector);

  @override
  List<E> get delegate {
    if (_sortedResults == null) {
      _sortedResults = _source.toList();
      _sortedResults.sort(_compare);
    }
    return _sortedResults;
  }

  /// Returns a new list with all elements sorted according to previously
  /// defined order and natural sort order of the values returned by specified
  /// [selector] function.
  ///
  /// **Note:** The actual sorting is performed when an element is accessed for
  /// the first time.
  _SortedList<E> thenBy(Comparable selector(E element)) {
    return _SortedList<E>._withSelector(this, selector, 1, _comparator);
  }

  /// Returns a new list with all elements sorted according to previously
  /// defined order and descending natural sort order of the values returned by
  /// specified [selector] function.
  ///
  /// **Note:** The actual sorting is performed when an element is accessed for
  /// the first time.
  _SortedList<E> thenByDescending(Comparable selector(E element)) {
    return _SortedList<E>._withSelector(this, selector, -1, _comparator);
  }

  /// Returns a new list with all elements sorted according to previously
  /// defined order and specified [comparator].
  ///
  /// **Note:** The actual sorting is performed when an element is accessed for
  /// the first time.
  _SortedList<E> thenWith(Comparator<E> comparator) {
    return _SortedList<E>._(this, comparator, _comparator);
  }

  int _compare(E element1, E element2) {
    var compare = 0;
    if (_parentComparator != null) {
      compare = _parentComparator(element1, element2);
    }
    if (compare == 0) {
      return _comparator(element1, element2);
    } else {
      return compare;
    }
  }
}
