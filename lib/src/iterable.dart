import 'dart:collection';
import 'dart:math';

import 'package:collection/collection.dart' as collection;
import 'package:dartx/src/sorted_list.dart';

extension IterableSecondItem<E> on Iterable<E> {
  /// Second element.
  ///
  /// ```dart
  /// [1, 2, 3].second; // 2
  /// ```
  E get second => elementAt(1);
}

extension IterableThirdItem<E> on Iterable<E> {
  /// Third element.
  ///
  /// ```dart
  /// [1, 2, 3].third; // 3
  /// ```
  E get third => elementAt(2);
}

extension IterableFourthItem<E> on Iterable<E> {
  /// Fourth element.
  ///
  /// ```dart
  /// [1, 2, 3, 4].fourth; // 4
  /// ```
  E get fourth => elementAt(3);
}

extension IterableElementAtOrNull<E> on Iterable<E> {
  /// Returns an element at the given [index] or `null` if the [index] is out of
  /// bounds of this collection.
  ///
  /// ```dart
  /// final list = [1, 2, 3, 4];
  /// final first = list.elementAtOrNull(0); // 1
  /// final fifth = list.elementAtOrNull(4); // null
  /// ```
  E? elementAtOrNull(int index) {
    if (index < 0) return null;
    var count = 0;
    for (final element in this) {
      if (index == count++) return element;
    }
    return null;
  }
}

extension IterableElementAtOrDefault<E> on Iterable<E> {
  /// Returns an element at the given [index] or [defaultValue] if the [index]
  /// is out of bounds of this collection.
  ///
  /// ```dart
  /// final list = [1, 2, 3, 4];
  /// final first = list.elementAtOrDefault(0, -1); // 1
  /// final fifth = list.elementAtOrDefault(4, -1); // -1
  /// ```
  E elementAtOrDefault(int index, E defaultValue) {
    return elementAtOrElse(index, (_) => defaultValue);
  }
}

extension IterableElementAtOrElse<E> on Iterable<E> {
  /// Returns an element at the given [index] or the result of calling the
  /// [defaultValue] function if the [index] is out of bounds of this
  /// collection.
  ///
  /// ```dart
  /// final list = [1, 2, 3, 4];
  /// final first = list.elementAtOrElse(0); // 1
  /// final fifth = list.elementAtOrElse(4, -1); // -1
  /// ```
  E elementAtOrElse(int index, E Function(int index) defaultValue) {
    if (index < 0) return defaultValue(index);
    var count = 0;
    for (final element in this) {
      if (index == count++) return element;
    }
    return defaultValue(index);
  }
}

extension IterableFirstOrNull<E> on Iterable<E> {
  /// First element or `null` if the collection is empty.
  ///
  /// ```dart
  /// final first = [1, 2, 3, 4].firstOrNull; // 1
  /// final emptyFirst = [].firstOrNull; // null
  /// ```
  E? get firstOrNull => isNotEmpty ? first : null;
}

extension IterableFirstOrDefault<E> on Iterable<E> {
  /// First element or `defaultValue` if the collection is empty.
  ///
  /// ```dart
  /// final first = [1, 2, 3, 4].firstOrDefault(-1); // 1
  /// final emptyFirst = [].firstOrDefault(-1); // -1
  /// ```
  E firstOrDefault(E defaultValue) => isNotEmpty ? first : defaultValue;
}

extension IterableFirstOrNullWhere<E> on Iterable<E> {
  /// Returns the first element matching the given [predicate], or `null` if no
  /// such element was found.
  ///
  /// ```dart
  /// final list = ['a', 'Test'];
  /// final firstLong= list.firstOrNullWhere((e) => e.length > 1); // 'Test'
  /// final firstVeryLong = list.firstOrNullWhere((e) => e.length > 5); // null
  /// ```
  E? firstOrNullWhere(bool Function(E element) predicate) {
    for (final element in this) {
      if (predicate(element)) return element;
    }
    return null;
  }
}

extension IterableLastOrNull<E> on Iterable<E> {
  /// Last element or `null` if the collection is empty.
  ///
  /// ```dart
  /// final last = [1, 2, 3, 4].lastOrNull; // 4
  /// final emptyLast = [].firstOrNull; // null
  /// ```
  E? get lastOrNull => isNotEmpty ? last : null;
}

extension IterableLastOrElse<E> on Iterable<E> {
  /// Last element or `defaultValue` if the collection is empty.
  E lastOrElse(E defaultValue) =>
      IterableLastOrNull(this).lastOrNull ?? defaultValue;
}

extension IterableLastOrNullWhere<E> on Iterable<E> {
  /// Returns the last element matching the given [predicate], or `null` if no
  /// such element was found.
  E? lastOrNullWhere(bool Function(E element) predicate) {
    E? match;
    for (final e in this) {
      if (predicate(e)) {
        match = e;
      }
    }
    return match;
  }
}

extension IterableAll<E> on Iterable<E> {
  /// Returns true if all elements match the given [predicate] or if the
  /// collection is empty.
  bool all(bool Function(E element) predicate) {
    for (final element in this) {
      if (!predicate(element)) {
        return false;
      }
    }
    return true;
  }
}

extension IterableNone<E> on Iterable<E> {
  /// Returns true if no entries match the given [predicate] or if the
  /// collection is empty.
  bool none(bool Function(E element) predicate) => !any(predicate);
}

