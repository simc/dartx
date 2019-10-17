part of dartx;

abstract class _DelegatingList<E> implements List<E> {
  List<E> get source;

  @override
  List<E> operator +(List<E> other) => source + other;

  @override
  E operator [](int index) => source[index];

  @override
  void operator []=(int index, E value) => source[index] = value;

  @override
  void add(E value) => source.add(value);

  @override
  void addAll(Iterable<E> iterable) => source.addAll(iterable);

  @override
  Map<int, E> asMap() => source.asMap();

  @override
  void clear() => source.clear();

  @override
  void fillRange(int start, int end, [E fillValue]) =>
      source.fillRange(start, end, fillValue);

  @override
  void set first(E value) => source.first = value;

  @override
  Iterable<E> getRange(int start, int end) => source.getRange(start, end);

  @override
  int indexOf(E element, [int start = 0]) => source.indexOf(element, start);

  @override
  int indexWhere(bool Function(E element) test, [int start = 0]) =>
      source.indexWhere(test, start);

  @override
  void insert(int index, E element) => source.insert(index, element);

  @override
  void insertAll(int index, Iterable<E> iterable) =>
      source.insertAll(index, iterable);

  @override
  void set last(E value) => source.last = value;

  @override
  int lastIndexOf(E element, [int start]) => source.lastIndexOf(element, start);

  @override
  int lastIndexWhere(bool Function(E element) test, [int start]) =>
      source.lastIndexWhere(test, start);

  @override
  void set length(int newLength) => source.length = newLength;

  @override
  bool remove(Object value) => source.remove(value);

  @override
  E removeAt(int index) => source.removeAt(index);

  @override
  E removeLast() => source.removeLast();

  @override
  void removeRange(int start, int end) => source.removeRange(start, end);

  @override
  void removeWhere(bool Function(E element) test) => source.removeWhere(test);

  @override
  void replaceRange(int start, int end, Iterable<E> replacement) =>
      source.replaceRange(start, end, replacement);

  @override
  void retainWhere(bool Function(E element) test) => source.retainWhere(test);

  @override
  Iterable<E> get reversed => source.reversed;

  @override
  void setAll(int index, Iterable<E> iterable) =>
      source.setAll(index, iterable);

  @override
  void setRange(int start, int end, Iterable<E> iterable,
          [int skipCount = 0]) =>
      source.setRange(start, end, iterable, skipCount);

  @override
  void shuffle([Random random]) => source.shuffle(random);

  @override
  void sort([int Function(E a, E b) compare]) => source.sort();

  @override
  List<E> sublist(int start, [int end]) => source.sublist(start, end);

  @override
  bool any(bool test(E element)) => source.any(test);

  @override
  List<T> cast<T>() => source.cast<T>();

  @override
  bool contains(Object element) => source.contains(element);

  @override
  E elementAt(int index) => source.elementAt(index);

  @override
  bool every(bool test(E element)) => source.every(test);

  @override
  Iterable<T> expand<T>(Iterable<T> f(E element)) => source.expand(f);

  @override
  E get first => source.first;

  @override
  E firstWhere(bool test(E element), {E orElse()}) =>
      source.firstWhere(test, orElse: orElse);

  @override
  T fold<T>(T initialValue, T combine(T previousValue, E element)) =>
      source.fold(initialValue, combine);

  @override
  Iterable<E> followedBy(Iterable<E> other) => source.followedBy(other);

  @override
  void forEach(void f(E element)) => source.forEach(f);

  @override
  bool get isEmpty => source.isEmpty;

  @override
  bool get isNotEmpty => source.isNotEmpty;

  @override
  Iterator<E> get iterator => source.iterator;

  @override
  String join([String separator = ""]) => source.join(separator);

  @override
  E get last => source.last;

  @override
  E lastWhere(bool test(E element), {E orElse()}) =>
      source.lastWhere(test, orElse: orElse);

  @override
  int get length => source.length;

  @override
  Iterable<T> map<T>(T f(E element)) => source.map(f);

  @override
  E reduce(E combine(E value, E element)) => source.reduce(combine);

  @override
  E get single => source.single;

  @override
  E singleWhere(bool test(E element), {E orElse()}) {
    return source.singleWhere(test, orElse: orElse);
  }

  @override
  Iterable<E> skip(int n) => source.skip(n);

  @override
  Iterable<E> skipWhile(bool test(E value)) => source.skipWhile(test);

  @override
  Iterable<E> take(int n) => source.take(n);

  @override
  Iterable<E> takeWhile(bool test(E value)) => source.takeWhile(test);

  @override
  List<E> toList({bool growable = true}) => source.toList(growable: growable);

  @override
  Set<E> toSet() => source.toSet();

  @override
  Iterable<E> where(bool test(E element)) => source.where(test);

  @override
  Iterable<T> whereType<T>() => source.whereType<T>();

  @override
  String toString() => source.toString();
}
