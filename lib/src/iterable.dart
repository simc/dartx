part of dartx;

const _groupBy = groupBy;

/// Extensions for iterables
extension IterableX<E> on Iterable<E> {
  /// Second element.
  ///
  /// ```dart
  /// [1, 2, 3].second; // 2
  /// ```
  E get second => elementAt(1);

  /// Third element.
  ///
  /// ```dart
  /// [1, 2, 3].third; // 3
  /// ```
  E get third => elementAt(2);

  /// Fourth element.
  ///
  /// ```dart
  /// [1, 2, 3, 4].fourth; // 4
  /// ```
  E get fourth => elementAt(3);

  /// Returns an element at the given [index] or `null` if the [index] is out of
  /// bounds of this collection.
  ///
  /// ```dart
  /// var list = [1, 2, 3, 4];
  /// var first = list.elementAtOrNull(0); // 1
  /// var fifth = list.elementAtOrNull(4); // null
  /// ```
  E elementAtOrNull(int index) {
    return elementAtOrElse(index, (_) => null);
  }

  /// Returns an element at the given [index] or [defaultValue] if the [index]
  /// is out of bounds of this collection.
  ///
  /// ```dart
  /// var list = [1, 2, 3, 4];
  /// var first = list.elementAtOrDefault(0, -1); // 1
  /// var fifth = list.elementAtOrDefault(4, -1); // -1
  /// ```
  E elementAtOrDefault(int index, E defaultValue) {
    return elementAtOrElse(index, (_) => defaultValue);
  }

  /// Returns an element at the given [index] or the result of calling the
  /// [defaultValue] function if the [index] is out of bounds of this
  /// collection.
  ///
  /// ```dart
  /// var list = [1, 2, 3, 4];
  /// var first = list.elementAtOrElse(0); // 1
  /// var fifth = list.elementAtOrElse(4, -1); // -1
  /// ```
  E elementAtOrElse(int index, E Function(int index) defaultValue) {
    if (index < 0) return defaultValue(index);
    var count = 0;
    for (var element in this) {
      if (index == count++) return element;
    }
    return defaultValue(index);
  }

  /// First element or `null` if the collection is empty.
  ///
  /// ```dart
  /// var first = [1, 2, 3, 4].firstOrNull; // 1
  /// var emptyFirst = [].firstOrNull; // null
  /// ```
  E get firstOrNull => elementAtOrNull(0);

  /// First element or `defaultValue` if the collection is empty.
  ///
  /// ```dart
  /// var first = [1, 2, 3, 4].firstOrDefault(-1); // 1
  /// var emptyFirst = [].firstOrDefault(-1); // -1
  /// ```
  E firstOrDefault(E defaultValue) => firstOrNull ?? defaultValue;

  /// Returns the first element matching the given [predicate], or `null` if no
  /// such element was found.
  ///
  /// ```dart
  /// var list = ['a', 'Test'];
  /// var firstLong= list.firstOrNullWhere((e) => e.length > 1); // 'Test'
  /// var firstVeryLong = list.firstOrNullWhere((e) => e.length > 5); // null
  /// ```
  E firstOrNullWhere(bool Function(E element) predicate) {
    return firstWhere(predicate, orElse: () => null);
  }

  /// Last element or `null` if the collection is empty.
  ///
  /// ```dart
  /// var last = [1, 2, 3, 4].lastOrNull; // 4
  /// var emptyLast = [].firstOrNull; // null
  /// ```
  E get lastOrNull => isNotEmpty ? last : null;

  /// Last element or `defaultValue` if the collection is empty.
  E lastOrElse(E defaultValue) => lastOrNull ?? defaultValue;

  /// Returns the last element matching the given [predicate], or `null` if no
  /// such element was found.
  E lastOrNullWhere(bool Function(E element) predicate) {
    return lastWhere(predicate, orElse: () => null);
  }

  /// Returns an original collection containing all the non-null elements,
  /// throwing an [StateError] if there are any null elements.
  void requireNoNulls() {
    if (any((element) => element == null)) {
      throw StateError('At least one element is null.');
    }
  }

