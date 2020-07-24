import 'dart:io';

import 'package:test/test.dart';
import 'package:dartx/dartx_io.dart';

void main() {
  group('Directory', () {
    test('contains', () async {
      final thisDir = Directory.current;
      final parentDir = thisDir.parent;
      final parentParentDir = parentDir.parent;
      File('foo.txt').createSync();
      final file = File('foo.txt');

      expect(await parentDir.contains(thisDir), true);
      expect(await parentDir.contains(thisDir, recursive: true), true);
      expect(await thisDir.contains(parentDir), false);
      expect(await thisDir.contains(thisDir), false);
      expect(await parentParentDir.contains(thisDir), false);
      expect(await parentParentDir.contains(thisDir, recursive: true), true);

      expect(await thisDir.contains(file), true);
      expect(await thisDir.contains(file, recursive: true), true);
      expect(await parentDir.contains(file), false);
      expect(await parentDir.contains(file, recursive: true), true);

      file.deleteSync();
    });
    test('containsSync', () {
      final thisDir = Directory.current;
      final parentDir = thisDir.parent;
      final parentParentDir = parentDir.parent;
      File('foo.txt').createSync();
      final file = File('foo.txt');

      expect(parentDir.containsSync(thisDir), true);
      expect(parentDir.containsSync(thisDir, recursive: true), true);
      expect(thisDir.containsSync(parentDir), false);
      expect(thisDir.containsSync(thisDir), false);
      expect(parentParentDir.containsSync(thisDir), false);
      expect(parentParentDir.containsSync(thisDir, recursive: true), true);

      expect(thisDir.containsSync(file), true);
      expect(thisDir.containsSync(file, recursive: true), true);
      expect(parentDir.containsSync(file), false);
      expect(parentDir.containsSync(file, recursive: true), true);

      file.deleteSync();
    });
  });
}
