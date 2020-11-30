part of dartx_io;

extension DirectoryX on Directory {
  Directory subdir(String part1,
      [String part2,
      String part3,
      String part4,
      String part5,
      String part6,
      String part7]) {
    return Directory(
      path_helper.join(path, part1, part2, part3, part4, part5, part6, part7),
    );
  }

  /// Copies all of the files in this directory to [target].
  ///
  /// This is similar to `cp -R <from> <to>`:
  /// * Symlinks are supported.
  /// * Existing files are over-written, if any.
  /// * If [target] is within `this`, throws [ArgumentError].
  /// * If `this` and [target] are canonically the same, no operation occurs.
  ///
  /// Returns a future that completes when complete.
  Future<Null> copyRecursively(Directory target) async {
    if (path_helper.canonicalize(path) ==
        path_helper.canonicalize(target.path)) {
      return;
    }
    if (path_helper.isWithin(path, target.path)) {
      throw ArgumentError('Cannot copy $path to ${target.path}');
    }
    await target.create(recursive: true);
    await for (final file in list(recursive: true)) {
      final copyTo = path_helper.join(
          target.path, path_helper.relative(file.path, from: path));
      if (file is Directory) {
        await Directory(copyTo).create(recursive: true);
      } else if (file is File) {
        await File(file.path).copy(copyTo);
      } else if (file is Link) {
        await Link(copyTo).create(await file.target(), recursive: true);
      }
    }
  }

  /// Checks if this directory contains the [entity].
  ///
  /// The [entity] can be a [File] or a [Directory].
  /// If [recursive] is `true`, it checks the subdirectories too.
  ///
  /// Returns a [Future<bool>] holding the value.
  ///
  /// For the sync method, see [containsSync()].
  Future<bool> contains(FileSystemEntity entity,
      {bool recursive = false}) async {
    final entities = list(recursive: recursive);
    return await entities.any(
        (element) => FileSystemEntity.identicalSync(entity.path, element.path));
  }

  /// Checks if this directory contains the [entity].
  ///
  /// The [entity] can be a [File] or a [Directory].
  /// If [recursive] is `true`, it checks the subdirectories too.
  ///
  /// Returns a [bool].
  ///
  /// For the async method, see [contains()].
  bool containsSync(FileSystemEntity entity, {bool recursive = false}) {
    final entities = listSync(recursive: recursive);
    return entities.any(
        (element) => FileSystemEntity.identicalSync(entity.path, element.path));
  }
}
