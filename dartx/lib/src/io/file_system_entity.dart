part of dartx_io;

extension FileSystemEntityX on FileSystemEntity {
  String get name => path_helper.basename(path);

  String get nameWithoutExtension => path_helper.basenameWithoutExtension(path);

  String get dirName => path_helper.dirname(path);
}
