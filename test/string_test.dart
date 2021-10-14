import 'dart:convert';

import 'package:dartx/dartx.dart';
import 'package:test/test.dart';

void main() {
  group('StringX', () {
    test('.chars', () {
      // ignore: deprecated_member_use_from_same_package
      expect('test12'.chars, ['t', 'e', 's', 't', '1', '2']);
      expect('test12'.characters, ['t', 'e', 's', 't', '1', '2']);
      // ignore: deprecated_member_use_from_same_package
      expect('ഐ⌛酪Б👨‍👨‍👧‍👦'.chars, ['ഐ', '⌛', '酪', 'Б', '👨‍👨‍👧‍👦']);
      expect('ഐ⌛酪Б👨‍👨‍👧‍👦'.characters, ['ഐ', '⌛', '酪', 'Б', '👨‍👨‍👧‍👦']);
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
      expect(' '.isUpperCase, false);
      expect('\n'.isUpperCase, false);
      expect('0'.isUpperCase, false);
      expect('!'.isUpperCase, false);
      expect('ß'.isUpperCase, false);
      expect('Ä'.isUpperCase, true);
      expect('TESt'.isUpperCase, false);
      expect('TEST'.isUpperCase, true);
      expect('HEY, YOU!'.isUpperCase, true);
    });

    test('.isLowerCase', () {
      expect(''.isLowerCase, false);
      expect(' '.isLowerCase, false);
      expect('\n'.isLowerCase, false);
      expect('0'.isLowerCase, false);
      expect('!'.isLowerCase, false);

      // This function uses the language independent Unicode mapping and thus
      // only works in some languages.
      //
      // Doesn't work:
      // expect('ß'.isLowerCase, true);
      //
      // Reason:
      // 'ß'.toUpperCase // 'ß'

      expect('groß'.isLowerCase, true);
      expect('ä'.isLowerCase, true);
      expect('tesT'.isLowerCase, false);
      expect('test'.isLowerCase, true);
      expect('hey, you!'.isLowerCase, true);
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

    group('.toInt()', () {
      test('with radix', () {
        expect('100'.toInt(radix: 2), 4);
        expect('100'.toInt(radix: 16), 256);
        expect('FF'.toInt(radix: 16), 255);
      });

      test('without radix', () {
        expect('0'.toInt(), 0);
        expect('1'.toInt(), 1);
        expect('123456789'.toInt(), 123456789);
      });
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

    test('.md5()', () {
      expect(''.md5, 'd41d8cd98f00b204e9800998ecf8427e');
      expect('a'.md5, '0cc175b9c0f1b6a831c399e269772661');
      expect('abc'.md5, '900150983cd24fb0d6963f7d28e17f72');
      expect('message digest'.md5, 'f96b697d7cb7938d525a2f31aaf161d0');
      expect('ഐ⌛酪Б👨‍👨‍👧‍👦'.md5, 'c7834eff7c967101cfb65b8f6d15ad46');
      expect(
        'abcdefghijklmnopqrstuvwxyz'.md5,
        'c3fcd3d76192e4007dfb496cca67e13b',
      );
      expect(
        'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789'.md5,
        'd174ab98d277d9f5a5611c2c9f419d9f',
      );
      expect(
        '12345678901234567890123456789012345678901234567890123456789012'
                '345678901234567890'
            .md5,
        '57edf4a22be3c955ac49da2e2107b67a',
      );
    });

    test('.removePrefix()', () {
      expect('abc def ghi'.removePrefix('abc'), ' def ghi');
      expect(' abc def ghi'.removePrefix('abc'), ' abc def ghi');
      expect('12345'.removePrefix('123456'), '12345');
      expect('text'.removePrefix(''), 'text');
      expect('🎉🌟'.removePrefix('🎉'), '🌟');

      const expected = 'sameInstance';
      expect(expected.removePrefix(''), same(expected));
    });

    test('.removeSuffix()', () {
      expect('abc def ghi'.removeSuffix('ghi'), 'abc def ');
      expect('abc def ghi '.removeSuffix('ghi'), 'abc def ghi ');
      expect('12345'.removeSuffix('012345'), '12345');
      expect('text'.removeSuffix(''), 'text');
      expect('🎉🌟'.removeSuffix('🌟'), '🎉');

      const expected = 'sameInstance';
      expect(expected.removeSuffix(''), same(expected));
    });

    test('.removeSurrounding()', () {
      expect(
        'abc def ghi'.removeSurrounding(prefix: 'abc', suffix: 'ghi'),
        ' def ',
      );
      expect(
        'abc def ghi '.removeSurrounding(prefix: 'abc', suffix: 'ghi'),
        'abc def ghi ',
      );
      expect('12345'.removeSurrounding(prefix: '12', suffix: '45'), '3');
      expect(
        '<p>This is HTML</p>'.removeSurrounding(prefix: '<p>', suffix: '</p>'),
        'This is HTML',
      );
      expect('🎉😊🌟'.removeSurrounding(prefix: '🎉', suffix: '🌟'), '😊');

      const expected = 'sameInstance';
      expect(
        expected.removeSurrounding(prefix: '', suffix: ''),
        same(expected),
      );
    });

    test('.slice()', () {
      expect('awesomeString'.slice(0, 6), 'awesome');
      expect('awesomeString'.slice(0, -7), 'awesome');
      expect('awesomeString'.slice(7), 'String');
      expect('awesomeString'.slice(-6), 'String');
      // ignore: avoid_redundant_argument_values
      expect('awesomeString'.slice(-6, -1), 'String');
      expect('awesomeString'.slice(-6, 8), 'St');
      expect('awesomeString'.slice(0), 'awesomeString');

      expect(() => ''.slice(0), throwsRangeError);
      expect(() => ''.slice(0, 1), throwsRangeError);
      expect(() => ''.slice(-1), throwsRangeError);
      // ignore: avoid_redundant_argument_values
      expect(() => ''.slice(0, -1), throwsRangeError);
      expect(() => 'awesomeString'.slice(1, 13), throwsRangeError);
      expect(() => 'awesomeString'.slice(2, 1), throwsRangeError);
      expect(() => 'awesomeString'.slice(13), throwsRangeError);
      expect(() => 'awesomeString'.slice(-14), throwsRangeError);
      expect(() => 'awesomeString'.slice(-1, -2), throwsRangeError);
    });
  });
}
