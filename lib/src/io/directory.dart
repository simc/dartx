import 'dart:io';

import 'package:path/path.dart' as path_helper;

extension DirectorySubDirExtension on Directory {
  Directory subdir(
    String part1, [
    String? part2,
    String? part3,
    String? part4,
    String? part5,
    String? part6,
    String? part7,
  ]) {
    return Directory(
      path_helper.join(path, part1, part2, part3, part4, part5, part6, part7),
    );
  }
}

extension DirectoryCopyRecursivelyExtension on Directory {
  /// Copies all of the files in this directory to [target].
  ///
  /// This is similar to `cp -R <from> <to>`:
  /// * Symlinks are supported.
  /// * Existing files are over-written, if any.
  /// * If [target] is within `this`, throws [ArgumentError].
  /// * If `this` and [target] are canonically the same, no operation occurs.
  ///
  /// Returns a future that completes when complete.
  Future<void> copyRecursively(Directory target) async {
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
        target.path,
        path_helper.relative(file.path, from: path),
      );
      if (file is Directory) {
        await Directory(copyTo).create(recursive: true);
      } else if (file is File) {
        await File(file.path).copy(copyTo);
      } else if (file is Link) {
        await Link(copyTo).create(await file.target(), recursive: true);
      }
    }
  }
}

extension DirectoryContainsExtension on Directory {
  /// Checks if this directory contains the [entity].
  ///
  /// The [entity] can be a [File] or a [Directory].
  /// If [recursive] is `true`, it checks the subdirectories too.
  ///
  /// Returns a [Future<bool>] holding the value.
  ///
  /// For the sync method, see [containsSync()].
  Future<bool> contains(
    FileSystemEntity entity, {
    bool recursive = false,
  }) async {
    final entities = list(recursive: recursive);
    return entities.any(
      (element) => FileSystemEntity.identicalSync(entity.path, element.path),
    );
  }
}

extension DirectoryContainsSyncExtension on Directory {
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
      (element) => FileSystemEntity.identicalSync(entity.path, element.path),
    );
  }
}

extension DirectoryFileExtension on Directory {
  /// Returns a [File] within the [Directory]
  ///
  /// ```dart
  /// Directory androidDir = Directory('flutter-app/android');
  /// File manifestFile = androidDir.file("app/src/main/AndroidManifest.xml");
  /// ```
  File file(String filePath) {
    final sb = StringBuffer(absolute.path);
    final path = sb.toString();
    if (!path.endsWith(Platform.pathSeparator) &&
        !filePath.startsWith(Platform.pathSeparator)) {
      // no separator between dir and filePath
      sb.write(Platform.pathSeparator);
    }
    if (path.startsWith(Platform.pathSeparator) &&
        filePath.startsWith(Platform.pathSeparator)) {
      // joining would cause a double //
      final path = filePath.replaceFirst(Platform.pathSeparator, '');
      sb.write(path);
    } else {
      sb.write(filePath);
    }
    return File(sb.toString());
  }
}

extension DirectoryDirectoryExtension on Directory {
  /// Returns a directory within the [Directory]
  ///
  /// ```dart
  /// Directory androidDir = Directory('flutter-app/android');
  /// Directory mainSrc = androidDir.directory("app/src/main");
  /// ```
  Directory directory(String dirPath) {
    final sb = StringBuffer(absolute.path);
    final path = sb.toString();
    if (!path.endsWith(Platform.pathSeparator) &&
        !dirPath.startsWith(Platform.pathSeparator)) {
      // no separator between dir and filePath
      sb.write(Platform.pathSeparator);
    }
    if (path.startsWith(Platform.pathSeparator) &&
        dirPath.startsWith(Platform.pathSeparator)) {
      // joining would cause a double //
      final path = dirPath.replaceFirst(Platform.pathSeparator, '');
      sb.write(path);
    } else {
      sb.write(dirPath);
    }
    return Directory(sb.toString());
  }
}