extension IterableSlice<E> on Iterable<E> {
  /// Returns a new list containing elements at indices between [start]
  /// (inclusive) and [end] (inclusive).
  ///
  /// If [end] is omitted, it is being set to `lastIndex`.
  List<E> slice(int start, [int end = -1]) {
    final list = this is List ? this as List<E> : toList();
    var _start = start;
    var _end = end;

    if (_start < 0) {
      _start = _start + list.length;
    }
    if (_end < 0) {
      _end = _end + list.length;
    }

    RangeError.checkValidRange(_start, _end, list.length);

    return list.sublist(_start, _end + 1);
  }
}

extension IterableForEachIndexed<E> on Iterable<E> {
  /// Performs the given [action] on each element, providing sequential index
  /// with the element.
  void forEachIndexed(void Function(E element, int index) action) {
    var index = 0;
    for (final element in this) {
      action(element, index++);
    }
  }
}

extension IterableContainsAll<E> on Iterable<E> {
  /// Checks if all elements in the specified [collection] are contained in
  /// this collection.
  bool containsAll(Iterable<E> collection) {
    for (final element in collection) {
      if (!contains(element)) return false;
    }
    return true;
  }
}

extension IterableContainsAny<E> on Iterable<E> {
  /// Checks if any elements in the specified [collection] are contained in
  /// this collection.
  bool containsAny(Iterable<E> collection) {
    for (final element in collection) {
      if (contains(element)) return true;
    }
    return false;
  }
}

extension IterableContentEquals<E> on Iterable<E> {
  /// Returns true if this collection is structurally equal to the [other]
  /// collection.
  ///
  /// I.e. contain the same number of the same elements in the same order.
  ///
  /// If [checkEqual] is provided, it is used to check if two elements are the
  /// same.
  bool contentEquals(Iterable<E> other, [bool Function(E a, E b)? checkEqual]) {
    final it1 = iterator;
    final it2 = other.iterator;
    if (checkEqual != null) {
      while (it1.moveNext()) {
        if (!it2.moveNext()) return false;
        if (!checkEqual(it1.current, it2.current)) return false;
      }
    } else {
      while (it1.moveNext()) {
        if (!it2.moveNext()) return false;
        if (it1.current != it2.current) return false;
      }
    }
    return !it2.moveNext();
  }
}

extension IterableSorted<E> on Iterable<E> {
  /// Returns a new list with all elements sorted according to natural sort
  /// order.
  List<E> sorted() {
    final list = toList();
    list.sort();
    return list;
  }
}

extension IterableSortedDescending<E> on Iterable<E> {
  /// Returns a new list with all elements sorted according to descending
  /// natural sort order.
  List<E> sortedDescending() {
    final list = toList();
    list.sort((a, b) => -(a as Comparable).compareTo(b));
    return list;
  }
}

extension IterableSortedBy<E> on Iterable<E> {
  /// Returns a new list with all elements sorted according to natural sort
  /// order of the values returned by specified [selector] function.
  ///
  /// To sort by more than one property, `thenBy()` or `thenByDescending()` can
  /// be called afterwards.
  ///
  /// **Note:** The actual sorting is performed when an element is accessed for
  /// the first time.
  SortedList<E> sortedBy(Comparable Function(E element) selector) {
    return SortedList<E>.withSelector(this, selector, 1, null);
  }
}

extension IterableSortedByDescending<E> on Iterable<E> {
  /// Returns a new list with all elements sorted according to descending
  /// natural sort order of the values returned by specified [selector]
  /// function.
  ///
  /// To sort by more than one property, `thenBy()` or `thenByDescending` can
  /// be called afterwards.
  ///
  /// **Note:** The actual sorting is performed when an element is accessed for
  /// the first time.
  SortedList<E> sortedByDescending(Comparable Function(E element) selector) {
    return SortedList<E>.withSelector(this, selector, -1, null);
  }
}

extension IterableSortedWith<E> on Iterable<E> {
  /// Returns a new list with all elements sorted according to specified
  /// [comparator].
  ///
  /// To sort by more than one property, `thenBy()` or `thenByDescending` can
  /// be called afterwards.
  ///
  /// **Note:** The actual sorting is performed when an element is accessed for
  /// the first time.
  SortedList<E> sortedWith(Comparator<E> comparator) {
    return SortedList<E>(this, comparator);
  }
}

extension IterableJoinToString<E> on Iterable<E> {
  /// Creates a string from all the elements separated using [separator] and
  /// using the given [prefix] and [postfix] if supplied.
  ///
  /// If the collection could be huge, you can specify a non-negative value of
  /// [limit], in which case only the first [limit] elements will be appended,
  /// followed by the [truncated] string (which defaults to `'...'`).
  String joinToString({
    String separator = ', ',
    String Function(E element)? transform,
    String prefix = '',
    String postfix = '',
    int? limit,
    String truncated = '...',
  }) {
    final buffer = StringBuffer();
    var count = 0;
    for (final element in this) {
      if (limit != null && count >= limit) {
        buffer.write(truncated);
        return buffer.toString();
      }
      if (count > 0) {
        buffer.write(separator);
      }
      buffer.write(prefix);
      if (transform != null) {
        buffer.write(transform(element));
      } else {
        buffer.write(element.toString());
      }
      buffer.write(postfix);

      count++;
    }
    return buffer.toString();
  }
}

