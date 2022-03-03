part of dartx;

extension IntSuffix<T extends int> on T {
  /// Returns a string adding a proper suffix on any integer
  ///
  /// ```dart
  /// 101.addSuffix(); // 101st
  ///
  /// 999218.addSuffix(); // 999218th
  /// ```
  String addSuffix() {
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
