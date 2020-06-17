## 0.4.2

- Increase dependency range of `characters` to include `1.0.0`
- Raise min sdk version to `2.6.0` to prevent pub publishing warning for pre-release versions

## 0.4.1

- [PR-84](https://github.com/leisim/dartx/pull/84) Increase `path` version range to be compatible with Flutter 1.17
- [PR-83](https://github.com/leisim/dartx/pull/83) Run tests on macOS

## 0.4.0

### Iterable
- [PR-41](https://github.com/leisim/dartx/pull/41) New `Iterable<T>.containsAny(Iterable<T>)` extension
- [PR-46](https://github.com/leisim/dartx/pull/46) New `Iterable<num>.median()` extension
- [PR-53](https://github.com/leisim/dartx/pull/53) New `Iterable<T>.asStream()` extension converts any Iterable to a Stream
- [PR-59](https://github.com/leisim/dartx/pull/59) New `Iterable<T>.cached` extension creates a cached `Iterable` preventing lazy operators such as `.map` to execute again 
- [PR-56](https://github.com/leisim/dartx/pull/56) Make `Iterable<Iterable<T>>.flatten()` typesafe and return `Iterable<T>` instead of `Iterable<dynamic>`
- [PR-62](https://github.com/leisim/dartx/pull/62) New `Iterable<T>.chunkWhile(bool Function(T, T) predicate): Iterable<List<E>>` extension splits a collection into a lazy Iterables of chunks, where chunks are created as long as `predicate` is true for a pair of entries.
- [PR-62](https://github.com/leisim/dartx/pull/62) New `Iterable<T>.splitWhen(bool Function(E, E) predicate): Iterable<List<E>>` extension splits a collection into a lazy `Iterable`, where each split will be make if `predicate` returns `true` for a pair of entries.
- [PR-54](https://github.com/leisim/dartx/pull/54) New `Iterable<Future<T>>.asStreamAwaited(): Stream<T>` extension to create a stream from a group of futures.


### String
- [PR-72](https://github.com/leisim/dartx/pull/72) New `String.isNullOrEmpty` extension
- [PR-43](https://github.com/leisim/dartx/pull/43) New `String.toInt({int radix})` extension as alias for `int.parse(String, {int radix})` (also `String.toIntOrNull({int radix})`)
- [PR-75](https://github.com/leisim/dartx/pull/75) Deprecate `String.chars` in favour of `String.characters` from the official `characters` package.

### Ranges
- [PR-74](https://github.com/leisim/dartx/pull/74) New `Comparable<T>.rangeTo(Comparable<T> end)` extension to create ranges of `DateTime` or `String`.
- [PR-45](https://github.com/leisim/dartx/pull/45) New `num.between(num first, num endInclusive): bool` extension
- [PR-45](https://github.com/leisim/dartx/pull/45) New `num.inRange(Range<num> range): bool` extension
- [PR-45](https://github.com/leisim/dartx/pull/45) New `Comparable<T>.between(T first, T endInclusive): bool` extension
- [PR-45](https://github.com/leisim/dartx/pull/45) New `Comparable<T>.inRange(ComparableRange<T> range): bool` extension

## 0.3.0+1
- Improve package scoring by upgrading dependencies and formatting files
- Change README slightly
 
## 0.3.0
- [PR-14](https://github.com/leisim/dartx/pull/14) New [`int.rangeTo(int)`](https://github.com/leisim/dartx#rangeto) extension
- [PR-24](https://github.com/leisim/dartx/pull/24) Default implementations for `Comparable` `<`, `<=`, `>=` and `>` operators.
- [PR-13](https://github.com/leisim/dartx/pull/13) Removed `quiver` dependency
- [PR-21](https://github.com/leisim/dartx/pull/21) New `String.md5` to calculate a MD5 digest
- [PR-25](https://github.com/leisim/dartx/pull/25) New `FileSystemEntity.withName(String newName)` to get a `File` with a different name
- [PR-25](https://github.com/leisim/dartx/pull/25) New `FileSystemEntity.extension` to get the file extension
- [PR-17](https://github.com/leisim/dartx/pull/17) `Callable.invoke()` is now marked as `Deprecated` in favour of darts `call()` method. It will not be removed though, until darts `.call()` methods gets [auto-completion](https://github.com/dart-lang/sdk/issues/39761).
- [PR-30](https://github.com/leisim/dartx/pull/30) New `Comparable.coerceIn()`, `Comparable.coerceAtLeast()` and `Comparable.coerceAtMost()`
- [PR-31](https://github.com/leisim/dartx/pull/31) Fixed `num.toBytes()`
- [PR-33](https://github.com/leisim/dartx/pull/33) Fixed `.thenBy()` and `.thenWith()` extensions for Lists

### Breaking
- [PR-29](https://github.com/leisim/dartx/pull/29) `Iterable<E>.windowed` - remove the required transform lambda

## 0.2.0
- Moved to `time.dart` library for time extensions

## 0.1.2
- Fixed docs
- Added `Function.curry()`, `Function.invoke()`, `Function.partial()` and `Function.flip()`
- `'string'.reversed` now correctly handles grapheme clusters (like emoji)

### Breaking
- `'string'.chars` now returns the grapheme clusters instead of `Rune`s

## 0.1.1
- Bugfixes
- More tests

## 0.1.0+1
- Initial release
