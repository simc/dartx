part of dartx;

extension IterableAsyncX<E> on Iterable<E> {
  Future<E> firstWhereAsync(FutureOr<bool> test(E element),
      {FutureOr<E> orElse()}) async {
    for (var element in this) {
      if (await test(element)) return element;
    }
    if (orElse != null) return await orElse();
    throw StateError('No element');
  }

  Future<E> firstOrNullWhereAsync(FutureOr<bool> test(E element)) {
    return firstWhereAsync(test, orElse: () => null);
  }

  Future<E> lastWhereAsync(FutureOr<bool> test(E element),
      {FutureOr<E> orElse()}) async {
    E result;
    var foundMatching = false;
    for (var element in this) {
      if (await test(element)) {
        result = element;
        foundMatching = true;
      }
    }
    if (foundMatching) return result;
    if (orElse != null) return await orElse();
    throw StateError('No element');
  }

  Future<E> lastOrNullWhereAsync(FutureOr<bool> predicate(E element)) {
    return lastWhereAsync(predicate, orElse: () => null);
  }

  Stream<E> firstWhileAsync(FutureOr<bool> predicate(E element)) async* {
    for (var element in this) {
      if (!await predicate(element)) break;
      yield element;
    }
  }

  Stream<E> lastWhileAsync(FutureOr<bool> predicate(E element)) async* {
    var list = ListQueue<E>();
    for (var element in reversed) {
      if (!await predicate(element)) break;
      list.addFirst(element);
    }
    yield* Stream.fromIterable(list);
  }

  Future<bool> anyAsync(FutureOr<bool> test(E element)) async {
    for (var element in this) {
      if (await test(element)) return true;
    }
    return false;
  }

  Future<bool> allAsync(FutureOr<bool> predicate(E element)) async {
    for (var element in this) {
      if (!await predicate(element)) {
        return false;
      }
    }
    return true;
  }

  Future<bool> noneAsync(FutureOr<bool> predicate(E element)) async =>
      !await anyAsync(predicate);

  Future<Null> forEachAsync(FutureOr f(E element)) async {
    for (var element in this) {
      await f(element);
    }
  }

  Future<Null> forEachIndexedAsync(FutureOr f(E element, int index)) async {
    var index = 0;
    for (var element in this) {
      await f(element, index++);
    }
  }

  Future<Null> onEachAsync(FutureOr action(E element)) async {
    for (var element in this) {
      await action(element);
    }
  }

  Stream<E> whereAsync(FutureOr<bool> predicate(E element)) async* {
    for (var element in this) {
      if (await predicate(element)) {
        yield element;
      }
    }
  }

  Stream<E> whereIndexedAsync(
      FutureOr<bool> predicate(E element, int index)) async* {
    var index = 0;
    for (var element in this) {
      if (await predicate(element, index++)) {
        yield element;
      }
    }
  }

  Future<Null> whereToAsync(
      List<E> destination, FutureOr<bool> predicate(E element)) async {
    for (var element in this) {
      if (await predicate(element)) {
        destination.add(element);
      }
    }
  }

  Future<Null> whereIndexedToAsync(List<E> destination,
      FutureOr<bool> predicate(E element, int index)) async {
    var index = 0;
    for (var element in this) {
      if (await predicate(element, index++)) {
        destination.add(element);
      }
    }
  }

  Stream<E> whereNotAsync(FutureOr<bool> predicate(E element)) async* {
    for (var element in this) {
      if (!await predicate(element)) {
        yield element;
      }
    }
  }

  Stream<E> whereNotIndexedAsync(
      FutureOr<bool> predicate(E element, int index)) async* {
    var index = 0;
    for (var element in this) {
      if (!await predicate(element, index++)) {
        yield element;
      }
    }
  }

  Future<Null> whereNotToAsync(
      List<E> destination, FutureOr<bool> predicate(E element)) async {
    for (var element in this) {
      if (!await predicate(element)) {
        destination.add(element);
      }
    }
  }

  Future<Null> whereNotToIndexedAsync(List<E> destination,
      FutureOr<bool> predicate(E element, int index)) async {
    var index = 0;
    for (var element in this) {
      if (!await predicate(element, index++)) {
        destination.add(element);
      }
    }
  }

  Stream<E> filterAsync(FutureOr<bool> predicate(E element)) =>
      whereAsync(predicate);

  Stream<E> filterIndexedAsync(
          FutureOr<bool> predicate(E element, int index)) =>
      whereIndexedAsync(predicate);

  Future<Null> filterToAsync(List<E> destination, bool predicate(E element)) =>
      whereToAsync(destination, predicate);

  Future<Null> filterIndexedToAsync(List<E> destination,
          FutureOr<bool> predicate(E element, int index)) =>
      whereIndexedToAsync(destination, predicate);

  Stream<E> filterNotAsync(FutureOr<bool> predicate(E element)) =>
      whereNotAsync(predicate);

  Stream<E> filterNotIndexedAsync(
          FutureOr<bool> predicate(E element, int index)) =>
      whereNotIndexedAsync(predicate);

  Future<Null> filterNotToAsync(
          List<E> destination, bool predicate(E element)) =>
      whereNotToAsync(destination, predicate);

  Future<Null> filterNotToIndexedAsync(
          List<E> destination, bool predicate(E element, int index)) =>
      whereNotToIndexedAsync(destination, predicate);

  Stream<R> mapAsync<R>(FutureOr<R> transform(E element)) async* {
    for (var element in this) {
      yield await transform(element);
    }
  }

  Stream<R> mapNotNullAsync<R>(FutureOr<R> transform(E element)) async* {
    for (var element in this) {
      var result = await transform(element);
      if (result != null) {
        yield result;
      }
    }
  }

  Stream<R> mapIndexedAsync<R>(
      FutureOr<R> transform(int index, E element)) async* {
    var index = 0;
    for (var element in this) {
      yield await transform(index++, element);
    }
  }

  Stream<R> mapIndexedNotNullAsync<R>(
      FutureOr<R> transform(int index, E element)) async* {
    var index = 0;
    for (var element in this) {
      final result = await transform(index++, element);
      if (result != null) {
        yield result;
      }
    }
  }

  Stream<E> distinctByAsync<R>(FutureOr<R> selector(E element)) async* {
    var existing = HashSet<R>();
    for (var current in this) {
      if (existing.add(await selector(current))) {
        yield current;
      }
    }
  }
}