extension IterableSumBy<E> on Iterable<E> {
  /// Returns the sum of all values produced by [selector] function applied to
  /// each element in the collection.
  T sumBy<T extends num>(T Function(E element) selector) {
    var sum = T == double ? 0.0 : 0;
    for (final current in this) {
      sum += selector(current);
    }
    return sum as T;
  }
}

extension IterableAverageBy<E> on Iterable<E> {
  /// Returns the average of values returned by [selector] for all elements in
  /// the collection.
  double averageBy(num Function(E element) selector) {
    var count = 0;
    num sum = 0;

    for (final current in this) {
      sum += selector(current);
      count++;
    }

    if (count == 0) {
      throw StateError('No elements in collection');
    } else {
      return sum / count;
    }
  }
}

extension InterableMin<E> on Iterable<E> {
  /// Returns the smallest element or `null` if there are no elements.
  ///
  /// All elements must be of type [Comparable].
  E? min() => _minMax(-1);
}

extension _MinMaxHelper<E> on Iterable<E> {
  E? _minMax(int order) {
    final it = iterator;
    if (!it.moveNext()) {
      return null;
    }
    var currentMin = it.current;

    if (order < 0) {
      while (it.moveNext()) {
        if ((it.current as Comparable).compareTo(currentMin) <= order) {
          currentMin = it.current;
        }
      }
    } else {
      while (it.moveNext()) {
        if ((it.current as Comparable).compareTo(currentMin) >= order) {
          currentMin = it.current;
        }
      }
    }

    return currentMin;
  }

  E? _minMaxBy(int order, Comparable Function(E element) selector) {
    final it = iterator;
    if (!it.moveNext()) {
      return null;
    }

    var currentMin = it.current;
    var currentMinValue = selector(it.current);
    while (it.moveNext()) {
      final comp = selector(it.current);
      if (comp.compareTo(currentMinValue) == order) {
        currentMin = it.current;
        currentMinValue = comp;
      }
    }

    return currentMin;
  }

  E? _minMaxWith(int order, Comparator<E> comparator) {
    final it = iterator;
    if (!it.moveNext()) {
      return null;
    }
    var currentMin = it.current;

    while (it.moveNext()) {
      if (comparator(it.current, currentMin) == order) {
        currentMin = it.current;
      }
    }

    return currentMin;
  }
}

extension IterableMinBy<E> on Iterable<E> {
  /// Returns the first element yielding the smallest value of the given
  /// [selector] or `null` if there are no elements.
  E? minBy(Comparable Function(E element) selector) => _minMaxBy(-1, selector);
}

extension IterableMinWith<E> on Iterable<E> {
  /// Returns the first element having the smallest value according to the
  /// provided [comparator] or `null` if there are no elements.
  E? minWith(Comparator<E> comparator) => _minMaxWith(-1, comparator);
}

extension IterableMax<E> on Iterable<E> {
  /// Returns the largest element or `null` if there are no elements.
  ///
  /// All elements must be of type [Comparable].
  E? max() => _minMax(1);
}

extension IterableMaxBy<E> on Iterable<E> {
  /// Returns the first element yielding the largest value of the given
  /// [selector] or `null` if there are no elements.
  E? maxBy(Comparable Function(E element) selector) => _minMaxBy(1, selector);
}

extension IterableMaxWith<E> on Iterable<E> {
  /// Returns the first element having the largest value according to the
  /// provided [comparator] or `null` if there are no elements.
  E? maxWith(Comparator<E> comparator) => _minMaxWith(1, comparator);
}

extension IterableCount<E> on Iterable<E> {
  /// Returns the number of elements matching the given [predicate].
  ///
  /// If no [predicate] is given, this equals to [length].
  int count([bool Function(E element)? predicate]) {
    var count = 0;
    if (predicate == null) {
      return length;
    } else {
      for (final current in this) {
        if (predicate(current)) {
          count++;
        }
      }
    }

    return count;
  }
}

extension IterableReversed<E> on Iterable<E> {
  /// Returns an [Iterable] of the objects in this list in reverse order.
  Iterable<E> get reversed {
    return this is List<E> ? (this as List<E>).reversed : toList().reversed;
  }
}

extension IterableTakeFirst<E> on Iterable<E> {
  /// Returns a list containing first [n] elements.
  ///
  /// ```dart
  /// val chars = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  /// print(chars.take(3)) // [1, 2, 3]
  /// print(chars.takeWhile((it) => it < 5) // [1, 2, 3, 4]
  /// print(chars.takeLast(2)) // [8, 9]
  /// print(chars.takeLastWhile((it) => it > 5 }) // [6, 7, 8, 9]
  /// ```
  List<E> takeFirst(int n) {
    final list = this is List<E> ? this as List<E> : toList();
    return list.take(n).toList();
  }
}

extension IterableTakeLast<E> on Iterable<E> {
  /// Returns a list containing last [n] elements.
  ///
  /// ```dart
  /// val chars = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  /// print(chars.take(3)) // [1, 2, 3]
  /// print(chars.takeWhile((it) => it < 5) // [1, 2, 3, 4]
  /// print(chars.takeLast(2)) // [8, 9]
  /// print(chars.takeLastWhile((it) => it > 5 }) // [6, 7, 8, 9]
  /// ```
  List<E> takeLast(int n) {
    final list = this is List<E> ? this as List<E> : toList();
    return list.reversed.take(n).reversed.toList();
  }
}

