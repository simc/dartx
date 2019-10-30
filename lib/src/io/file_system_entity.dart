part of dartx_io;

extension FileSystemEntityX on FileSystemEntity {
  /// Gets the part of [path] after the last separator.
  /// ```dart
  /// File('path/to/foo.dart').name; // -> 'foo.dart'
  /// Directory('path/to').name;          // -> 'to'
  /// ```
  ///
  /// Trailing separators are ignored.
  /// ```dart
  /// Directory('path/to/').name; // -> 'to'
  /// ```
  String get name => path_helper.basename(path);

  /// Gets the part of [path] after the last separator, and without any trailing
  /// file extension.
  /// ```dart
  /// File('path/to/foo.dart').nameWithoutExtension; // -> 'foo'
  /// ```
  ///
  /// Trailing separators are ignored.
  /// ```dart
  /// File('path/to/foo.dart/').nameWithoutExtension; // -> 'foo'
  /// ```
  String get nameWithoutExtension => path_helper.basenameWithoutExtension(path);

  /// Gets the part of [path] before the last separator.
  /// ```dart
  /// File().dirname('path/to/foo.dart'); // -> 'path/to'
  /// Directory('path/to').dirName;          // -> 'path'
  /// ```
  ///
  /// Trailing separators are ignored.
  /// ```dart
  /// Directory('path/to/').dirName; // -> 'path'
  /// ```
  ///
  /// If an absolute path contains no directories, only a root, then the root
  /// is returned.
  /// ```dart
  /// Directory('/').dirName;  // -> '/' (posix)
  /// Directory('c:\').dirName;  // -> 'c:\' (windows)
  /// ```
  ///
  /// If a relative path has no directories, then '.' is returned.
  /// ```dart
  /// Directory('foo').dirName;  // -> '.'
  /// Directory('').dirName;  // -> '.'
  /// ```
  String get dirName => path_helper.dirname(path);

  /// Returns `true` if this entity is a path beneath `parent`, and `false`
  /// otherwise.
  /// ```dart
  /// Directory('/root/path/foo.dart').isWithin(Directory('/root/path')); // -> true
  /// Directory('/root/path').isWithin(Directory('/root/other')); // -> false
  /// Directory('/root/path').isWithin(Directory('/root/path')) // -> false
  /// ```
  bool isWithin(Directory parent) => path_helper.isWithin(parent.path, path);
}
