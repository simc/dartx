part of dartx_io;

const _charMinValue = '\u0000';

/// Prints the given arguments to the standard output stream,
/// also you can define [separator] and [end] escape
///
/// ```dart
/// print(['hello world', 1, 0.5, false], separator: ',', end: '\n');
/// // hello world,1,0.5,false
/// ```
void printx(List<dynamic> args, {String separator = ' ', String end = '\n'}) {
  for (var index = 0; index < args.length; index++) {
    stdout.write(args[index]);
    // The last element doesn't need separator
    if (index != args.lastIndex) {
      stdout.write(separator);
    }
  }
  stdout.write(end);
}

/// Read only one character from console
String readChar() => stdin.readByteSync().toChar();

/// Read [n] characters from console
///
/// [skipNext] whether to skip the next character (usually whitespace), defaults to true
String readCharacters(int n, {bool skipNext = true}) {
  return buildString((it) {
    for (var i = 0; i < n; i++) {
      it.write(readChar());
    }
    if (skipNext) it.write(readChar());
  });
}

/// Read a word from console, separate word with space (' ')
String read() {
  return buildString((it) {
    var c = readChar();
    while (c <= ' ') {
      if (c == _charMinValue) return;
      c = readChar();
    }
    do {
      it.write(c);
      c = readChar();
      // ignore: invariant_booleans
    } while (c > ' ');
  });
}

/// Reads a Line from console
String readLine() => stdin.readLineSync() ?? '';

/// Read a [int] number from console
///
/// if the string is not a valid representation of a number retrun null
int? readInt() => read().toIntOrNull();

/// Read a [double] number from console
///
/// if the string is not a valid representation of a number retrun null
double? readDouble() => read().toDoubleOrNull();

/// Read strings from console, separate word with space (' ')
///
/// [n] number of worlds to read
List<String> readStrings(int n) {
  final strings = <String>[];
  for (var i = 0; i < n; i++) {
    strings.add(read());
  }
  return strings;
}

/// Read lines from console
///
/// [n] number of lines to read
List<String> readLines(int n) {
  final strings = <String>[];
  for (var i = 0; i < n; i++) {
    strings.add(readLine());
  }
  return strings;
}

/// Read [int] numbers from console
///
/// [n] counter of numbers to read
List<int> readInts(int n) {
  final ints = <int>[];
  for (var i = 0; i < n; i++) {
    final read = readInt();
    if (read != null) {
      ints.add(read);
    }
  }
  return ints;
}

/// Read [double] numbers from console
///
/// [n] counter of numbers to read
List<double> readDoubles(int n) {
  final doubles = <double>[];
  for (var i = 0; i < n; i++) {
    final read = readDouble();
    if (read != null) {
      doubles.add(read);
    }
  }
  return doubles;
}
