import 'dart:io';

import 'package:dartx/dartx_io.dart';
import 'package:path/path.dart';
import 'package:test/test.dart';

void main() {
  group('Directory', () {
    test('contains', () async {
      final parentParentDir = Directory.systemTemp;
      final parentDir = parentParentDir.createTempSync('dartxDirTempDir');
      final thisDir = parentDir.createTempSync('dartxDirSubTempDir');

      final filePath = join(thisDir.path, 'foo.txt');
      final file = File(filePath);
      file.createSync();
      addTearDown(() {
        parentDir.delete(recursive: true);
      });

      // the created directory strcuture:
      //
      // parentParentDir
      //  -> parentDir
      //      -> thisDir
      //          -> foo.txt

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
    });

    test('containsSync', () {
      final parentParentDir = Directory.systemTemp;
      final parentDir = parentParentDir.createTempSync('dartxDirTempDir');
      final thisDir = parentDir.createTempSync('dartxDirSubTempDir');

      final filePath = join(thisDir.path, 'foo.txt');
      final file = File(filePath);
      file.createSync();
      addTearDown(() {
        parentDir.delete(recursive: true);
      });

      // the created directory strcuture:
      //
      // parentParentDir
      //  -> parentDir
      //      -> thisDir
      //          -> foo.txt

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
    });
  });

  group('directory()', () {
    test('without / at end', () {
      final rootDir = Directory.systemTemp.createTempSync('root');
      final level1 = rootDir.directory('level1')..createSync();
      final dir = level1.directory('dir');
      expect(dir.path, isNot(contains('//')));
    });

    test('with / at end', () {
      final rootDir = Directory.systemTemp.createTempSync('root');
      final level1 = rootDir.directory('/level1/')..createSync();
      final dir = level1.directory('/dir/');
      expect(dir.path, isNot(contains('//')));
    });
  });

  group('file', () {
    test('without / at end', () {
      final rootDir = Directory.systemTemp.createTempSync('root');
      final level1 = rootDir.directory('level1')..createSync();
      final level2 = level1.directory('level2')..createSync();
      expect(level2.absolute.path, endsWith('/level1/level2'));
      final file = level2.file('test.txt');
      expect(file.path, endsWith('/level1/level2/test.txt'));
    });

    test('with / at end', () {
      final rootDir = Directory.systemTemp.createTempSync('root');
      final level1 = rootDir.directory('level1/')..createSync();
      final level2 = level1.directory('level2/')..createSync();
      expect(level2.absolute.path, endsWith('/level1/level2/'));
      final file = level2.file('/test.txt');
      expect(file.path, endsWith('/level1/level2/test.txt'));
    });
  });
}
