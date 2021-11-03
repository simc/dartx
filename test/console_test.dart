import 'package:test/test.dart';
import 'package:test_process/test_process.dart';

void main() {
  group('Console', () {
    test('printx()', () async {
      final process = await TestProcess.start(
        'dart',
        ['test/console_files/console_printx.dart'],
      );

      await expectLater(process.stdout, emits('hello world,1,0.5,false'));
      await process.shouldExit(0);
    });

    test('readChar()', () async {
      final process = await TestProcess.start(
        'dart',
        ['test/console_files/console_read_char.dart'],
      );
      process.stdin.writeln('hi');

      await expectLater(process.stdout, emits('h'));
      await process.shouldExit(0);
    });

    test('readCharacters()', () async {
      final process = await TestProcess.start(
        'dart',
        ['test/console_files/console_read_characters.dart'],
      );
      process.stdin.writeln('hi whats up');

      await expectLater(process.stdout, emits('hi wha'));
      await process.shouldExit(0);
    });

    test('readDouble()', () async {
      final process = await TestProcess.start(
        'dart',
        ['test/console_files/console_read_double.dart'],
      );
      process.stdin.writeln('3.14');

      await expectLater(process.stdout, emits('3.14'));
      await process.shouldExit(0);
    });

    test('readDoubles()', () async {
      final process = await TestProcess.start(
        'dart',
        ['test/console_files/console_read_doubles.dart'],
      );
      process.stdin.writeln('3.14\n2.19\n');

      await expectLater(process.stdout, emits('[3.14, 2.19]'));
      await process.shouldExit(0);
    });

    test('readInt()', () async {
      final process = await TestProcess.start(
        'dart',
        ['test/console_files/console_read_int.dart'],
      );
      process.stdin.writeln('20');

      await expectLater(process.stdout, emits('20'));
      await process.shouldExit(0);
    });

    test('readInts()', () async {
      final process = await TestProcess.start(
        'dart',
        ['test/console_files/console_read_ints.dart'],
      );
      process.stdin.writeln('20\n16\n13\n');

      await expectLater(process.stdout, emits('[20, 16, 13]'));
      await process.shouldExit(0);
    });

    test('readLine()', () async {
      final process = await TestProcess.start(
        'dart',
        ['test/console_files/console_read_line.dart'],
      );
      process.stdin.writeln('this is a test.');

      await expectLater(process.stdout, emits('this is a test.'));
      await process.shouldExit(0);
    });

    test('readLines()', () async {
      final process = await TestProcess.start(
        'dart',
        ['test/console_files/console_read_lines.dart'],
      );
      process.stdin.writeln('this is a test.\n9999999\nhi there.\n100.0\n');

      await expectLater(
        process.stdout,
        emits('[this is a test., 9999999, hi there., 100.0]'),
      );
      await process.shouldExit(0);
    });

    test('readStrings()', () async {
      final process = await TestProcess.start(
        'dart',
        ['test/console_files/console_read_strings.dart'],
      );
      process.stdin.writeln('this is a test :)\n');

      await expectLater(process.stdout, emits('[this, is, a, test, :)]'));
      await process.shouldExit(0);
    });

    test('read()', () async {
      final process = await TestProcess.start(
        'dart',
        ['test/console_files/console_read.dart'],
      );
      process.stdin.writeln('lorem lorem\n');

      await expectLater(process.stdout, emits('lorem'));
      await process.shouldExit(0);
    });
  });
}
