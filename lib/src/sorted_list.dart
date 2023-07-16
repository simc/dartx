import 'dart:math';
import 'package:dartx/dartx.dart';

Comparator<E> _getComparator<E>(
  int order,
  Comparable Function(E element) selector, {
  Comparator<E>? parent,
}) {
  int newComparator(E a, E b) {
    return order * selector(a).compareTo(selector(b));
  }

  return parent?.compose(newComparator) ?? newComparator;
}

class SortedList<E> extends _DelegatingList<E> {
  final Iterable<E> _source;
  final Comparator<E> _comparator;
  List<E>? _sortedResults;

  SortedList(
    this._source,
    this._comparator,
  );

  SortedList.withSelector(
    this._source,
    Comparable Function(E element) selector,
    int order,
    Comparator<E>? parentComparator,
  ) : _comparator = _getComparator(order, selector, parent: parentComparator);

  @override
  List<E> get delegate {
    if (_sortedResults == null) {
      _sortedResults = _source.toList();
      _sortedResults!.sort(_compare);
    }
    return _sortedResults!;
  }

  /// Returns a new list with all elements sorted according to previously
  /// defined order and natural sort order of the values returned by specified
  /// [selector] function.
  ///
  /// **Note:** The actual sorting is performed when an element is accessed for
  /// the first time.
  SortedList<E> thenBy(Comparable Function(E element) selector) {
    return SortedList<E>.withSelector(this, selector, 1, _comparator);
  }

  /// Returns a new list with all elements sorted according to previously
  /// defined order and descending natural sort order of the values returned by
  /// specified [selector] function.
  ///
  /// **Note:** The actual sorting is performed when an element is accessed for
  /// the first time.
  SortedList<E> thenByDescending(Comparable Function(E element) selector) {
    return SortedList<E>.withSelector(this, selector, -1, _comparator);
  }

  /// Returns a new list with all elements sorted according to previously
  /// defined order and specified [comparator].
  ///
  /// **Note:** The actual sorting is performed when an element is accessed for
  /// the first time.
  SortedList<E> thenWith(Comparator<E> comparator) {
    return SortedList<E>(this, _comparator.compose(comparator));
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
  void fillRange(int start, int end, [E? fillValue]) =>
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
  int indexWhere(bool Function(E element) test, [int start = 0]) =>
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
  int lastIndexOf(E element, [int? start]) =>
      delegate.lastIndexOf(element, start);

  @override
  int lastIndexWhere(bool Function(E element) test, [int? start]) =>
      delegate.lastIndexWhere(test, start);

  @override
  set length(int newLength) {
    delegate.length = newLength;
  }

  @override
  bool remove(Object? value) => delegate.remove(value);

  @override
  E removeAt(int index) => delegate.removeAt(index);

  @override
  E removeLast() => delegate.removeLast();

  @override
  void removeRange(int start, int end) => delegate.removeRange(start, end);

  @override
  void removeWhere(bool Function(E element) test) => delegate.removeWhere(test);

  @override
  void replaceRange(int start, int end, Iterable<E> iterable) =>
      delegate.replaceRange(start, end, iterable);

  @override
  void retainWhere(bool Function(E element) test) => delegate.retainWhere(test);

  @override
  Iterable<E> get reversed => delegate.reversed;

  @override
  void setAll(int index, Iterable<E> iterable) =>
      delegate.setAll(index, iterable);

  @override
  void setRange(
    int start,
    int end,
    Iterable<E> iterable, [
    int skipCount = 0,
  ]) =>
      delegate.setRange(start, end, iterable, skipCount);

  @override
  void shuffle([Random? random]) => delegate.shuffle(random);

  @override
  void sort([int Function(E a, E b)? compare]) => delegate.sort(compare);

  @override
  List<E> sublist(int start, [int? end]) => delegate.sublist(start, end);
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
  bool any(bool Function(E element) test) => delegate.any(test);

  @override
  Iterable<T> cast<T>() => delegate.cast<T>();

  @override
  bool contains(Object? element) => delegate.contains(element);

  @override
  E elementAt(int index) => delegate.elementAt(index);

  @override
  bool every(bool Function(E element) test) => delegate.every(test);

  @override
  Iterable<T> expand<T>(Iterable<T> Function(E element) f) =>
      delegate.expand(f);

  @override
  E get first => delegate.first;

  @override
  E firstWhere(bool Function(E element) test, {E Function()? orElse}) =>
      delegate.firstWhere(test, orElse: orElse);

  @override
  T fold<T>(T initialValue, T Function(T previousValue, E element) combine) =>
      delegate.fold(initialValue, combine);

  @override
  Iterable<E> followedBy(Iterable<E> other) => delegate.followedBy(other);

  @override
  void forEach(void Function(E element) f) => delegate.forEach(f);

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
  E lastWhere(bool Function(E element) test, {E Function()? orElse}) =>
      delegate.lastWhere(test, orElse: orElse);

  @override
  int get length => delegate.length;

  @override
  Iterable<T> map<T>(T Function(E e) f) => delegate.map(f);

  @override
  E reduce(E Function(E value, E element) combine) => delegate.reduce(combine);

  @override
  E get single => delegate.single;

  @override
  E singleWhere(bool Function(E element) test, {E Function()? orElse}) =>
      delegate.singleWhere(test, orElse: orElse);

  @override
  Iterable<E> skip(int n) => delegate.skip(n);

  @override
  Iterable<E> skipWhile(bool Function(E value) test) =>
      delegate.skipWhile(test);

  @override
  Iterable<E> take(int n) => delegate.take(n);

  @override
  Iterable<E> takeWhile(bool Function(E value) test) =>
      delegate.takeWhile(test);

  @override
  List<E> toList({bool growable = true}) => delegate.toList(growable: growable);

  @override
  Set<E> toSet() => delegate.toSet();

  @override
  Iterable<E> where(bool Function(E element) test) => delegate.where(test);

  @override
  Iterable<T> whereType<T>() => delegate.whereType<T>();
}
