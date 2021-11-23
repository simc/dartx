part of dartx;

const _ascii = 0x007f;
const _latin1 = 0x00ff;

extension StringCharsExtension on String {
  /// The characters of a string.
  ///
  /// A character is a Unicode Grapheme cluster represented by a substring of
  /// the original string.
  ///
  /// Please use [StringCharacters].characters
  /// https://github.com/dart-lang/characters/blob/10527437926f1b454edf9912fe700aa2506b1c3d/lib/src/extensions.dart#L9
  @Deprecated('Use .characters from the official characters package')
  Iterable<String> get chars => characters.Characters(this);
}

extension StringCapitalizeExtension on String {
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
}

extension StringDecapitalizeExtension on String {
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
}

extension StringIsBlankExtension on String {
  /// Returns `true` if this string is empty or consists solely of whitespace
  /// characters.
  bool get isBlank => trimLeft().isEmpty;
}

extension StringIsNotBlankExtension on String {
  /// Returns `true` if this char sequence is not empty and contains some
  /// characters except of whitespace characters.
  bool get isNotBlank => !isBlank;
}

extension StringIsUpperCaseExtension on String {
  /// Returns `true` if the whole string is upper case.
  ///
  /// ```dart
  /// 'HI'.isUpperCase // true
  /// 'Hi'.isUpperCase // false
  /// '!'.isUpperCase // false
  /// 'HEY, YOU!'.isUpperCase // true
  /// ```
  bool get isUpperCase => this == toUpperCase() && this != toLowerCase();
}

extension StringIsLowerCaseExtension on String {
  /// Returns `true` if the whole string is lower case.
  ///
  /// ```dart
  /// 'hi'.isLowerCase // true
  /// 'Hi'.isLowerCase // false
  /// '!'.isLowerCase // false
  /// 'hey, you!'.isLowerCase // true
  /// ```
  bool get isLowerCase => this == toLowerCase() && this != toUpperCase();
}

extension StringIsCapitalizedExtension on String {
  /// Returns `true` if the first character is upper case.
  bool get isCapitalized => isNotEmpty && this[0].isUpperCase;
}

extension StringIsDecapitalizedExtension on String {
  /// Returns `true` if the first character is lower case.
  bool get isDecapitalized => isNotEmpty && this[0].isLowerCase;
}

extension StringIsAsciiExtension on String {
  /// Returns `true` if the string is ASCII encoded.
  bool get isAscii {
    for (final codeUnit in codeUnits) {
      if (codeUnit > _ascii) return false;
    }
    return true;
  }
}

extension StringIsLatin1Extension on String {
  /// Returns `true` if the string is Latin 1 encoded.
  bool get isLatin1 {
    for (final codeUnit in codeUnits) {
      if (codeUnit > _latin1) return false;
    }
    return true;
  }
}

extension StringReversedExtension on String {
  /// Returns a new string with characters in reversed order.
  String get reversed {
    final range = characters.Characters(this).iteratorAtEnd;
    final buffer = StringBuffer();
    while (range.moveBack()) {
      buffer.write(range.current);
    }
    return buffer.toString();
  }
}

extension StringIsIntExtension on String {
  /// Returns `true` if the string can be parsed as an integer.
  bool get isInt => toIntOrNull() != null;
}

extension StringToIntExtension on String {
  /// Parses the string as an [int] number and returns the result.
  ///
  /// The [radix] must be in the range 2..36. The digits used are
  /// first the decimal digits 0..9, and then the letters 'a'..'z' with
  /// values 10 through 35. Also accepts upper-case letters with the same
  /// values as the lower-case ones.
  ///
  /// If no [radix] is given then it defaults to 10.
  int toInt({int? radix}) => int.parse(this, radix: radix);
}

extension StringToIntOrNullExtension on String {
  /// Parses the string as an [int] number and returns the result or `null` if
  /// the string is not a valid representation of a number.
  ///
  /// The [radix] must be in the range 2..36. The digits used are
  /// first the decimal digits 0..9, and then the letters 'a'..'z' with
  /// values 10 through 35. Also accepts upper-case letters with the same
  /// values as the lower-case ones.
  ///
  /// If no [radix] is given then it defaults to 10.
  int? toIntOrNull({int? radix}) => int.tryParse(this, radix: radix);
}

