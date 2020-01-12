part of dartx;

Comparator<E> _getComparator<E>(int order, Comparable selector(E element),
    {Comparator<E> parent}) {
  final newComparator = (E a, E b) {
    return order * selector(a).compareTo(selector(b));
  };
  return parent?.compose(newComparator) ?? newComparator;
}

class _SortedList<E> extends _DelegatingList<E> {
  final Iterable<E> _source;
  final Comparator<E> _comparator;
  List<E> _sortedResults;

  _SortedList._(
    this._source,
    this._comparator,
  );

  _SortedList._withSelector(
    this._source,
    Comparable selector(E element),
    int order,
    Comparator<E> parentComparator,
  ) : _comparator = _getComparator(order, selector, parent: parentComparator);

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
    return _SortedList<E>._(this, _comparator.compose(comparator));
  }

  @override
  List<T> cast<T>() => delegate.cast<T>();

  int _compare(E element1, E element2) {
    return _comparator(element1, element2);
  }
}

/// An implementation of [List] that delegates all methods to another [List].
///
/// Copied from quiver
///
/// For instance you can create a FruitList like this :
///
///     class FruitList extends DelegatingList<Fruit> {
///       final List<Fruit> _fruits = [];
///
///       List<Fruit> get delegate => _fruits;
///
///       // custom methods
///     }
abstract class _DelegatingList<E> extends _DelegatingIterable<E>
    implements List<E> {
  @override
  List<E> get delegate;

  @override
  E operator [](int index) => delegate[index];

  @override
  void operator []=(int index, E value) {
    delegate[index] = value;
  }

  @override
  List<E> operator +(List<E> other) => delegate + other;

  @override
  void add(E value) => delegate.add(value);

  @override
  void addAll(Iterable<E> iterable) => delegate.addAll(iterable);

  @override
  Map<int, E> asMap() => delegate.asMap();

  @override
  void clear() => delegate.clear();

  @override
  void fillRange(int start, int end, [E fillValue]) =>
      delegate.fillRange(start, end, fillValue);

  @override
  set first(E element) {
    if (isEmpty) throw RangeError.index(0, this);
    this[0] = element;
  }

  @override
  Iterable<E> getRange(int start, int end) => delegate.getRange(start, end);

  @override
  int indexOf(E element, [int start = 0]) => delegate.indexOf(element, start);

  @override
  int indexWhere(bool test(E element), [int start = 0]) =>
      delegate.indexWhere(test, start);

  @override
  void insert(int index, E element) => delegate.insert(index, element);

  @override
  void insertAll(int index, Iterable<E> iterable) =>
      delegate.insertAll(index, iterable);

  @override
  set last(E element) {
    if (isEmpty) throw RangeError.index(0, this);
    this[length - 1] = element;
  }

  @override
  int lastIndexOf(E element, [int start]) =>
      delegate.lastIndexOf(element, start);

  @override
  int lastIndexWhere(bool test(E element), [int start]) =>
      delegate.lastIndexWhere(test, start);

  @override
  set length(int newLength) {
    delegate.length = newLength;
  }

  @override
  bool remove(Object value) => delegate.remove(value);

  @override
  E removeAt(int index) => delegate.removeAt(index);

  @override
  E removeLast() => delegate.removeLast();

  @override
  void removeRange(int start, int end) => delegate.removeRange(start, end);

  @override
  void removeWhere(bool test(E element)) => delegate.removeWhere(test);

  @override
  void replaceRange(int start, int end, Iterable<E> iterable) =>
      delegate.replaceRange(start, end, iterable);

  @override
  void retainWhere(bool test(E element)) => delegate.retainWhere(test);

  @override
  Iterable<E> get reversed => delegate.reversed;

  @override
  void setAll(int index, Iterable<E> iterable) =>
      delegate.setAll(index, iterable);

  @override
  void setRange(int start, int end, Iterable<E> iterable,
          [int skipCount = 0]) =>
      delegate.setRange(start, end, iterable, skipCount);

  @override
  void shuffle([Random random]) => delegate.shuffle(random);

  @override
  void sort([int compare(E a, E b)]) => delegate.sort(compare);

  @override
  List<E> sublist(int start, [int end]) => delegate.sublist(start, end);
}

/// An implementation of [Iterable] that delegates all methods to another
/// [Iterable].
///
/// Copied from quiver
///
/// For instance you can create a FruitIterable like this :
///
///     class FruitIterable extends DelegatingIterable<Fruit> {
///       final Iterable<Fruit> _fruits = [];
///
///       Iterable<Fruit> get delegate => _fruits;
///
///       // custom methods
///     }
abstract class _DelegatingIterable<E> implements Iterable<E> {
  Iterable<E> get delegate;

  @override
  bool any(bool test(E element)) => delegate.any(test);

  @override
  Iterable<T> cast<T>() => delegate.cast<T>();

  @override
  bool contains(Object element) => delegate.contains(element);

  @override
  E elementAt(int index) => delegate.elementAt(index);

  @override
  bool every(bool test(E element)) => delegate.every(test);

  @override
  Iterable<T> expand<T>(Iterable<T> f(E element)) => delegate.expand(f);

  @override
  E get first => delegate.first;

  @override
  E firstWhere(bool test(E element), {E orElse()}) =>
      delegate.firstWhere(test, orElse: orElse);

  @override
  T fold<T>(T initialValue, T combine(T previousValue, E element)) =>
      delegate.fold(initialValue, combine);

  @override
  Iterable<E> followedBy(Iterable<E> other) => delegate.followedBy(other);

  @override
  void forEach(void f(E element)) => delegate.forEach(f);

  @override
  bool get isEmpty => delegate.isEmpty;

  @override
  bool get isNotEmpty => delegate.isNotEmpty;

  @override
  Iterator<E> get iterator => delegate.iterator;

  @override
  String join([String separator = '']) => delegate.join(separator);

  @override
  E get last => delegate.last;

  @override
  E lastWhere(bool test(E element), {E orElse()}) =>
      delegate.lastWhere(test, orElse: orElse);

  @override
  int get length => delegate.length;

  @override
  Iterable<T> map<T>(T f(E e)) => delegate.map(f);

  @override
  E reduce(E combine(E value, E element)) => delegate.reduce(combine);

  @override
  E get single => delegate.single;

  @override
  E singleWhere(bool test(E element), {E orElse()}) =>
      delegate.singleWhere(test, orElse: orElse);

  @override
  Iterable<E> skip(int n) => delegate.skip(n);

  @override
  Iterable<E> skipWhile(bool test(E value)) => delegate.skipWhile(test);

  @override
  Iterable<E> take(int n) => delegate.take(n);

  @override
  Iterable<E> takeWhile(bool test(E value)) => delegate.takeWhile(test);

  @override
  List<E> toList({bool growable = true}) => delegate.toList(growable: growable);

  @override
  Set<E> toSet() => delegate.toSet();

  @override
  Iterable<E> where(bool test(E element)) => delegate.where(test);

  @override
  Iterable<T> whereType<T>() => delegate.whereType<T>();
}
