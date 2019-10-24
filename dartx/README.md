<img src="https://raw.githubusercontent.com/leisim/dartx/master/.github/logo.svg?sanitize=true" width="500px">

[![Dart CI](https://github.com/leisim/dartx/workflows/Dart%20CI/badge.svg)](https://github.com/leisim/dartx/actions) [![Codecov](https://img.shields.io/codecov/c/github/leisim/dartx.svg)](https://codecov.io/gh/leisim/dartx) [![dartx](https://img.shields.io/pub/v/dartx?label=dartx)](https://pub.dev/packages/dartx) [![flutterx](https://img.shields.io/pub/v/flutterx?label=flutterx)](https://pub.dev/packages/flutterx)

If you come from Kotlin, you will appreciate all the handy extensions. This library contains the most useful ones and some additional extensions.

*If you miss an extension, please open an issue or pull request*

### Resources:
- [Documentation](https://pub.dev/documentation/dartx/latest/dartx/dartx-library.html)
- [Pub Package](https://pub.dev/packages/dartx)
- [GitHub Repository](https://github.com/leisim/dartx)

## Getting started 🎉

Add the following to you `pubspec.yaml` and replace `[version]` with the latest version:

```dart
dependencies:
  dartx: ^[version]
```

After you import the library, you can use the extensions.

```dart
import 'package:dartx/dartx.dart';

var slice = [1, 2, 3, 4, 5].slice(1,-2); // [2, 3]
```

## Extensions

Here you can find some of the supported extensions:

## slice
Get a sublist of the collection:
```dart
var list = [0, 1, 2, 3, 4, 5]);
var last = list.slice(-1); // [5]
var lastHalf = list.slice(3); // [3, 4, 5]
var allButFirstAndLast = list.slice(1,-2); // [1, 2, 3, 4]
```

## sortedBy & thenBy
Sort lists by multiple properties
```dart
var dogs = [
  Dog(name: "Tom", age: 3),
  Dog(name: "Charlie", age: 7),
  Dog(name: "Bark", age: 1),
  Dog(name: "Cookie", age: 4),
  Dog(name: "Charlie", age: 2),
];

var sorted = dogs
    .sortedBy((dog) => dog.name)
    .thenByDescending((dog) => dog.age);
// Bark, Cookie, Charlie (7), Charlie (2), Tom
```

## contentEquals
Compare two lists:
```dart
var list = ['some', 'items'];
var equals1 = list.contentEquals(['some', 'items']); // true
var equals2 = list.contentEquals(['SOME', 'items']); // false
```

## minBy & maxBy
Get the smallest or largest element from a list:
```dart
var list = ['some', 'random', 'words']
var shortestWord = list.minBy((it) => it.length); // 'some'
var longestWord = list.maxBy((it) => it.length); // 'random'
````

## distinctBy
Get distinct elements from a list:
```dart
var list = ['this', 'is', 'a', 'test'];
var distinctByLength = list.distinctBy((it) => it.length); // ['this', 'is', 'a']
```

## flatten
Flatten a list of iterables:
```dart
var nestedList = [[1, 2, 3], [4, 5, 6]];
var flattened = nestedList.flatten(); // [1, 2, 3, 4, 5, 6]
```

## firstOrNull & firstOrNullWhere
Find the first element of the collection matching a predicate:
```dart
var list = ['this', 'is', 'a', 'test'];
var first = list.firstOrNull; // 'this'
var firstWhere = list.firstOrNullWhere((s) => s.length <= 2); // 'is'
var firtNull = list.firstOrNullWhere((s) => s.length > 4); // null
```

## elementAtOrNull & elementAtOrElse
Get the element at an index or null if the index does not exist:
```dart
var list = [0, 1, 2, 3, 4, 5, 6];
var second = list.elementAtOrNull(1); // 1
var highIndexNull = list.elementAtOrNull(10); // null
var highIndexDefault = list.elementAtOrDefault(10, -1); // -1
```



## License
```
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