extension IterableFirstWhile<E> on Iterable<E> {
  //// Returns the first elements satisfying the given [predicate].
  ///
  /// ```dart
  /// val chars = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  /// print(chars.take(3)) // [1, 2, 3]
  /// print(chars.takeWhile((it) => it < 5) // [1, 2, 3, 4]
  /// print(chars.takeLast(2)) // [8, 9]
  /// print(chars.takeLastWhile((it) => it > 5 }) // [6, 7, 8, 9]
  /// ```
  Iterable<E> firstWhile(bool Function(E element) predicate) sync* {
    for (final element in this) {
      if (!predicate(element)) break;
      yield element;
    }
  }
}

extension IterableLastWhile<E> on Iterable<E> {
  /// Returns the last elements satisfying the given [predicate].
  ///
  /// ```dart
  /// val chars = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  /// print(chars.take(3)) // [1, 2, 3]
  /// print(chars.takeWhile((it) => it < 5) // [1, 2, 3, 4]
  /// print(chars.takeLast(2)) // [8, 9]
  /// print(chars.takeLastWhile((it) => it > 5 }) // [6, 7, 8, 9]
  /// ```
  Iterable<E> lastWhile(bool Function(E element) predicate) {
    final list = ListQueue<E>();
    for (final element in reversed) {
      if (!predicate(element)) break;
      list.addFirst(element);
    }
    return list;
  }
}

extension IterableFilter<E> on Iterable<E> {
  /// Returns all elements matching the given [predicate].
  Iterable<E> filter(bool Function(E element) predicate) => where(predicate);
}

extension IterableFilterIndexed<E> on Iterable<E> {
  /// Returns all elements that satisfy the given [predicate].
  Iterable<E> filterIndexed(bool Function(E element, int index) predicate) =>
      IterableWhereIndexed(this).whereIndexed(predicate);
}

extension IterableFilterTo<E> on Iterable<E> {
  /// Appends all elements matching the given [predicate] to the given
  /// [destination].
  void filterTo(List<E> destination, bool Function(E element) predicate) =>
      whereTo(destination, predicate);
}

extension IterableFilterIndexedTo<E> on Iterable<E> {
  /// Appends all elements matching the given [predicate] to the given
  /// [destination].
  void filterIndexedTo(
    List<E> destination,
    bool Function(E element, int index) predicate,
  ) =>
      whereIndexedTo(destination, predicate);
}

extension IterableFilterNot<E> on Iterable<E> {
  /// Returns all elements not matching the given [predicate].
  Iterable<E> filterNot(bool Function(E element) predicate) =>
      IterableWhereNot(this).whereNot(predicate);
}

extension IterableFilterNotIndexed<E> on Iterable<E> {
  /// Returns all elements not matching the given [predicate].
  Iterable<E> filterNotIndexed(bool Function(E element, int index) predicate) =>
      IterableWhereNotIndexed(this).whereNotIndexed(predicate);
}

extension IterableFilterNotTo<E> on Iterable<E> {
  /// Appends all elements not matching the given [predicate] to the given
  /// [destination].
  void filterNotTo(List<E> destination, bool Function(E element) predicate) =>
      whereNotTo(destination, predicate);
}

extension IterableFilterNotToIndexed<E> on Iterable<E> {
  /// Appends all elements not matching the given [predicate] to the given
  /// [destination].
  void filterNotToIndexed(
    List<E> destination,
    bool Function(E element, int index) predicate,
  ) =>
      whereNotToIndexed(destination, predicate);
}

extension IterableFilterNotNull<E> on Iterable<E?> {
  /// Returns a new lazy [Iterable] with all elements which are not null.
  Iterable<E> filterNotNull() => whereNotNull();
}

extension IterableWhereIndexed<E> on Iterable<E> {
  /// Returns all elements that satisfy the given [predicate].
  Iterable<E> whereIndexed(
    bool Function(E element, int index) predicate,
  ) sync* {
    var index = 0;
    for (final element in this) {
      if (predicate(element, index++)) {
        yield element;
      }
    }
  }
}

extension IterableWhereTo<E> on Iterable<E> {
  /// Appends all elements matching the given [predicate] to the given
  /// [destination].
  void whereTo(List<E> destination, bool Function(E element) predicate) {
    for (final element in this) {
      if (predicate(element)) {
        destination.add(element);
      }
    }
  }
}

extension IterableWhereIndexedTo<E> on Iterable<E> {
  /// Appends all elements matching the given [predicate] to the given
  /// [destination].
  void whereIndexedTo(
    List<E> destination,
    bool Function(E element, int index) predicate,
  ) {
    var index = 0;
    for (final element in this) {
      if (predicate(element, index++)) {
        destination.add(element);
      }
    }
  }
}

extension IterableWhereNot<E> on Iterable<E> {
  /// Returns all elements not matching the given [predicate].
  Iterable<E> whereNot(bool Function(E element) predicate) sync* {
    for (final element in this) {
      if (!predicate(element)) {
        yield element;
      }
    }
  }
}

