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
