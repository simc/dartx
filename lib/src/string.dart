part of dartx;

const _ascii = 0x007f;
const _latin1 = 0x00ff;

extension StringX on String {
  Iterable<String> get chars sync* {
    for (var rune in runes) {
      yield String.fromCharCode(rune);
    }
  }

  /// Returns a copy of this string having its first letter uppercased, or the
  /// original string, if it's empty or already starts with an upper case letter.
  ///
  /// ```dart
  /// print("abcd".capitalize()) // Abcd
  /// print("Abcd".capitalize()) // Abcd
  /// ```
  String capitalize() {
    switch (length) {
      case 0:
        return this;
      case 1:
        return substring(0, 1).toUpperCase();
      default:
        return substring(0, 1).toUpperCase() + substring(1);
    }
  }

  /// Returns a copy of this string having its first letter lowercased, or the
  /// original string, if it's empty or already starts with a lower case letter.
  ///
  /// ```dart
  /// print("abcd".decapitalize()) // abcd
  /// print("Abcd".decapitalize()) // abcd
  /// ```
  String decapitalize() {
    switch (length) {
      case 0:
        return this;
      case 1:
        return substring(0, 1).toLowerCase();
      default:
        return substring(0, 1).toLowerCase() + substring(1);
    }
  }

  bool get isBlank => trimLeft().isEmpty;

  bool get isNotBlank => !isBlank;

  ///
  /// Checks if the given string [s] is upper case
  ///
  bool get isUpperCase => this == this.toUpperCase();

  bool get isLowerCase => this == toLowerCase();

  bool get isAscii {
    for (var codeUnit in codeUnits) {
      if (codeUnit > _ascii) return false;
    }
    return true;
  }

  bool get isLatin1 {
    for (var codeUnit in codeUnits) {
      if (codeUnit > _latin1) return false;
    }
    return true;
  }

  String get reversed => String.fromCharCodes(runes.toList().reversed);

  bool get isInt => toIntOrNull() != null;

  int toInt() => int.parse(this);

  int toIntOrNull() => int.tryParse(this);

  bool get isDouble => toIntOrNull() != null;

  double toDouble() => double.parse(this);

  double toDoubleOrNull() => double.tryParse(this);

  List<int> toUtf8() => utf8.encode(this);

  List<int> toUtf16() => codeUnits;

  String get md5 {
    var utf8 = toUtf8();
    var digest = crypto.md5.convert(utf8);
    return String.fromCharCodes(digest.bytes);
  }

  List<String> toList() => chars.toList();

  Set<String> toSet() => chars.toSet();
}