extension IterableWhereNotIndexed<E> on Iterable<E> {
  /// Returns all elements not matching the given [predicate].
  Iterable<E> whereNotIndexed(
    bool Function(E element, int index) predicate,
  ) sync* {
    var index = 0;
    for (final element in this) {
      if (!predicate(element, index++)) {
        yield element;
      }
    }
  }
}

extension IterableWhereNotTo<E> on Iterable<E> {
  /// Appends all elements not matching the given [predicate] to the given
  /// [destination].
  void whereNotTo(List<E> destination, bool Function(E element) predicate) {
    for (final element in this) {
      if (!predicate(element)) {
        destination.add(element);
      }
    }
  }
}

extension IterableWhereNotToIndexed<E> on Iterable<E> {
  /// Appends all elements not matching the given [predicate] to the given
  /// [destination].
  void whereNotToIndexed(
    List<E> destination,
    bool Function(E element, int index) predicate,
  ) {
    var index = 0;
    for (final element in this) {
      if (!predicate(element, index++)) {
        destination.add(element);
      }
    }
  }
}

extension IterableWhereNotNull<E> on Iterable<E?> {
  /// Returns a new lazy [Iterable] with all elements which are not null.
  Iterable<E> whereNotNull() => where((element) => element != null).cast<E>();
}

extension IterableMapNotNull<E> on Iterable<E> {
  /// Returns a new lazy [Iterable] containing only the non-null results of
  /// applying the given [transform] function to each element in the original
  /// collection.
  Iterable<R> mapNotNull<R>(R? Function(E element) transform) sync* {
    for (final element in this) {
      final result = transform(element);
      if (result != null) {
        yield result;
      }
    }
  }
}

extension IterableMapIndexed<E> on Iterable<E> {
  /// Returns a new lazy [Iterable] containing the results of applying the
  /// given [transform] function to each element and its index in the original
  /// collection.
  Iterable<R> mapIndexed<R>(R Function(int index, E) transform) sync* {
    var index = 0;
    for (final element in this) {
      yield transform(index++, element);
    }
  }
}

extension IterableMapIndexedNotNull<E> on Iterable<E> {
  /// Returns a new lazy [Iterable] containing only the non-null results of
  /// applying the given [transform] function to each element and its index
  /// in the original collection.
  Iterable<R> mapIndexedNotNull<R>(R? Function(int index, E) transform) sync* {
    var index = 0;
    for (final element in this) {
      final result = transform(index++, element);
      if (result != null) {
        yield result;
      }
    }
  }
}

extension IterableOnEach<E> on Iterable<E> {
  /// Returns a new lazy [Iterable] which performs the given action on each
  /// element.
  Iterable<E> onEach(void Function(E element) action) sync* {
    for (final element in this) {
      action(element);
      yield element;
    }
  }
}

extension IterableDistinct<E> on Iterable<E> {
  /// Returns a new lazy [Iterable] containing only distinct elements from the
  /// collection.
  ///
  /// The elements in the resulting list are in the same order as they were in
  /// the source collection.
  Iterable<E> distinct() sync* {
    final existing = HashSet<E>();
    for (final current in this) {
      if (existing.add(current)) {
        yield current;
      }
    }
  }
}

extension IterableDistinctBy<E> on Iterable<E> {
  /// Returns a new lazy [Iterable] containing only elements from the collection
  /// having distinct keys returned by the given [selector] function.
  ///
  /// The elements in the resulting list are in the same order as they were in
  /// the source collection.
  Iterable<E> distinctBy<R>(R Function(E element) selector) sync* {
    final existing = HashSet<R>();
    for (final current in this) {
      if (existing.add(selector(current))) {
        yield current;
      }
    }
  }
}

extension IterableChunked<E> on Iterable<E> {
  /// Splits this collection into a new lazy [Iterable] of lists each not
  /// exceeding the given [size].
  ///
  /// The last list in the resulting list may have less elements than the given
  /// [size].
  ///
  /// [size] must be positive and can be greater than the number of elements in
  /// this collection.
  Iterable<List<E>> chunked(int size) sync* {
    if (size < 1) {
      throw ArgumentError('Requested chunk size $size is less than one.');
    }

    var currentChunk = <E>[];
    for (final current in this) {
      currentChunk.add(current);
      if (currentChunk.length >= size) {
        yield currentChunk;
        currentChunk = <E>[];
      }
    }
    if (currentChunk.isNotEmpty) {
      yield currentChunk;
    }
  }
}

extension IterableChunkWhile<E> on Iterable<E> {
  /// Splits this collection into a lazy [Iterable] of chunks, where chunks are
  /// created as long as [predicate] is true for a pair of entries.
  ///
  /// For example, one-by-one increasing subsequences can be chunked as follows:
  /// ```dart
  /// final list = [1, 2, 4, 9, 10, 11, 12, 15, 16, 19, 20, 21];
  /// final increasingSubSequences = list.chunkWhile((a, b) => a + 1 == b);
  /// ```
  ///
  /// Here, `increasingSubSequences` would consist of `[1, 2]`, `[4]`,
  /// `[9, 10, 11]`, `[12]`, `[15, 16]` and finally `[19, 20, 21]`.
  ///
  /// See also:
  ///  - [splitWhen], which works similarly but with a reverted [predicate].
  Iterable<List<E>> chunkWhile(bool Function(E, E) predicate) sync* {
    var currentChunk = <E>[];
    var hasPrevious = false;
    late E previous;

    for (final element in this) {
      if (!hasPrevious || predicate(previous, element)) {
        // keep element in current chunk
        currentChunk.add(element);
      } else {
        // start a new chunk containing the new element
        yield currentChunk;
        currentChunk = [element];
      }

      previous = element;
      hasPrevious = true;
    }

    if (currentChunk.isNotEmpty) yield currentChunk;
  }
}

