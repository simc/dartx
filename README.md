<img src="https://raw.githubusercontent.com/leisim/dartx/master/.github/logo.svg?sanitize=true" width="500px">

[![Dart CI](https://github.com/leisim/dartx/workflows/Dart%20CI/badge.svg?branch=master)](https://github.com/leisim/dartx/actions) [![Codecov](https://img.shields.io/codecov/c/github/leisim/dartx.svg)](https://codecov.io/gh/leisim/dartx) [![dartx](https://img.shields.io/pub/v/dartx?label=dartx)](https://pub.dev/packages/dartx) [![flutterx](https://img.shields.io/pub/v/flutterx?label=flutterx)](https://pub.dev/packages/flutterx)

_If you miss an extension, please open an issue or pull request_

### Resources:

- [Documentation](https://pub.dev/documentation/dartx/latest/dartx/dartx-library.html)
- [Pub Package](https://pub.dev/packages/dartx)
- [GitHub Repository](https://github.com/leisim/dartx)

On this page you can find some of the extensions. Take a look at the docs to see all of them.

## Getting started 🎉

Add the following to your `pubspec.yaml`:

```dart
dependencies:
  dartx: any
```

After you import the library, you can use the extensions.

```dart
import 'package:dartx/dartx.dart';

final slice = [1, 2, 3, 4, 5].slice(1, -2); // [2, 3, 4]
```

## Iterable

### .slice()

Returns elements at indices between `start` (inclusive) and `end` (inclusive).

```dart
final list = [0, 1, 2, 3, 4, 5];
final last = list.slice(-1); // [5]
final lastHalf = list.slice(3); // [3, 4, 5]
final allButFirstAndLast = list.slice(1, -2); // [1, 2, 3, 4]
```

### .sortedBy() & .thenBy()

Sort lists by multiple properties.

```dart
final dogs = [
  Dog(name: "Tom", age: 3),
  Dog(name: "Charlie", age: 7),
  Dog(name: "Bark", age: 1),
  Dog(name: "Cookie", age: 4),
  Dog(name: "Charlie", age: 2),
];

final sorted = dogs
    .sortedBy((dog) => dog.name)
    .thenByDescending((dog) => dog.age);
// Bark, Cookie, Charlie (7), Charlie (2), Tom
```

### .distinctBy()

Get distinct elements from a list.

```dart
final list = ['this', 'is', 'a', 'test'];
final distinctByLength = list.distinctBy((it) => it.length); // ['this', 'is', 'a']
```

### .flatten()

Get a new lazy `Iterable` of all elements from all collections in a collection.

```dart
final nestedList = [[1, 2, 3], [4, 5, 6]];
final flattened = nestedList.flatten(); // [1, 2, 3, 4, 5, 6]
```

### .chunkWhile() & .splitWhen()

Chunk entries as long as two elements match a predicate:

```dart
final list = [1, 2, 4, 9, 10, 11, 12, 15, 16, 19, 20, 21];
final increasingSubSequences = list.chunkWhile((a, b) => a + 1 == b);

// increasingSubSequences = [[1, 2], [4], [9, 10, 11, 12], [15, 16], [19, 20, 21]]
```

`splitWhen` is the opposite of `chunkWhile` that starts a new chunk every time
the predicate _didn't_ match.

## int

### buildString()

Builds new string by populating newly created `StringBuffer` using provided `builderAction`
and then converting it to `String`.

```dart
final word = buildString((sb) {
  for (var i = 0; i < 10; i++) {
    sb.write(i);
  }
});
// 0123456789
``` 

### .ordinal

Returns an ordinal number of `String` type for any integer

```dart
final a = 1.ordinal();  // 1st
final b = 108.ordinal();  // 108th
```

## String

### .capitalize

Returns a copy of the string having its first letter uppercased, or the original string, if it's empty or already starts with an upper case letter.

```dart
final word = 'abcd'.capitalize(); // Abcd
final anotherWord = 'Abcd'.capitalize(); // Abcd
```

### .decapitalize

Returns a copy of the string having its first letter lowercased, or the original string, if it's empty or already starts with a lower case letter.

```dart
final word = 'abcd'.decapitalize(); // abcd
final anotherWord = 'Abcd'.decapitalize(); // abcd
```
  
### .isAscii

Returns `true` if the string is ASCII encoded.

```dart
final isAscii = 'abc123 !,.~'.isAscii; // true
final isNotAscii = '§3'.isAscii; // false
```

### .isBlank

Returns `true` if this string is empty or consists solely of whitespace characters.

```dart
final notBlank = '   .'.isBlank; // false
final blank = '  '.isBlank; // true
```

### .isDouble

Returns `true` if the string can be parsed as a double.

```dart
final a = ''.isDouble; // false
final b = 'a'.isDouble; // false
final c = '1'.isDouble; // true
final d = '1.0'.isDouble; // true
final e = '123456789.987654321'.isDouble; // true
final f = '1,000'.isDouble; // false
```

### .isInt

Returns `true` if the string can be parsed as an integer.

```dart
final a = ''.isInt; // false
final b = 'a'.isInt; // false
final c = '1'.isInt; // true
final d = '1.0'.isInt; // false
final e = '1,000'.isInt; // false
```

### .isLatin1

Returns `true` if the string is Latin 1 encoded.

```dart
final isLatin1 = '§Êü'.isLatin1; // true
final isNotLatin1 = 'ő'.isLatin1; // false
```

### .isLowerCase

Returns `true` if the entire string is lower case.

```dart
final a = 'abc'.isLowerCase; // true
final b = 'abC'.isLowerCase; // false
final c = '   '.isLowerCase; // true
final d = ''.isLowerCase; // false
```

### .isNotBlank

Returns `true` if this string is not empty and contains characters except whitespace characters.

```dart
final blank = '  '.isNotBlank; // false
final notBlank = '   .'.isNotBlank; // true
```

### .isNullOrEmpty

Returns `true` if the String is either `null` or empty.

```dart
final isNull = null.isNullOrEmpty; // true
final isEmpty = ''.isNullOrEmpty; // true
final isBlank = ' '.isNullOrEmpty; // false
final isLineBreak = '\n'.isNullOrEmpty; // false
```

### .isNotNullOrEmpty

Returns `true` if the String is neither `null` nor empty.

```dart
final isNull = null.isNullOrEmpty; // true
final isEmpty = ''.isNullOrEmpty; // true
final isBlank = ' '.isNullOrEmpty; // false
final isLineBreak = '\n'.isNullOrEmpty; // false
```

### .isNullOrBlank

Returns `true` if the String is either `null` or blank.

```dart
final isNull = null.isNullOrBlank; // true
final isEmpty = ''.isNullOrBlank; // true
final isBlank = ' '.isNullOrBlank; // true
final isLineBreak = '\n'.isNullOrBlank; // true
final isFoo = ' foo '.isNullOrBlank; // false
```

### .isNotNullOrBlank

Returns `true` if the String is neither `null` nor blank.

```dart
final isNull = null.isNullOrBlank; // true
final isEmpty = ''.isNullOrBlank; // true
final isBlank = ' '.isNullOrBlank; // true
final isLineBreak = '\n'.isNullOrBlank; // true
final isFoo = ' foo '.isNullOrBlank; // true
```

### .isUpperCase

Returns `true` if the entire string is upper case.

```dart
final a = 'ABC'.isUpperCase; // true
final b = 'ABc'.isUpperCase; // false
final c = '   '.isUpperCase; // true
final d = ''.isUpperCase; // false
```

### .md5

Calculates the MD5 digest and returns the value as a string of hexadecimal digits.

```dart
final a = 'abc'.md5; // 900150983cd24fb0d6963f7d28e17f72
final b = 'ഐ⌛酪Б👨‍👨‍👧‍👦'.md5; // c7834eff7c967101cfb65b8f6d15ad46
```

### .urlEncode

Translates a string into application/x-www-form-urlencoded format using a specific encoding scheme.

```dart
const originalUrl = 'Hello Ladies + Gentlemen, a signed OAuth request!';
final encodedUrl = originalUrl.urlEncode;
// 'Hello%20Ladies%20+%20Gentlemen,%20a%20signed%20OAuth%20request!'
```

### .urlDecode

Decodes an application/x-www-form-urlencoded string using a specific encoding scheme.

```dart
const encodedUrl = 'Hello%20Ladies%20+%20Gentlemen,%20a%20signed%20OAuth%20request!';
final decodedUrl = encodingUrl.urlDecode;
// 'Hello Ladies + Gentlemen, a signed OAuth request!'
```

### .removePrefix(), .removeSuffix() and .removeSurrounding()

Remove a prefix, a suffix, or both from a given string:

```dart
final name = 'James Bond'.removePrefix('James '); // Bond
final milliseconds = '100ms'.removeSuffix('ms'); // 100
final text = '<p>Some HTML</p>'
  .removeSurrounding(prefix: '<p>', suffix: '</p>'); // Some HTML
```

### .reversed

Returns a new string with characters in reversed order.

```dart
final emptyString = ''.reversed; // ''
final reversed = 'abc🤔'.reversed; // '🤔cba'
```

### .slice()

Returns a new substring containing all characters including indices [start] and [end].
If [end] is omitted, it is being set to `lastIndex`.

```dart
final sliceOne = 'awesomeString'.slice(0,6)); // awesome
final sliceTwo = 'awesomeString'.slice(7)); // String
```

### .toDoubleOrNull()

Parses the string as a `double` and returns the result or `null` if the String is not a valid representation of a number.

```dart
final numOne = '1'.toDoubleOrNull(); // 1.0
final numTwo = '1.2'.toDoubleOrNull(); // 1.2
final blank = ''.toDoubleOrNull(); // null
```

### .toInt()

Parses the string as an integer and returns the result. The radix (base) thereby defaults to 10. Throws a `FormatException` if parsing fails.

```dart
final a = '1'.toInt(); // 1
final b = '100'.toInt(radix: 2); // 4
final c = '100'.toInt(radix: 16); // 256
final d = '1.0'.toInt(); // throws FormatException
```

### .toIntOrNull()

Parses the string as an integer or returns `null` if it is not a number.

```dart
final number = '12345'.toIntOrNull(); // 12345
final notANumber = '123-45'.toIntOrNull(); // null
```

### .toUtf8()

Converts String to UTF-8 encoding.

```dart
final emptyString = ''.toUtf8(); // []
final hi = 'hi'.toUtf8(); // [104, 105]
final emoji = '😄'.toUtf8(); // [240, 159, 152, 132]

```

### .toUtf16()

Converts String to UTF-16 encoding.

```dart
final emptyString = ''.toUtf16(); // []
final hi = 'hi'.toUtf16(); // [104, 105]
final emoji = '😄'.toUtf16(); // [55357, 56836]
```

### .orEmpty()

Returns the string if it is not `null`, or the empty string otherwise.

```dart
String? nullableStr;
final str = nullableStr.orEmpty(); // ''
```

### .matches()

Returns `true` if this char sequence matches the given regular expression.

```dart
print('as'.matches(RegExp('^.s\$'))) // true
print('mst'.matches(RegExp('^.s\$'))) // false
```

### Time utils

Dartx exports [@jogboms](https://github.com/jogboms) great [⏰ time.dart](https://github.com/jogboms/time.dart) package so you can do the following:

```dart
int secondsInADay = 1.days.inSeconds;

Duration totalTime = [12.5.seconds, 101.milliseconds, 2.5.minutes].sum();

DateTime oneWeekLater = DateTime.now() + 1.week;
```

Check out [⏰ time.dart](https://github.com/jogboms/time.dart) for more information and examples.

## num

### .coerceIn()

Ensures that this value lies in the specified range.

```dart
final numberInRange = 123.coerceIn(0, 1000); // 123
final numberOutOfRange = -123.coerceIn(0, 1000); // 0
```

### .toBytes()

Converts this value to binary form.

### .toChar()

Converts this value to character

```dart
final character = 97.toChar(); // a
```

## range

### rangeTo

Creates a range between two ints (upwards, downwards and with custom steps)

```dart
// upwards with default step size 1
for (final i in 1.rangeTo(5)) {
  print(i); // 1, 2, 3, 4, 5
}
// downwards with custom step
for (final i in 10.rangeTo(2).step(2)) {
  print(i); // 10, 8, 6, 4, 2
}
```

## Function

### .partial(), .partial2() ...

Applies some of the required arguments to a function and returns a function which takes the remaining arguments.

```dart
void greet(String firstName, String lastName) {
  print('Hi $firstName $lastName!');
}

final greetStark = greet.partial('Stark');
greetStark('Sansa'); // Hi Sansa Stark!
greetStark('Tony'); // Hi Tony Stark!
```

## File

### .name

Get the name and extension of a file.

```dart
final file = File('some/path/testFile.dart');
print(file.name); // testFile.dart
print(file.nameWithoutExtension); // testFile
```

### .appendText()

Append text to a file.

```dart
await File('someFile.json').appendText('{test: true}');
```

### .isWithin()

Checks if a file is inside a directory.

```dart
final dir = Directory('some/path');
File('some/path/file.dart').isWithin(dir); // true
```

## Directory

### .file(String)

References a file within a `Directory`

```dart
Directory androidDir = Directory('flutter-app/android');
File manifestFile = androidDir.file("app/src/main/AndroidManifest.xml");
```

References a directory within a `Directory`

### .directory(String)

```dart
Directory androidDir = Directory('flutter-app/android');
Directory mainSrc = androidDir.directory("app/src/main");
```

### .contains(FileSystemEntity entity, {bool recursive = false})

Checks if a `Directory` contains a `FileSystemEntity`. This can be a `File` or a `Directory`.

Use the `recursive` argument to include the subdirectories.

```dart
final File someFile = File('someFile.txt');
final Directory someDir = Directory('some/dir');

final Directory parentDir = Directory('parent/dir');

parentDir.contains(someFile);
parentDir.contains(someDir);
parentDir.contains(someFile, recursive: true);
parentDir.contains(someDir, recursive: true);
```

This is the `async` method, which returns a `Future<bool>`.

### .containsSync(FileSystemEntity entity, {bool recursive = false})

Same as `.contains(FileSystemEntity entity, {bool recursive = false})` but synchronous. Returns a `bool`.

## License

```plain
Copyright 2019 Simon Leier

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
