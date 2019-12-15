import 'dart:convert';

import 'package:dartx/dartx.dart';
import 'package:test/test.dart';

void main() {
  group('StringX', () {
    test('.chars', () {
      expect('test12'.chars, ['t', 'e', 's', 't', '1', '2']);
      expect('ഐ⌛酪Б👨‍👨‍👧‍👦'.chars, ['ഐ', '⌛', '酪', 'Б', '👨‍👨‍👧‍👦']);
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

    test('.isCapitalized', () {
      expect(''.isCapitalized, false);
      expect('tEST'.isCapitalized, false);
      expect('Test'.isCapitalized, true);
    });

    test('.isDecapitalized', () {
      expect(''.isDecapitalized, false);
      expect('Test'.isDecapitalized, false);
      expect('tEST'.isDecapitalized, true);
    });

    test('.reversed', () {
      expect(''.reversed, '');
      expect('test👨‍👨‍👧‍👦'.reversed, '👨‍👨‍👧‍👦tset');
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

    test('.md5)', () {
      expect(''.md5, 'd41d8cd98f00b204e9800998ecf8427e');
      expect('a'.md5, '0cc175b9c0f1b6a831c399e269772661');
      expect('abc'.md5, '900150983cd24fb0d6963f7d28e17f72');
      expect('message digest'.md5, 'f96b697d7cb7938d525a2f31aaf161d0');
      expect('ഐ⌛酪Б👨‍👨‍👧‍👦'.md5, 'c7834eff7c967101cfb65b8f6d15ad46');
      expect(
          'abcdefghijklmnopqrstuvwxyz'.md5,
          'c3fcd3d76192e4007dfb496cca67e13b'
      );
      expect(
          'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789'.md5,
          'd174ab98d277d9f5a5611c2c9f419d9f'
      );
      expect(
          '12345678901234567890123456789012345678901234567890123456789012'
              '345678901234567890'.md5,
          '57edf4a22be3c955ac49da2e2107b67a'
      );
    });
  });
}