  /// Returns true if all elements match the given [predicate] or if the
  /// collection is empty.
  bool all(bool Function(E element) predicate) {
    for (var element in this) {
      if (!predicate(element)) {
        return false;
      }
    }
    return true;
  }

  /// Returns true if no entries match the given [predicate] or if the
  /// collection is empty.
  bool none(bool Function(E element) predicate) => !any(predicate);

  /// Returns a new list containing elements at indices between [start]
  /// (inclusive) and [end] (inclusive).
  ///
  /// If [end] is omitted, it is being set to `lastIndex`.
  List<E> slice(int start, [int end = -1]) {
    var list = this is List ? this as List<E> : toList();

    if (start < 0) {
      start = start + list.length;
    }
    if (end < 0) {
      end = end + list.length;
    }

    RangeError.checkValidRange(start, end, list.length);

    return list.sublist(start, end + 1);
  }

  /// Performs the given [action] on each element, providing sequential index
  /// with the element.
  void forEachIndexed(void Function(E element, int index) action) {
    var index = 0;
    for (var element in this) {
      action(element, index++);
    }
  }

  /// Checks if all elements in the specified [collection] are contained in
  /// this collection.
  bool containsAll(Iterable<E> collection) {
    for (var element in collection) {
      if (!contains(element)) return false;
    }
    return true;
  }

  /// Checks if any elements in the specified [collection] are contained in
  /// this collection.
  bool containsAny(Iterable<E> collection) {
    for (var element in collection) {
      if (contains(element)) return true;
    }
    return false;
  }

