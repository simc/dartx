// ignore_for_file: deprecated_member_use

part of dartx;

const _binarySearch = binarySearch;
const _lowerBound = lowerBound;
const _insertionSort = insertionSort;
const _mergeSort = mergeSort;

extension ListX<E> on List<E> {
  /// Index of the first element or -1 if the collection is empty.
  ///
  /// ```dart
  /// [1, 2, 3].firstIndex; // 0
  ///
  /// [].firstIndex; // -1
  /// ```
  int get firstIndex => isNotEmpty ? 0 : -1;

  /// Index of the last element or -1 if the collection is empty.
  ///
  /// ```dart
  /// [1, 2, 3].lastIndex; // 2
  ///
  /// [].lastIndex; // -1
  /// ```
  int get lastIndex => length - 1;

  Iterable<int> get indices sync* {
    var index = 0;
    while (index <= lastIndex) {
      yield index++;
    }
  }

  /// Returns a new list containing all elements except first [n] elements.
  List<E> drop(int n) {
    if (n < 0) {
      throw ArgumentError('Requested element count $n is less than zero.');
    }
    if (n == 0) toList();

    var resultSize = length - n;
    if (resultSize <= 0) return [];
    if (resultSize == 1) return [last];
    return sublist(n);
  }

  /// Returns a new list containing all elements except last elements that
  /// satisfy the given [predicate].
  List<E> dropWhile(bool Function(E element) predicate) {
    int startIndex;
    for (var i = 0; i < length; i++) {
      if (!predicate(this[i])) {
        startIndex = i;
        break;
      }
    }
    if (startIndex == null) return [];
    return sublist(startIndex);
  }

  /// Returns a new list containing all elements except last [n] elements.
  List<E> dropLast(int n) {
    if (n < 0) {
      throw ArgumentError('Requested element count $n is less than zero.');
    }
    if (n == 0) toList();

    var resultSize = length - n;
    if (resultSize <= 0) return [];
    if (resultSize == 1) return [first];
    return sublist(0, length - n);
  }

  /// Returns a new list containing all elements except last elements that
  /// satisfy the given [predicate].
  List<E> dropLastWhile(bool Function(E element) predicate) {
    int endIndex;
    for (var i = lastIndex; i >= 0; i--) {
      if (!predicate(this[i])) {
        endIndex = i;
        break;
      }
    }
    if (endIndex == null) return [];
    return sublist(0, endIndex + 1);
  }

  /// Returns the first position in this list that does not compare less than
  /// [value].
  ///
  /// If this list isn't sorted according to the [compare] function, the result
  /// is unpredictable.
  ///
  /// If [compare] is omitted, this defaults to calling [Comparable.compareTo]
  /// on the objects. If any object is not [Comparable], this throws a
  /// [CastError].
  ///
  /// Returns [length] if all the items in this list compare less than [value].
  int lowerBound(E value, {int Function(E a, E b) compare}) {
    return _lowerBound(this, value, compare: compare);
  }

  /// Returns a position of the [value] in this list, if it is there.
  ///
  /// If the list isn't sorted according to the [compare] function, the result
  /// is unpredictable.
  ///
  /// If [compare] is omitted, this defaults to calling [Comparable.compareTo]
  /// on the objects. If any object is not [Comparable], this throws a
  /// [CastError].
  ///
  /// Returns -1 if [value] is not in the list by default.
  int binarySearch(E value, {int Function(E a, E b) compare}) {
    return _binarySearch(this, value, compare: compare);
  }

  /// Sort this list between [start] (inclusive) and [end] (exclusive) using
  /// insertion sort.
  ///
  /// If [comparator] is omitted, this defaults to calling
  /// [Comparable.compareTo] on the objects. If any object is not [Comparable],
  /// this throws a [CastError].
  ///
  /// Insertion sort is a simple sorting algorithm. For `n` elements it does on
  /// the order of `n * log(n)` comparisons but up to `n` squared moves. The
  /// sorting is performed in-place, without using extra memory.
  ///
  /// For short lists the many moves have less impact than the simple algorithm,
  /// and it is often the favored sorting algorithm for short lists.
  ///
  /// This insertion sort is stable: Equal elements end up in the same order
  /// as they started in.
  void insertionSort({Comparator<E> comparator, int start = 0, int end}) {
    _insertionSort(this, compare: comparator, start: start, end: end);
  }

  /// Sorts this list between [start] (inclusive) and [end] (exclusive) using
  /// the merge sort algorithm.
  ///
  /// If [comparator] is omitted, this defaults to calling
  /// [Comparable.compareTo] on the objects. If any object is not [Comparable],
  /// this throws a [CastError].
  ///
  /// Merge-sorting works by splitting the job into two parts, sorting each
  /// recursively, and then merging the two sorted parts.
  ///
  /// This takes on the order of `n * log(n)` comparisons and moves to sort
  /// `n` elements, but requires extra space of about the same size as the list
  /// being sorted.
  ///
  /// This merge sort is stable: Equal elements end up in the same order
  /// as they started in.
  void mergeSort({int start = 0, int end, Comparator<E> comparator}) {
    _mergeSort(this, start: start, end: end, compare: comparator);
  }

  /// Swaps the elements in the indices provided.
  ///
  /// ```dart
  /// var list = [1, 2, 3, 4];
  /// list.swap(0, 2); // [3, 2, 1, 4]
  /// ```
  void swap(int indexA, int indexB) {
    final temp = this[indexA];
    this[indexA] = this[indexB];
    this[indexB] = temp;
  }
}

extension ListListX<E> on List<List<E>> {
  /// Returns a new [List] of all elements from all lists in this
  /// [List].
  ///
  /// ```dart
  /// var nestedList = [[1, 2, 3], [4, 5, 6]];
  /// var flattened = nestedList.flatten(); // [1, 2, 3, 4, 5, 6]
  /// ```
  ///
  ///
  /// This is a specialization of [IterableIterableX].flatten() which allows
  /// accessing elements by index afterwards
  ///
  /// ```dart
  /// var flat = [['a', 'b'], ['c', 'd']].flatten();
  /// print(flat[2]); // prints "c"
  /// ```
  List<E> flatten() => [for (var list in this) ...list];
}