extension StringIsDoubleExtension on String {
  /// Returns `true` if the string can be parsed as a `double`.
  bool get isDouble => toDoubleOrNull() != null;
}

extension StringToDoubleExtension on String {
  /// Parses the string as a [double] number and returns the result.
  double toDouble() => double.parse(this);
}

extension StringToDoubleOrNullExtension on String {
  /// Parses the string as a [double] number and returns the result or `null`
  /// if the String is not a valid representation of a number.
  double? toDoubleOrNull() => double.tryParse(this);
}

extension StringToUtf8Extension on String {
  /// Encodes String as UTF-8.
  List<int> toUtf8() => utf8.encode(this);
}

extension StringToUtf16Extension on String {
  /// Encodes String as UTF-16.
  List<int> toUtf16() => codeUnits;
}

extension StringMd5Extension on String {
  /// Calculates the MD5 digest and returns the value as a [String] of
  /// hexadecimal digits.
  ///
  /// ```dart
  /// print('abc'.md5); //900150983cd24fb0d6963f7d28e17f72
  /// print('message digest'.md5); //f96b697d7cb7938d525a2f31aaf161d0
  /// ```
  String get md5 => crypto.md5.convert(toUtf8()).toString();
}

extension StringRemovePrefixExtension on String {
  /// If this [String] starts with the given [prefix], returns a copy of this
  /// string with the prefix removed. Otherwise, returns this [String].
  String removePrefix(String prefix) {
    if (startsWith(prefix)) {
      return substring(prefix.length, length);
    } else {
      return this;
    }
  }
}

extension StringRemoveSuffixExtension on String {
  /// If this [String] ends with the given [suffix], returns a copy of this
  /// [String] with the suffix removed. Otherwise, returns this [String].
  String removeSuffix(String suffix) {
    if (endsWith(suffix)) {
      return substring(0, length - suffix.length);
    } else {
      return this;
    }
  }
}

extension StringRemoveSurroundingExtension on String {
  /// Removes from a [String] both the given [prefix] and [suffix] if and only
  /// if it starts with the [prefix] and ends with the [suffix].
  /// Otherwise returns this [String] unchanged.
  String removeSurrounding({required String prefix, required String suffix}) {
    if (startsWith(prefix) && endsWith(suffix)) {
      return substring(prefix.length, length - suffix.length);
    } else {
      return this;
    }
  }
}

extension StringSliceExtension on String {
  /// Returns a new substring containing all characters between [start]
  /// (inclusive) and [end] (inclusive).
  /// If [end] is omitted, it is being set to `lastIndex`.
  ///
  ///  ```dart
  /// print('awesomeString'.slice(0,6)); // awesome
  /// print('awesomeString'.slice(7)); // String
  /// ```
  String slice(int start, [int end = -1]) {
    final _start = start < 0 ? start + length : start;
    final _end = end < 0 ? end + length : end;

    RangeError.checkValidRange(_start, _end, length);

    return substring(_start, _end + 1);
  }
}

extension NullableStringIsNullOrEmptyExtension on String? {
  /// Returns `true` if the string is either `null` or empty.
  bool get isNullOrEmpty => this?.isEmpty ?? true;
}

extension NullableStringIsNotNullOrEmptyExtension on String? {
  /// Returns `true` if the string is neither null nor empty.
  bool get isNotNullOrEmpty => !isNullOrEmpty;
}

extension NullableStringOrEmptyExtension on String? {
  /// Returns the string if it is not `null`, or the empty string otherwise.
  String orEmpty() => this ?? '';
}

extension StringMatchesExtension on String {
  /// Returns `true` if this char sequence matches the given regular expression.
  bool matches(RegExp regex) => regex.hasMatch(this);
}

