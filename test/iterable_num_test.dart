import 'dart:math';

import 'package:test/test.dart';
import 'package:dartx/dartx.dart';

void main() {
  group('IterableNumX', () {
    group('.sum()', () {
      test('int', () {
        expect(<int>[].sum(), 0);
        expect([1, 2, 3, 4, 5].sum(), 15);
        expect([1, 2, 0, 3, 4, null, 5, 6, null, 9].sum(), 30);
      });

      test('double', () {
        expect(<double>[].sum(), 0);
        expect([1.0, 2.5, 3.0, 4.0, 5.0].sum(), 15.5);
        expect([1.0, 2.5, 0, 3, 4, null, 5.0, 6, null, 9].sum(), 30.5);
      });
    });

    test('.average()', () {
      expect(<int>[].average, throwsStateError);
      expect([1, 2, 3, 4, 5].average(), 3.0);
      expect([1, 2, 0, 3, 4, null, 5, 6, null, 9].average(), 3.0);
    });

    test('.median()', () {
      expect(<int>[].median, throwsStateError);
      // odd
      expect([1, 2, 3, 4, 5].median(), 3);
      expect([5, 3, 2, 4, 1].median(), 3);

      // even
      expect([5, 3, 2, 4, 1, 1].median(), 2.5);

      // removes nulls
      expect([1, 2, 0, 3, 4, null, 5, 6, null, 9].median(), 3.5);

      // handles double values
      expect([1.5, 2, 2.5, 4, 5].median(), 2.5);
    });

    test('.mode()', () {
      expect(<int>[].mode, throwsStateError);
      expect([1, 2, 2, 4, 5].mode(), 2);
      expect([5, 3, 2, 4, 6, 1, 5].mode(), 5);
      expect([5, 3, 2, 4, 1, 1, null, null, null].mode(), 1);
      expect([2.5, 2, 2.5, 4, 5].mode(), 2.5);
    });

    test('.variance()', () {
      expect(<int>[].variance(), 0);
      expect([1].variance(), 0);
      expect([2, 4, 6, 8, 10].variance(), 10);
      expect([2, 4, 6, 8, 10].variance(sample: false), 8);
      expect([2, 4, 6, 8, 10, null, null, null].variance(), 10);
    });

    test('.stdDev()', () {
      expect(<int>[].stdDev(), 0);
      expect([1].stdDev(), 0);
      expect([2, 4, 6, 8, 10].stdDev(), sqrt(10));
      expect([2, 4, 6, 8, 10].stdDev(sample: false), sqrt(8));
      expect([2, 4, 6, 8, 10, null, null, null].stdDev(), sqrt(10));
    });
  });
}
