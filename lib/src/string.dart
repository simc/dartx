part of dartx;

const _ascii = 0x007f;
const _latin1 = 0x00ff;

extension StringX on String {
  /// The characters of a string.
  ///
  /// A character is a Unicode Grapheme cluster represented by a substring of
  /// the original string.
  Iterable<String> get chars => Characters(this);

  /// Returns a copy of this string having its first letter uppercased, or the
  /// original string, if it's empty or already starts with an upper case
  /// letter.
  ///
  /// ```dart
  /// print('abcd'.capitalize()) // Abcd
  /// print('Abcd'.capitalize()) // Abcd
  /// ```
  String capitalize() {
    switch (length) {
      case 0:
        return this;
      case 1:
        return toUpperCase();
      default:
        return substring(0, 1).toUpperCase() + substring(1);
    }
  }

  /// Returns a copy of this string having its first letter lowercased, or the
  /// original string, if it's empty or already starts with a lower case letter.
  ///
  /// ```dart
  /// print('abcd'.decapitalize()) // abcd
  /// print('Abcd'.decapitalize()) // abcd
  /// ```
  String decapitalize() {
    switch (length) {
      case 0:
        return this;
      case 1:
        return toLowerCase();
      default:
        return substring(0, 1).toLowerCase() + substring(1);
    }
  }

  /// Returns `true` if this string is empty or consists solely of whitespace
  /// characters.
  bool get isBlank => trimLeft().isEmpty;

  /// Returns `true` if this char sequence is not empty and contains some
  /// characters except of whitespace characters.
  bool get isNotBlank => !isBlank;

  /// Returns `true` if the whole string is upper case.
  bool get isUpperCase => isNotEmpty && this == toUpperCase();

  /// Returns `true` if the whole string is lower case.
  bool get isLowerCase => isNotEmpty && this == toLowerCase();

  /// Returns `true` if the first character is upper case.
  bool get isCapitalized => isNotEmpty && this[0].isUpperCase;

  /// Returns `true` if the first character is lower case.
  bool get isDecapitalized => isNotEmpty && this[0].isLowerCase;

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

  /// Returns a new string with characters in reversed order.
  String get reversed {
    var range = Characters(this).iteratorAtEnd;

    var buffer = StringBuffer();
    while (range.moveBack()) {
      buffer.write(range.current);
    }

    return buffer.toString();
  }

  bool get isInt => toIntOrNull() != null;

  /// Parses the string as an [int] number and returns the result.
  int toInt() => int.parse(this);

  /// Parses the string as an [int] number and returns the result or `null` if
  /// the string is not a valid representation of a number.
  int toIntOrNull() => int.tryParse(this);

  bool get isDouble => toDoubleOrNull() != null;

  /// Parses the string as a [double] number and returns the result.
  double toDouble() => double.parse(this);

  /// Parses the string as an [double] number and returns the result or `null`
  /// if the string is not a valid representation of a number.
  double toDoubleOrNull() => double.tryParse(this);

  List<int> toUtf8() => utf8.encode(this);

  List<int> toUtf16() => codeUnits;

  /// Calculates the MD5 digest and returns the value as a [String] of
  /// hexadecimal digits.
  ///
  /// ```dart
  /// print('abc'.md5); //900150983cd24fb0d6963f7d28e17f72
  /// print('message digest'.md5); //f96b697d7cb7938d525a2f31aaf161d0
  /// ```
  String get md5 => crypto.md5.convert(toUtf8()).toString();

  /// Returns true if it equals to 'true' or 'on' or '1',
  /// otherwise returns false
  bool get toBool => toLowerCase() == 'true'
    || toLowerCase() == 'on'
    || this == '1';
}