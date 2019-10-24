import 'dart:convert';

import 'package:test/test.dart';
import 'package:dartx/dartx.dart';

void main() {
  group('StringX', () {
    test('.chars', () {
      expect('test12'.chars, ['t', 'e', 's', 't', '1', '2']);
      expect('ഐ⌛酪Б'.chars, ['ഐ', '⌛', '酪', 'Б']);
    });

    test('.capitalize()', () {
      expect(''.capitalize(), '');
      expect('123'.capitalize(), '123');
      expect('t'.capitalize(), 'T');
      expect('test'.capitalize(), 'Test');
      expect('Test'.capitalize(), 'Test');
    });

    test('.decapitalize()', () {
      expect(''.decapitalize(), '');
      expect('123'.decapitalize(), '123');
      expect('T'.decapitalize(), 't');
      expect('Test'.decapitalize(), 'test');
      expect('test'.decapitalize(), 'test');
    });

    test('.isBlank', () {
      expect('	 '.isBlank, true);
      expect('  .  '.isBlank, false);
    });

    test('.isNotBlank', () {
      expect('	 '.isNotBlank, false);
      expect('  .  '.isNotBlank, true);
    });

    test('.isUpperCase', () {
      expect(''.isUpperCase, false);
      expect('TESt'.isUpperCase, false);
      expect('TEST'.isUpperCase, true);
    });

    test('.isLowerCase', () {
      expect(''.isLowerCase, false);
      expect('tesT'.isLowerCase, false);
      expect('test'.isLowerCase, true);
    });

    test('.reversed', () {
      expect(''.reversed, '');
      expect('test'.reversed, 'tset');
    });

    test('.isInt', () {
      expect(''.isInt, false);
      expect('a'.isInt, false);
      expect('1.0'.isInt, false);
      expect('1'.isInt, true);
      expect('123456789'.isInt, true);
    });

    test('.toInt()', () {
      expect('0'.toInt(), 0);
      expect('1'.toInt(), 1);
      expect('123456789'.toInt(), 123456789);
    });

    test('.toIntOrNull()', () {
      expect(''.toIntOrNull(), null);
      expect('a'.toIntOrNull(), null);
      expect('1.0'.toIntOrNull(), null);
      expect('1'.toIntOrNull(), 1);
      expect('123456789'.toIntOrNull(), 123456789);
    });

    test('.isDouble', () {
      expect(''.isDouble, false);
      expect('a'.isDouble, false);
      expect('1'.isDouble, true);
      expect('1.0'.isDouble, true);
      expect('123456789.987654321'.isDouble, true);
    });

    test('.toDouble()', () {
      expect('0'.toDouble(), 0.0);
      expect('0.0'.toDouble(), 0.0);
      expect('1'.toDouble(), 1.0);
      expect('123456789.987654321'.toDouble(), 123456789.987654321);
    });

    test('.toDoubleOrNull()', () {
      expect(''.toDoubleOrNull(), null);
      expect('a'.toDoubleOrNull(), null);
      expect('1.123'.toDoubleOrNull(), 1.123);
      expect('1'.toDoubleOrNull(), 1.0);
      expect('123456789.987654321'.toDoubleOrNull(), 123456789.987654321);
    });

    test('.toUtf8()', () {
      expect(''.toUtf8(), []);
      expect('hello'.toUtf8(), utf8.encode('hello'));
      expect('ഐ⌛酪Б👨‍👨‍👧‍👦'.toUtf8(), utf8.encode('ഐ⌛酪Б👨‍👨‍👧‍👦'));
    });

    test('.toUtf16()', () {
      expect(''.toUtf16(), []);
      expect('hello'.toUtf16(), 'hello'.codeUnits);
      expect('ഐ⌛酪Б👨‍👨‍👧‍👦'.toUtf16(), 'ഐ⌛酪Б👨‍👨‍👧‍👦'.codeUnits);
    });
  });
}