extension IterableSplitWhen<E> on Iterable<E> {
  /// Splits this collection into a lazy [Iterable], where each split will be
  /// make if [predicate] returns true for a pair of entries.
  ///
  /// For example, one could split the iterable at each changed value like this:
  /// ```dart
  /// final list = [1, 1, 1, 2, 2, 1, 4, 4];
  /// final splitted = list.splitWhen((a, b) => a != b);
  /// ```
  ///
  /// In that example, `splitted` would consist of `[1, 1, 1, 1]`, `[2, 2]`,
  /// `[1]`, `[4, 4]`.
  ///
  /// See also:
  ///  - [chunkWhile], which works similarly but with a reverted [predicate].
  Iterable<List<E>> splitWhen(bool Function(E, E) predicate) {
    return chunkWhile((a, b) => !predicate(a, b));
  }
}

extension IterableWindowed<E> on Iterable<E> {
  /// Returns a new lazy [Iterable] of windows of the given [size] sliding along
  /// this collection with the given [step].
  ///
  /// The last list may have less elements than the given size.
  ///
  /// Both [size] and [step] must be positive and can be greater than the number
  /// of elements in this collection.
  Iterable<List<E>> windowed(
    int size, {
    int step = 1,
    bool partialWindows = false,
  }) sync* {
    final gap = step - size;
    if (gap >= 0) {
      var buffer = <E>[];
      var skip = 0;
      for (final element in this) {
        if (skip > 0) {
          skip -= 1;
          continue;
        }
        buffer.add(element);
        if (buffer.length == size) {
          yield buffer;
          buffer = <E>[];
          skip = gap;
        }
      }
      if (buffer.isNotEmpty && (partialWindows || buffer.length == size)) {
        yield buffer;
      }
    } else {
      final buffer = ListQueue<E>(size);
      for (final element in this) {
        buffer.add(element);
        if (buffer.length == size) {
          yield buffer.toList();
          for (var i = 0; i < step; i++) {
            buffer.removeFirst();
          }
        }
      }
      if (partialWindows) {
        while (buffer.length > step) {
          yield buffer.toList();
          for (var i = 0; i < step; i++) {
            buffer.removeFirst();
          }
        }
        if (buffer.isNotEmpty) {
          yield buffer.toList();
        }
      }
    }
  }
}

extension IterableFlatMap<E> on Iterable<E> {
  /// Returns a new lazy [Iterable] of all elements yielded from results of
  /// [transform] function being invoked on each element of this collection.
  Iterable<R> flatMap<R>(Iterable<R> Function(E element) transform) sync* {
    for (final current in this) {
      yield* transform(current);
    }
  }
}

extension IterableCycle<E> on Iterable<E> {
  /// Returns a new lazy [Iterable] which iterates over this collection [n]
  /// times.
  ///
  /// When it reaches the end, it jumps back to the beginning. Returns `null`
  /// [n] times if the collection is empty.
  ///
  /// If [n] is omitted, the Iterable cycles forever.
  Iterable<E> cycle([int? n]) sync* {
    var it = iterator;
    if (!it.moveNext()) {
      return;
    }
    if (n == null) {
      yield it.current;
      // ignore: literal_only_boolean_expressions
      while (true) {
        while (it.moveNext()) {
          yield it.current;
        }
        it = iterator;
      }
    } else {
      var count = 0;
      yield it.current;
      while (count++ < n) {
        while (it.moveNext()) {
          yield it.current;
        }
        it = iterator;
      }
    }
  }
}

extension IterableIntersect<E> on Iterable<E> {
  /// Returns a new lazy [Iterable] containing all elements that are contained
  /// by both this collection and the [other] collection.
  ///
  /// The returned collection preserves the element iteration order of the
  /// this collection.
  Iterable<E> intersect(Iterable<E> other) sync* {
    final second = HashSet<E>.from(other);
    final output = HashSet<E>();
    for (final current in this) {
      if (second.contains(current)) {
        if (output.add(current)) {
          yield current;
        }
      }
    }
  }
}

extension IterableExcept<E> on Iterable<E> {
  /// Returns a new lazy [Iterable] containing all elements of this collection
  /// except the elements contained in the given [elements] collection.
  Iterable<E> except(Iterable<E> elements) sync* {
    for (final current in this) {
      if (!elements.contains(current)) yield current;
    }
  }
}

extension IterableMinus<E> on Iterable<E> {
  /// Returns a new list containing all elements of this collection except the
  /// elements contained in the given [elements] collection.
  List<E> operator -(Iterable<E> elements) => except(elements).toList();
}

