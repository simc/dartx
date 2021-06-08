// ignore_for_file: unused_local_variable
import 'package:dartx/dartx.dart';

void main() {
  final list = [0, 1, 2, 3, 4, 5];
  final last = list.slice(-1); // [5]
  final lastHalf = list.slice(3); // [3, 4, 5]
  final allButFirstAndLast = list.slice(1, -2); // [1, 2, 3, 4]

  final dogs = [
    Dog(name: 'Tom', age: 3),
    Dog(name: 'Charlie', age: 7),
    Dog(name: 'Bark', age: 1),
    Dog(name: 'Cookie', age: 4),
    Dog(name: 'Charlie', age: 2),
  ];

  final sorted =
      dogs.sortedBy((dog) => dog.name).thenByDescending((dog) => dog.age);
  // Bark, Cookie, Charlie (7), Charlie (2), Tom

  final words = ['this', 'is', 'a', 'test'];
  final distinctByLength =
      words.distinctBy((it) => it.length); // ['this', 'is', 'a']

  final nestedList = [
    [1, 2, 3],
    [4, 5, 6]
  ];
  final flattened = nestedList.flatten(); // [1, 2, 3, 4, 5, 6]

  123.0.minus(null); // 123.0
}

class Dog {
  final String name;
  final int age;

  Dog({required this.name, required this.age});
}