extension StringIsHttpExtension on String {
  /// If the string is a HTTP URL (ie. Starts with http:// or https://)
  bool get isHttp => matches(RegExp('(http|https)://[^\\s]*'));
}

extension StringUrlCodingExtension on String {
  /// Translates a string into application/x-www-form-urlencoded format using a specific encoding scheme.
  String get urlEncode => Uri.encodeFull(this);

  /// Decodes an application/x-www-form-urlencoded string using a specific encoding scheme.
  String get urlDecode => Uri.decodeFull(this);
}

extension StringCountExtension on String {
  /// Return the number of non-overlapping occurrences of substring sub in
  /// string. Optional arguments start and end are interpreted as in slice notation
  ///
  /// #### Example :
  ///
  /// ```dart
  /// const text = 'I love apples, apple are my favorite fruit';
  /// print(text.count('apple', 0, 20)) // 2
  /// ```
  int count(String sub, [int start = 0, int? end]) {
    final len = length - 1;
    return sub.allMatches(slice(start, end ?? len)).length;
  }
}

extension StringPartitionExtension on String {
  /// Partition the string into three parts using the given separator.
  ///
  /// This will search for the separator in the string. If the separator is found, returns a 3-list containing the part before the separator, the separator itself, and the part after it.
  /// If the separator is not found, returns a 3-list containing the original string and two empty strings.
  ///
  /// #### Example :
  ///
  /// ```dart
  /// const text = 'I could eat bananas all day';
  /// print(text.partition('bananas') // ['I could eat ', 'bananas', ' all day']
  /// print(text.partition('apple') // ['I could eat bananas all day', '', '']
  /// ```
  List<String> partition(String seperator) {
    if (contains(seperator)) {
      final firstIndex = indexOf(seperator);
      return [
        substring(0, firstIndex),
        substring(firstIndex, firstIndex + seperator.length),
        substring(firstIndex + seperator.length, length)
      ];
    } else {
      return [this, '', ''];
    }
  }
}

extension StringCenterExtension on String {
  /// Return a centered string of length width.
  ///
  /// Padding is done using the specified fill character (default is a space).
  ///
  /// #### Example :
  ///
  /// ```dart
  /// const text = 'banana';
  /// print(text.center(2, '*')); // **banana**
  /// ```
  String center(int width, [String fillChar = ' ']) =>
      '${fillChar * width}${this}${fillChar * width}';
}

extension StringLeftJustifyExtension on String {
  /// Return a left-justified string of length width.
  ///
  /// Padding is done using the specified fill character (default is a space).
  ///
  /// #### Example :
  ///
  /// ```dart
  /// const text = 'banana';
  /// print(text.leftJust(2, '*')); // **banana
  /// ```
  String leftJustify(int width, [String fillChar = ' ']) =>
      '${fillChar * width}${this}';
}

extension StringRightJustifyExtension on String {
  /// Return a right-justified string of length width.
  ///
  /// Padding is done using the specified fill character (default is a space).
  ///
  /// #### Example :
  ///
  /// ```dart
  /// const text = 'banana';
  /// print(text.rightJust(2, '*')); // banana**
  /// ```
  String rightJustify(int width, [String fillChar = ' ']) =>
      '${this}${fillChar * width}';
}

extension StringTitleExtension on String {
  /// Return a version of the string where each word is titlecased.
  ///
  /// More specifically, words start with uppercased characters and all remaining cased characters have lower case.
  ///
  /// #### Example :
  ///
  /// ```dart
  /// const text = 'welcome to my 2nd world';
  /// print(text.title()); // Welcome To My 2nd World
  /// ```
  String title() {
    return split(' ').map((e) => e.capitalize()).joinToString(separator: ' ');
  }
}

extension StringBufferWriteSpaceExtension on StringBuffer {
  /// Add a space to the buffer.
  void writeSpace() => write(' ');
}

/// Builds new string by populating newly created [StringBuffer] using provided [builderAction]
/// and then converting it to [String].
String buildString(void Function(StringBuffer it) builderAction) {
  final buffer = StringBuffer();
  builderAction(buffer);
  return buffer.toString();
}
