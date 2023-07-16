## 1.2.0
- Official Dart 3.0 release
- General cleanup and CI update

## 1.1.0

- [PR-151](https://github.com/leisim/dartx/pull/151) New: `String?.isNullOrBlank`, `String?.isNotNullOrBlank`
- [PR-149](https://github.com/leisim/dartx/pull/149) Fix type of extension: `IterableForthItem` -> `IterableFourthItem`
- [PR-147](https://github.com/leisim/dartx/pull/147) New: `int.toChar(): String`
- [PR-147](https://github.com/leisim/dartx/pull/147) New: `String?.orEmpty: bool`
- [PR-147](https://github.com/leisim/dartx/pull/147) New: `String.matches(RexExp): bool`
- [PR-147](https://github.com/leisim/dartx/pull/147) New: `String.urlEncode` and `String.urlDecode`
- [PR-147](https://github.com/leisim/dartx/pull/147) New: `buildString` to build a `StringBuffer` an immediately return it
- [PR-156](https://github.com/leisim/dartx/pull/156) Fix: `Iterable.takeFirst(n)` and `Iterable.takeLast(n)` crashed when n > length

## 1.0.0
- Promote to stable version
- Remove deprecated extensions

## 0.8.0

- [PR-136](https://github.com/leisim/dartx/pull/136) New: Multiple extensions for `Map`. `all()`, `any()`, `count()`, `filter()`, `filterKeys()`, `filterNot`, `filterValues`, `getOrElse()`, `mapEntries()`, `mapKeys()`, `mapValues()`, `maxBy()`, `maxWith()`, `minBy()`, `minWith`, `none()`, `toList()`, `toMap()`, `orEmpty()`
- [PR-127](https://github.com/leisim/dartx/pull/127) Improve: `sumBy` is now generic and works equally for `num`/`int`/`double`
- [PR-131](https://github.com/leisim/dartx/pull/131) Fix: `min()`/`max()` which returned the wrong item for reversed ordered lists
- [PR-133](https://github.com/leisim/dartx/pull/133) New: `plus()`/`minus()` and `plusOrNull`/`minusOrNull` to `num` which handle `null`
- [PR-138](https://github.com/leisim/dartx/pull/138) Improve: `Iterable.second` returns `T` instead of `T?`. Analog to `first`
- [PR-142](https://github.com/leisim/dartx/pull/142) Fix: `isUpperCase`/`isLowerCase` now threat only `[a-zA-Z]` chars as being uppercase

Also, all linting issues have been fixed and the README has been drastically improved. Thanks @minhqdao 

## 0.7.1

- [PR-126](https://github.com/leisim/dartx/pull/126) Improve runtime of `elementAtOrNull` for `List`
- [PR-125](https://github.com/leisim/dartx/pull/125) Fix `whereNotNull` to actually return non-null elements

## 0.7.0

- All extensions methods now have their own extension which can be imported explicitly with `show`/`hide`. This allows the usage of `package:collection` and `dartx` in the same file.
- Undeprecate `firstOrNullWhere` until `dartx` can export `package:collection` itself
- New `Directory.file` and `Directory.directory` extensions to quickly create file/directory references
- Update `time` package

## 0.6.0

- [PR-120](https://github.com/leisim/dartx/pull/120)  Migrate to nullsafety
- Fix `minBy`, `maxBy` NPE for empty lists
- [PR-69](https://github.com/leisim/dartx/pull/69) New `Dictionary.contains`
- [PR-57](https://github.com/leisim/dartx/pull/57) New `Iterable.slice`

## 0.5.0

- [PR-94](https://github.com/leisim/dartx/pull/94) Breaking: `Iterable<T>.zip(other, transform)` now support zipping iterables of other types the `T`. This is a breaking change because it is now required to add types in the transform function.
  ```dart
  final amounts = [2, 3, 4];
  final animals = ['dogs', 'birds', 'cats'];
  final all = amounts.zip(animals, (int amount, String animal) => '$amount $animal');
  // lambda types are now required:  ⇧           ⇧
  // all: ['2 dogs', '3 birds', '4 cats']
  ```
- [PR-90](https://github.com/leisim/dartx/pull/90) New `String` extensions 
  - `String removePrefix(String prefix)`
  - `String removeSuffix(String suffix)`
  - `String removeSurrounding({String prefix, String suffix})`
  ```dart
  final name = 'James Bond'.removePrefix('James '); // Bond
  final milliseconds = '100ms'.removeSuffix('ms'); // 100
  final text = '<p>Some HTML</p>'.removeSurrounding(prefix: '<p>', suffix: '</p>'); // Some HTML
  ```
- [PR-88](https://github.com/leisim/dartx/pull/88) New `List` extension `void swap(int, int)` which swaps the elements in the indices provided.
  ```dart
  final list = [1, 2, 3, 4];
  list.swap(0, 2); // [3, 2, 1, 4]
  ```
- [PR-100](https://github.com/leisim/dartx/pull/100) Relax the upper version constraint of `collection` to support Flutter 1.20 (which uses `collection: 1.3.0-nullsafety`)
- [PR-101](https://github.com/leisim/dartx/pull/101) Relax the upper version constraint of `crypto`

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
