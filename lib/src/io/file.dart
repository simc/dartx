import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

extension FileAppendBytesExtension on File {
  /// Appends an array of [bytes] to the content of this file.
  Future<void> appendBytes(List<int> bytes) async {
    final raf = await open(mode: FileMode.writeOnlyAppend);
    await raf.writeFrom(bytes);
    await raf.close();
  }
}

extension FileAppendStringExtension on File {
  /// Appends a [string] to the content of this file using UTF-8 or the
  /// specified [encoding].
  Future<void> appendString(String string, {Encoding encoding = utf8}) async {
    final raf = await open(mode: FileMode.writeOnlyAppend);
    await raf.writeString(string);
    await raf.close();
  }
}

extension FileForEachBlockExtension on File {
  /// Reads file by byte blocks and calls [action] for each block read.
  ///
  /// This functions passes the byte buffer to the [action] function.
  ///
  /// You can use this function for huge files.
  Future<void> forEachBlock(
    int blockSize,
    void Function(Uint8List buffer) action,
  ) async {
    final raf = await open();
    // ignore: literal_only_boolean_expressions
    while (true) {
      final buffer = await raf.read(blockSize);
      if (buffer.length == blockSize) {
        action(buffer);
      } else if (buffer.isNotEmpty) {
        action(buffer);
        break;
      } else {
        break;
      }
    }
    await raf.close();
  }
}