  /// Returns true if this collection is structurally equal to the [other]
  /// collection.
  ///
  /// I.e. contain the same number of the same elements in the same order.
  ///
  /// If [checkEqual] is provided, it is used to check if two elements are the
  /// same.
  bool contentEquals(Iterable<E> other, [bool Function(E a, E b) checkEqual]) {
    var it1 = iterator;
    var it2 = other.iterator;
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

  //Soting operations

  /// Returns a new list with all elements sorted according to natural sort
  /// order.
  List<E> sorted() {
    var list = toList();
    list.sort();
    return list;
  }

  /// Returns a new list with all elements sorted according to descending
  /// natural sort order.
  List<E> sortedDescending() {
    var list = toList();
    list.sort((a, b) => -(a as Comparable).compareTo(b));
    return list;
  }

  /// Returns a new list with all elements sorted according to natural sort
  /// order of the values returned by specified [selector] function.
  ///
  /// To sort by more than one property, `thenBy()` or `thenByDescending()` can
  /// be called afterwards.
  ///
  /// **Note:** The actual sorting is performed when an element is accessed for
  /// the first time.
  _SortedList<E> sortedBy(Comparable Function(E element) selector) {
    return _SortedList<E>._withSelector(this, selector, 1, null);
  }

  /// Returns a new list with all elements sorted according to descending
  /// natural sort order of the values returned by specified [selector]
  /// function.
  ///
  /// To sort by more than one property, `thenBy()` or `thenByDescending` can
  /// be called afterwards.
  ///
  /// **Note:** The actual sorting is performed when an element is accessed for
  /// the first time.
  _SortedList<E> sortedByDescending(Comparable Function(E element) selector) {
    return _SortedList<E>._withSelector(this, selector, -1, null);
  }

  /// Returns a new list with all elements sorted according to specified
  /// [comparator].
  ///
  /// To sort by more than one property, `thenBy()` or `thenByDescending` can
  /// be called afterwards.
  ///
  /// **Note:** The actual sorting is performed when an element is accessed for
  /// the first time.
  _SortedList<E> sortedWith(Comparator<E> comparator) {
    return _SortedList<E>._(this, comparator);
  }

  /// Creates a string from all the elements separated using [separator] and
  /// using the given [prefix] and [postfix] if supplied.
  ///
  /// If the collection could be huge, you can specify a non-negative value of
  /// [limit], in which case only the first [limit] elements will be appended,
  /// followed by the [truncated] string (which defaults to `'...'`).
  String joinToString({
    String separator = ', ',
    String Function(E element) transform,
    String prefix = '',
    String postfix = '',
    int limit,
    String truncated = '...',
  }) {
    var buffer = StringBuffer();
    var count = 0;
    for (var element in this) {
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

  //Math operations

  /// Returns the sum of all values produced by [selector] function applied to
  /// each element in the collection.
  ///
  /// `null` values are not counted.
  double sumBy(num Function(E element) selector) {
    var sum = 0.0;
    for (var current in this) {
      sum += selector(current) ?? 0;
    }
    return sum;
  }

  /// Returns the average of values returned by [selector] for all elements in
  /// the collection.
  ///
  /// `null` values are counted as 0. Empty collections return `null`.
  double averageBy(num Function(E element) selector) {
    var count = 0;
    num sum = 0;

    for (var current in this) {
      var value = selector(current);
      if (value != null) {
        sum += value;
      }
      count++;
    }

    if (count == 0) {
      throw StateError('No elements in collection');
    } else {
      return sum / count;
    }
  }

  /// Returns the smallest element or `null` if there are no elements.
  ///
  /// All elements must be of type [Comparable].
  E min() => _minMax(-1);

  /// Returns the first element yielding the smallest value of the given
  /// [selector] or `null` if there are no elements.
  E minBy(Comparable Function(E element) selector) => _minMaxBy(-1, selector);

  /// Returns the first element having the smallest value according to the
  /// provided [comparator] or `null` if there are no elements.
  E minWith(Comparator<E> comparator) => _minMaxWith(-1, comparator);

  /// Returns the largest element or `null` if there are no elements.
  ///
  /// All elements must be of type [Comparable].
  E max() => _minMax(1);

  /// Returns the first element yielding the largest value of the given
  /// [selector] or `null` if there are no elements.
  E maxBy(Comparable Function(E element) selector) => _minMaxBy(1, selector);

  /// Returns the first element having the largest value according to the
  /// provided [comparator] or `null` if there are no elements.
  E maxWith(Comparator<E> comparator) => _minMaxWith(1, comparator);

  E _minMax(int order) {
    var it = iterator;
    it.moveNext();
    var currentMin = it.current;

    while (it.moveNext()) {
      if ((it.current as Comparable).compareTo(currentMin) == order) {
        currentMin = it.current;
      }
    }

    return currentMin;
  }

  E _minMaxBy(int order, Comparable Function(E element) selector) {
    var it = iterator;
    it.moveNext();

    var currentMin = it.current;
    var currentMinValue = selector(it.current);
    while (it.moveNext()) {
      var comp = selector(it.current);
      if (comp.compareTo(currentMinValue) == order) {
        currentMin = it.current;
        currentMinValue = comp;
      }
    }

    return currentMin;
  }

  E _minMaxWith(int order, Comparator<E> comparator) {
    var it = iterator;
    it.moveNext();
    var currentMin = it.current;

    while (it.moveNext()) {
      if (comparator(it.current, currentMin) == order) {
        currentMin = it.current;
      }
    }

    return currentMin;
  }

  /// Returns the number of elements matching the given [predicate].
  ///
  /// If no [predicate] is given, this equals to [length].
  int count([bool Function(E element) predicate]) {
    var count = 0;
    if (predicate == null) {
      return length;
    } else {
      for (var current in this) {
        if (predicate(current)) {
          count++;
        }
      }
    }

    return count;
  }

  // Transformations

  /// Returns an [Iterable] of the objects in this list in reverse order.
  Iterable<E> get reversed {
    return this is List<E> ? (this as List<E>).reversed : toList().reversed;
  }

  /// Returns a list containing first [n] elements.
  ///
  /// ```dart
  /// var chars = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  /// print(chars.take(3)) // [1, 2, 3]
  /// print(chars.takeWhile((it) => it < 5) // [1, 2, 3, 4]
  /// print(chars.takeLast(2)) // [8, 9]
  /// print(chars.takeLastWhile((it) => it > 5 }) // [6, 7, 8, 9]
  /// ```
  List<E> takeFirst(int n) {
    var list = this is List<E> ? this as List<E> : toList();
    return list.sublist(0, n);
  }

  /// Returns a list containing last [n] elements.
  ///
  /// ```dart
  /// var chars = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  /// print(chars.take(3)) // [1, 2, 3]
  /// print(chars.takeWhile((it) => it < 5) // [1, 2, 3, 4]
  /// print(chars.takeLast(2)) // [8, 9]
  /// print(chars.takeLastWhile((it) => it > 5 }) // [6, 7, 8, 9]
  /// ```
  List<E> takeLast(int n) {
    var list = this is List<E> ? this as List<E> : toList();
    return list.sublist(length - n);
  }

  /// Returns a list containing the elements at every [n]th index, starting
  /// from the index [offset].
  ///
  /// ```dart
  /// var chars = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  /// print(chars.takeIndexInterval(2)); // [1, 3, 5, 7, 9]
  /// print(chars.takeIndexInterval(2, offset: 1)); // [2, 4, 6, 8]
  /// ```
  List<E> indexIntervals(int n, {int offset = 0}) {
    var origList = this is List<E> ? this as List<E> : toList();
    if (n < 1) throw ArgumentError('interval must be >= 1.');
    if (offset < 0) throw ArgumentError('offset must be >= 0');
    var returnList = <E>[];
    for (var i = offset; i < origList.length; i += n) {
      returnList.add(origList[i]);
    }
    return returnList;
  }

  //// Returns the first elements satisfying the given [predicate].
  ///
  /// ```dart
  /// var chars = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  /// print(chars.take(3)) // [1, 2, 3]
  /// print(chars.takeWhile((it) => it < 5) // [1, 2, 3, 4]
  /// print(chars.takeLast(2)) // [8, 9]
  /// print(chars.takeLastWhile((it) => it > 5 }) // [6, 7, 8, 9]
  /// ```
  Iterable<E> firstWhile(bool Function(E element) predicate) sync* {
    for (var element in this) {
      if (!predicate(element)) break;
      yield element;
    }
  }

  /// Returns the last elements satisfying the given [predicate].
  ///
  /// ```dart
  /// var chars = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  /// print(chars.take(3)) // [1, 2, 3]
  /// print(chars.takeWhile((it) => it < 5) // [1, 2, 3, 4]
  /// print(chars.takeLast(2)) // [8, 9]
  /// print(chars.takeLastWhile((it) => it > 5 }) // [6, 7, 8, 9]
  /// ```
  Iterable<E> lastWhile(bool Function(E element) predicate) {
    var list = ListQueue<E>();
    for (var element in reversed) {
      if (!predicate(element)) break;
      list.addFirst(element);
    }
    return list;
  }

  /// Returns all elements matching the given [predicate].
  Iterable<E> filter(bool Function(E element) predicate) => where(predicate);

  /// Returns all elements that satisfy the given [predicate].
  Iterable<E> filterIndexed(bool Function(E element, int index) predicate) =>
      whereIndexed(predicate);

  /// Appends all elements matching the given [predicate] to the given
  /// [destination].
  void filterTo(List<E> destination, bool Function(E element) predicate) =>
      whereTo(destination, predicate);

  /// Appends all elements matching the given [predicate] to the given
  /// [destination].
  void filterIndexedTo(
          List<E> destination, bool Function(E element, int index) predicate) =>
      whereIndexedTo(destination, predicate);

  /// Returns all elements not matching the given [predicate].
  Iterable<E> filterNot(bool Function(E element) predicate) =>
      whereNot(predicate);

  /// Returns all elements not matching the given [predicate].
  Iterable<E> filterNotIndexed(bool Function(E element, int index) predicate) =>
      whereNotIndexed(predicate);

  /// Appends all elements not matching the given [predicate] to the given
  /// [destination].
  void filterNotTo(List<E> destination, bool Function(E element) predicate) =>
      whereNotTo(destination, predicate);

  /// Appends all elements not matching the given [predicate] to the given
  /// [destination].
  void filterNotToIndexed(
          List<E> destination, bool Function(E element, int index) predicate) =>
      whereNotToIndexed(destination, predicate);

  /// Returns a new lazy [Iterable] with all elements which are not null.
  Iterable<E> filterNotNull() => where((element) => element != null);

  /// Returns all elements that satisfy the given [predicate].
  Iterable<E> whereIndexed(
      bool Function(E element, int index) predicate) sync* {
    var index = 0;
    for (var element in this) {
      if (predicate(element, index++)) {
        yield element;
      }
    }
  }

  /// Appends all elements matching the given [predicate] to the given
  /// [destination].
  void whereTo(List<E> destination, bool Function(E element) predicate) {
    for (var element in this) {
      if (predicate(element)) {
        destination.add(element);
      }
    }
  }

  /// Appends all elements matching the given [predicate] to the given
  /// [destination].
  void whereIndexedTo(
      List<E> destination, bool Function(E element, int index) predicate) {
    var index = 0;
    for (var element in this) {
      if (predicate(element, index++)) {
        destination.add(element);
      }
    }
  }

  /// Returns all elements not matching the given [predicate].
  Iterable<E> whereNot(bool Function(E element) predicate) sync* {
    for (var element in this) {
      if (!predicate(element)) {
        yield element;
      }
    }
  }

  /// Returns all elements not matching the given [predicate].
  Iterable<E> whereNotIndexed(
      bool Function(E element, int index) predicate) sync* {
    var index = 0;
    for (var element in this) {
      if (!predicate(element, index++)) {
        yield element;
      }
    }
  }

  /// Appends all elements not matching the given [predicate] to the given
  /// [destination].
  void whereNotTo(List<E> destination, bool Function(E element) predicate) {
    for (var element in this) {
      if (!predicate(element)) {
        destination.add(element);
      }
    }
  }

  /// Appends all elements not matching the given [predicate] to the given
  /// [destination].
  void whereNotToIndexed(
      List<E> destination, bool Function(E element, int index) predicate) {
    var index = 0;
    for (var element in this) {
      if (!predicate(element, index++)) {
        destination.add(element);
      }
    }
  }

  /// Returns a new lazy [Iterable] with all elements which are not null.
  Iterable<E> whereNotNull() => where((element) => element != null);

  /// Returns a new lazy [Iterable] containing only the non-null results of
  /// applying the given [transform] function to each element in the original
  /// collection.
  Iterable<R> mapNotNull<R>(R Function(E element) transform) sync* {
    for (var element in this) {
      var result = transform(element);
      if (result != null) {
        yield result;
      }
    }
  }

  /// Returns a new lazy [Iterable] containing the results of applying the
  /// given [transform] function to each element and its index in the original
  /// collection.
  Iterable<R> mapIndexed<R>(R Function(int index, E) transform) sync* {
    var index = 0;
    for (var element in this) {
      yield transform(index++, element);
    }
  }

  /// Returns a new lazy [Iterable] containing only the non-null results of
  /// applying the given [transform] function to each element and its index
  /// in the original collection.
  Iterable<R> mapIndexedNotNull<R>(R Function(int index, E) transform) sync* {
    var index = 0;
    for (var element in this) {
      final result = transform(index++, element);
      if (result != null) {
        yield result;
      }
    }
  }

  /// Returns a new lazy [Iterable] which performs the given action on each
  /// element.
  Iterable<E> onEach(void Function(E element) action) sync* {
    for (var element in this) {
      action(element);
      yield element;
    }
  }

  /// Returns a new lazy [Iterable] containing only distinct elements from the
  /// collection.
  ///
  /// The elements in the resulting list are in the same order as they were in
  /// the source collection.
  Iterable<E> distinct() sync* {
    var existing = HashSet<E>();
    for (var current in this) {
      if (existing.add(current)) {
        yield current;
      }
    }
  }

  /// Returns a new lazy [Iterable] containing only elements from the collection
  /// having distinct keys returned by the given [selector] function.
  ///
  /// The elements in the resulting list are in the same order as they were in
  /// the source collection.
  Iterable<E> distinctBy<R>(R Function(E element) selector) sync* {
    var existing = HashSet<R>();
    for (var current in this) {
      if (existing.add(selector(current))) {
        yield current;
      }
    }
  }

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
    for (var current in this) {
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
    /*late*/
    E previous;

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
    var gap = step - size;
    if (gap >= 0) {
      var buffer = <E>[];
      var skip = 0;
      for (var element in this) {
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
      var buffer = ListQueue<E>(size);
      for (var element in this) {
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

  /// Returns a new lazy [Iterable] of all elements yielded from results of
  /// [transform] function being invoked on each element of this collection.
  Iterable<R> flatMap<R>(Iterable<R> Function(E element) transform) sync* {
    for (var current in this) {
      yield* transform(current);
    }
  }

  /// Returns a new lazy [Iterable] which iterates over this collection [n]
  /// times.
  ///
  /// When it reaches the end, it jumps back to the beginning. Returns `null`
  /// [n] times if the collection is empty.
  ///
  /// If [n] is omitted, the Iterable cycles forever.
  Iterable<E> cycle([int n]) sync* {
    var it = iterator;
    if (!it.moveNext()) {
      return;
    }
    if (n == null) {
      yield it.current;
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

  // Operations with other iterables

  /// Returns a new lazy [Iterable] containing all elements that are contained
  /// by both this collection and the [other] collection.
  ///
  /// The returned collection preserves the element iteration order of the
  /// this collection.
  Iterable<E> intersect(Iterable<E> other) sync* {
    var second = HashSet<E>.from(other);
    var output = HashSet<E>();
    for (var current in this) {
      if (second.contains(current)) {
        if (output.add(current)) {
          yield current;
        }
      }
    }
  }

  /// Returns a new lazy [Iterable] containing all elements of this collection
  /// except the elements contained in the given [elements] collection.
  Iterable<E> except(Iterable<E> elements) sync* {
    for (var current in this) {
      if (!elements.contains(current)) yield current;
    }
  }

  /// Returns a new list containing all elements of this collection except the
  /// elements contained in the given [elements] collection.
  List<E> operator -(Iterable<E> elements) => except(elements).toList();

  /// Returns a new lazy [Iterable] containing all elements of this collection
  /// except the given [element].
  Iterable<E> exceptElement(E element) sync* {
    for (var current in this) {
      if (element != current) yield current;
    }
  }

  /// Returns a new lazy [Iterable] containing all elements of this collection
  /// and then all elements of the given [elements] collection.
  Iterable<E> prepend(Iterable<E> elements) sync* {
    yield* elements;
    yield* this;
  }

  /// Returns a new lazy [Iterable] containing all elements of this collection
  /// and then the given [element].
  Iterable<E> prependElement(E element) sync* {
    yield element;
    yield* this;
  }

  /// Returns a new lazy [Iterable] containing all elements of the given
  /// [elements] collection and then all elements of this collection.
  Iterable<E> append(Iterable<E> elements) sync* {
    yield* this;
    yield* elements;
  }

  /// Returns a new list containing all elements of the given [elements]
  /// collection and then all elements of this collection.
  List<E> operator +(Iterable<E> elements) => append(elements).toList();

  /// Returns a new lazy [Iterable] containing the given [element] and then all
  /// elements of this collection.
  Iterable<E> appendElement(E element) sync* {
    yield* this;
    yield element;
  }

  /// Returns a new lazy [Iterable] containing all distinct elements from
  /// both collections.
  ///
  /// The returned set preserves the element iteration order of this collection.
  /// Those elements of the [other] collection that are unique are iterated in
  /// the end in the order of the [other] collection.
  Iterable<E> union(Iterable<E> other) sync* {
    var existing = HashSet<E>();
    for (var element in this) {
      if (existing.add(element)) yield element;
    }

    for (var element in other) {
      if (existing.add(element)) yield element;
    }
  }

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

  ///Tranformations to other structures

  /// Returns a new lazy [Iterable] with all elements of this collection.
  Iterable<E> toIterable() sync* {
    yield* this;
  }

  /// Returns a new [Stream] with all elements of this collection.
  Stream<E> asStream() => Stream.fromIterable(this);

  /// Returns a new [HashSet] with all distinct elements of this collection.
  HashSet<E> toHashSet() => HashSet.from(this);

  /// Returns an unmodifiable List view of this collection.
  List<E> toUnmodifiable() => UnmodifiableListView(this);

  /// Returns a new, randomly shuffled list.
  ///
  /// If [random] is given, it is being used for random number generation.
  List<E> shuffled([Random random]) => toList()..shuffle(random);

  /// Returns a Map containing key-value pairs provided by [transform] function
  /// applied to elements of this collection.
  ///
  /// If any of two pairs would have the same key the last one gets added to the
  /// map.
  Map<K, V> associate<K, V>(MapEntry<K, V> Function(E element) transform) {
    var map = <K, V>{};
    for (var element in this) {
      var entry = transform(element);
      map[entry.key] = entry.value;
    }
    return map;
  }

  /// Returns a Map containing the elements from the collection indexed by
  /// the key returned from [keySelector] function applied to each element.
  ///
  /// If any two elements would have the same key returned by [keySelector] the
  /// last one gets added to the map.
  Map<K, E> associateBy<K>(K Function(E element) keySelector) {
    var map = <K, E>{};
    for (var current in this) {
      map[keySelector(current)] = current;
    }
    return map;
  }

  /// Returns a Map containing the values returned from [valueSelector] function
  /// applied to each element indexed by the elements from the collection.
  ///
  /// If any of elements (-> keys) would be the same the last one gets added
  /// to the map.
  Map<E, V> associateWith<V>(V Function(E element) valueSelector) {
    var map = <E, V>{};
    for (var current in this) {
      map[current] = valueSelector(current);
    }
    return map;
  }

  /// Groups elements of the original collection by the key returned by the
  /// given [keySelector] function applied to each element and returns a map.
  ///
  /// Each group key is associated with a list of corresponding elements.
  ///
  /// The returned map preserves the entry iteration order of the keys produced
  /// from the original collection.
  Map<K, List<E>> groupBy<K>(K Function(E element) keySelector) {
    return _groupBy(this, keySelector);
  }

  /// Splits the collection into two lists according to [predicate].
  ///
  /// The first list contains elements for which [predicate] yielded true,
  /// while the second list contains elements for which [predicate] yielded
  /// false.
  List<List<E>> partition(bool Function(E element) predicate) {
    var t = <E>[];
    var f = <E>[];
    for (var element in this) {
      if (predicate(element)) {
        t.add(element);
      } else {
        f.add(element);
      }
    }
    return [t, f];
  }

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
      : uncomputedIterator = iterable.iterator;

  Iterator<T> uncomputedIterator;
  final cache = _IterableCache<T>(null);

  @override
  Iterator<T> get iterator => _CachedIterator<T>(cache, uncomputedIterator);
}

class _CachedIterator<T> extends Iterator<T> {
  _CachedIterator(this.cache, this.uncomputedIterator)
      : latestValidCache = cache;

  _IterableCache<T> cache;

  /// A reference to the latest non-null [cache].
  ///
  /// This allows adding new items to the cache
  _IterableCache<T> latestValidCache;
  final Iterator<T> uncomputedIterator;

  @override
  T current;

  @override
  bool moveNext() {
    cache = cache?.next;
    if (cache != null) {
      current = cache.value;
      latestValidCache = cache;
      return true;
    }
    if (uncomputedIterator.moveNext()) {
      current = uncomputedIterator.current;
      assert(latestValidCache.next == null);
      latestValidCache.next = _IterableCache(current);
      latestValidCache = latestValidCache.next;
      return true;
    }
    return false;
  }
}

/// A LinkedList that does not throw concurrent modification errors.
class _IterableCache<T> {
  _IterableCache(this.value);

  _IterableCache<T> next;
  final T value;
}

extension IterableIterableX<E> on Iterable<Iterable<E>> {
  /// Returns a new lazy [Iterable] of all elements from all collections in this
  /// collection.
  ///
  /// ```dart
  /// var nestedList = List([[1, 2, 3], [4, 5, 6]]);
  /// var flattened = nestedList.flatten(); // [1, 2, 3, 4, 5, 6]
  /// ```
  Iterable<E> flatten() sync* {
    for (var current in this) {
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
