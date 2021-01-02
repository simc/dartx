import 'package:dartx/dartx.dart';

void main() {
  var list = [0, 1, 2, 3, 4, 5];
  var last = list.slice(-1); // [5]
  var lastHalf = list.slice(3); // [3, 4, 5]
  var allButFirstAndLast = list.slice(1, -2); // [1, 2, 3, 4]

  var dogs = [
    Dog(name: 'Tom', age: 3),
    Dog(name: 'Charlie', age: 7),
    Dog(name: 'Bark', age: 1),
    Dog(name: 'Cookie', age: 4),
    Dog(name: 'Charlie', age: 2),
  ];

  var sorted =
      dogs.sortedBy((dog) => dog.name).thenByDescending((dog) => dog.age);
  // Bark, Cookie, Charlie (7), Charlie (2), Tom

  var words = ['this', 'is', 'a', 'test'];
  var distinctByLength =
      words.distinctBy((it) => it.length); // ['this', 'is', 'a']

  var nestedList = [
    [1, 2, 3],
    [4, 5, 6]
  ];
  var flattened = nestedList.flatten(); // [1, 2, 3, 4, 5, 6]
}

class Dog {
  final String name;
  final int age;

  Dog({this.name, this.age});
}