extension IterableExceptElement<E> on Iterable<E> {
  /// Returns a new lazy [Iterable] containing all elements of this collection
  /// except the given [element].
  Iterable<E> exceptElement(E element) sync* {
    for (final current in this) {
      if (element != current) yield current;
    }
  }
}

extension IterablePrepend<E> on Iterable<E> {
  /// Returns a new lazy [Iterable] containing all elements of this collection
  /// and then all elements of the given [elements] collection.
  Iterable<E> prepend(Iterable<E> elements) sync* {
    yield* elements;
    yield* this;
  }
}

extension IterablePrependElement<E> on Iterable<E> {
  /// Returns a new lazy [Iterable] containing all elements of this collection
  /// and then the given [element].
  Iterable<E> prependElement(E element) sync* {
    yield element;
    yield* this;
  }
}

extension IterableAppend<E> on Iterable<E> {
  /// Returns a new lazy [Iterable] containing all elements of the given
  /// [elements] collection and then all elements of this collection.
  Iterable<E> append(Iterable<E> elements) sync* {
    yield* this;
    yield* elements;
  }
}

extension IterablePlus<E> on Iterable<E> {
  /// Returns a new list containing all elements of the given [elements]
  /// collection and then all elements of this collection.
  List<E> operator +(Iterable<E> elements) => append(elements).toList();
}

extension IterableAppendElement<E> on Iterable<E> {
  /// Returns a new lazy [Iterable] containing the given [element] and then all
  /// elements of this collection.
  Iterable<E> appendElement(E element) sync* {
    yield* this;
    yield element;
  }
}

extension IterableUnion<E> on Iterable<E> {
  /// Returns a new lazy [Iterable] containing all distinct elements from
  /// both collections.
  ///
  /// The returned set preserves the element iteration order of this collection.
  /// Those elements of the [other] collection that are unique are iterated in
  /// the end in the order of the [other] collection.
  Iterable<E> union(Iterable<E> other) sync* {
    final existing = HashSet<E>();
    for (final element in this) {
      if (existing.add(element)) yield element;
    }

    for (final element in other) {
      if (existing.add(element)) yield element;
    }
  }
}

extension IterableZip<E> on Iterable<E> {
  /// Returns a new lazy [Iterable] of values built from the elements of this
  /// collection and the [other] collection with the same index.
  ///
  /// Using the provided [transform] function applied to each pair of elements.
  /// The returned list has length of the shortest collection.
  ///
  /// Example (with added type definitions for [transform] parameters):
  ///
  /// ```dart
  ///final amounts = [2, 3, 4];
  ///final animals = ['dogs', 'birds', 'cats'];
  ///final all = amounts.zip(
  ///  animals,
  ///  (int amount, String animal) => '$amount $animal'
  ///);  // returns: ['2 dogs', '3 birds', '4 cats']
  /// ```
  Iterable<V> zip<R, V>(
    Iterable<R> other,
    V Function(E a, R b) transform,
  ) sync* {
    final it1 = iterator;
    final it2 = other.iterator;
    while (it1.moveNext() && it2.moveNext()) {
      yield transform(it1.current, it2.current);
    }
  }
}

extension IterableToIterable<E> on Iterable<E> {
  /// Returns a new lazy [Iterable] with all elements of this collection.
  Iterable<E> toIterable() sync* {
    yield* this;
  }
}

extension IterableAsStream<E> on Iterable<E> {
  /// Returns a new [Stream] with all elements of this collection.
  Stream<E> asStream() => Stream.fromIterable(this);
}

extension IterableToHashSet<E> on Iterable<E> {
  /// Returns a new [HashSet] with all distinct elements of this collection.
  HashSet<E> toHashSet() => HashSet.from(this);
}

extension IterableToUnmodifiable<E> on Iterable<E> {
  /// Returns an unmodifiable List view of this collection.
  List<E> toUnmodifiable() => collection.UnmodifiableListView(this);
}

extension IterableShuffled<E> on Iterable<E> {
  /// Returns a new, randomly shuffled list.
  ///
  /// If [random] is given, it is being used for random number generation.
  List<E> shuffled([Random? random]) => toList()..shuffle(random);
}

extension IterableAssociate<E> on Iterable<E> {
  /// Returns a Map containing key-value pairs provided by [transform] function
  /// applied to elements of this collection.
  ///
  /// If any of two pairs would have the same key the last one gets added to the
  /// map.
  Map<K, V> associate<K, V>(MapEntry<K, V> Function(E element) transform) {
    final map = <K, V>{};
    for (final element in this) {
      final entry = transform(element);
      map[entry.key] = entry.value;
    }
    return map;
  }
}

extension IterableAssociateBy<E> on Iterable<E> {
  /// Returns a Map containing the elements from the collection indexed by
  /// the key returned from [keySelector] function applied to each element.
  ///
  /// If any two elements would have the same key returned by [keySelector] the
  /// last one gets added to the map.
  Map<K, E> associateBy<K>(K Function(E element) keySelector) {
    final map = <K, E>{};
    for (final current in this) {
      map[keySelector(current)] = current;
    }
    return map;
  }
}

extension IterableAssociateWith<E> on Iterable<E> {
  /// Returns a Map containing the values returned from [valueSelector] function
  /// applied to each element indexed by the elements from the collection.
  ///
  /// If any of elements (-> keys) would be the same the last one gets added
  /// to the map.
  Map<E, V> associateWith<V>(V Function(E element) valueSelector) {
    final map = <E, V>{};
    for (final current in this) {
      map[current] = valueSelector(current);
    }
    return map;
  }
}

