part of dartx_io;

extension FileSystemEntityX on FileSystemEntity {
  String get name => pathHelper.basename(path);

  String get nameWithoutExtension => pathHelper.basenameWithoutExtension(path);

  String get dirName => pathHelper.dirname(path);
}
