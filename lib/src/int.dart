extension Ordinals<T extends int> on T {
  /// Returns an ordinal number of `String` type for any integer
  ///
  /// ```dart
  /// 101.ordinal(); // 101st
  ///
  /// 999218.ordinal(); // 999218th
  /// ```
  String ordinal() {
    final onesPlace = this % 10;
    final tensPlace = ((this / 10).floor()) % 10;
    if (tensPlace == 1) {
      return '${this}th';
    } else {
      switch (onesPlace) {
        case 1:
          return '${this}st';
        case 2:
          return '${this}nd';
        case 3:
          return '${this}rd';
        default:
          return '${this}th';
      }
    }
  }
}