extension IterableGroupBy<E> on Iterable<E> {
  /// Groups elements of the original collection by the key returned by the
  /// given [keySelector] function applied to each element and returns a map.
  ///
  /// Each group key is associated with a list of corresponding elements.
  ///
  /// The returned map preserves the entry iteration order of the keys produced
  /// from the original collection.
  Map<K, List<E>> groupBy<K>(K Function(E element) keySelector) {
    return collection.groupBy(this, keySelector);
  }
}

extension IterablePartition<E> on Iterable<E> {
  /// Splits the collection into two lists according to [predicate].
  ///
  /// The first list contains elements for which [predicate] yielded true,
  /// while the second list contains elements for which [predicate] yielded
  /// false.
  List<List<E>> partition(bool Function(E element) predicate) {
    final t = <E>[];
    final f = <E>[];
    for (final element in this) {
      if (predicate(element)) {
        t.add(element);
      } else {
        f.add(element);
      }
    }
    return [t, f];
  }
}

extension IterableCached<E> on Iterable<E> {
  /// Returns a new lazy [Iterable] that caches the computation of the current
  /// [Iterable].
  ///
  /// This is an alternative to [toList] to not recompute the collection
  /// multiple times, without having to lose the lazy loading aspect of
  /// [Iterable].
  Iterable<E> get cached => _CachedIterable<E>(this);
}

class _CachedIterable<T> extends IterableBase<T> {
  _CachedIterable(Iterable<T> iterable)
      : _uncomputedIterator = iterable.iterator;

  final Iterator<T> _uncomputedIterator;
  final _cache = _IterableCache<T>(null);

  @override
  Iterator<T> get iterator => _CachedIterator<T>(_cache, _uncomputedIterator);
}

class _CachedIterator<T> extends Iterator<T> {
  _CachedIterator(_IterableCache<T> cache, this._uncomputedIterator)
      // ignore: prefer_initializing_formals
      : _cache = cache,
        _latestValidCache = cache;

  _IterableCache<T>? _cache;

  /// A reference to the latest non-null [_cache].
  ///
  /// This allows adding new items to the cache
  _IterableCache<T> _latestValidCache;
  final Iterator<T> _uncomputedIterator;

  @override
  T get current => _current as T;
  T? _current;

  @override
  bool moveNext() {
    final next = _cache?.next;
    _cache = next;
    if (next != null) {
      _current = next.value;
      _latestValidCache = next;
      return true;
    }
    if (_uncomputedIterator.moveNext()) {
      _current = _uncomputedIterator.current;
      assert(_latestValidCache.next == null);
      _latestValidCache.next = _IterableCache(current);
      _latestValidCache = _latestValidCache.next!;
      return true;
    }
    return false;
  }
}

/// A LinkedList that does not throw concurrent modification errors.
class _IterableCache<T> {
  _IterableCache(this.value);

  _IterableCache<T>? next;
  final T? value;
}

extension IterableIterableX<E> on Iterable<Iterable<E>> {
  /// Returns a new lazy [Iterable] of all elements from all collections in this
  /// collection.
  ///
  /// ```dart
  /// final nestedList = List([[1, 2, 3], [4, 5, 6]]);
  /// final flattened = nestedList.flatten(); // [1, 2, 3, 4, 5, 6]
  /// ```
  Iterable<E> flatten() sync* {
    for (final current in this) {
      yield* current;
    }
  }
}

extension IterableFutureX<E> on Iterable<Future<E>> {
  /// Create a stream from a group of futures.
  ///
  /// The stream reports the results of the futures on the stream in the order
  /// in which the futures complete.
  /// Each future provides either a data event or an error event,
  /// depending on how the future completes.
  ///
  /// If some futures have already completed when `Stream.fromFutures` is
  /// called, their results will be emitted in some unspecified order.
  ///
  /// When all futures have completed, the stream is closed.
  Stream<E> asStreamAwaited() => Stream.fromFutures(this);
}

extension IterableStartsWithExtension<E> on Iterable<E> {
  /// Returns if this [Iterable] starts with the elements of [otherIterable].
  ///
  /// If [otherIterable] is empty, `true` is returned. If [otherIterable] has
  /// more elements than this [Iterable], `false` is returned.
  ///
  /// ```dart
  /// [1, 2, 3].startsWith([]); // -> true
  /// [1, 2, 3].startsWith([1]); // -> true
  /// [1, 2, 3].startsWith([1, 2]); // -> true
  /// [1, 2, 3].startsWith([1, 2, 3]); // -> true
  /// [1, 2, 3].startsWith([1, 2, 3, 4]); // -> false
  /// [1, 2, 3].startsWith([2, 3]); // -> false
  /// ```
  bool startsWith(Iterable<E> otherIterable) {
    final thisIterator = iterator;
    final otherIterator = otherIterable.iterator;
    if (!otherIterator.moveNext()) return true;
    do {
      // this iterator is empty or the current elements are different
      if (!thisIterator.moveNext() ||
          otherIterator.current != thisIterator.current) {
        return false;
      }
    } while (otherIterator.moveNext());
    return true;
  }
}
