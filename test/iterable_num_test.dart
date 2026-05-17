import 'package:dartx/dartx.dart';
import 'package:test/test.dart';

void main() {
  group('IterableNumX', () {
    group('.sum()', () {
      test('int', () {
        expect(<int>[].sum(), 0);
        expect([1, 2, 3, 4, 5].sum(), 15);
      });

      test('double', () {
        expect(<double>[].sum(), 0);
        expect([1.0, 2.5, 3.0, 4.0, 5.0].sum(), 15.5);
      });
    });

    test('.average()', () {
      expect(() => <int>[].average(), throwsStateError);
      expect([1, 2, 3, 4, 5].average(), 3.0);
    });

    test('.median()', () {
      expect(() => <int>[].median(), throwsStateError);
      // odd
      expect([1, 2, 3, 4, 5].median(), 3);
      expect([5, 3, 2, 4, 1].median(), 3);

      // even
      expect([5, 3, 2, 4, 1, 1].median(), 2.5);

      // handles double values
      expect([1.5, 2, 2.5, 4, 5].median(), 2.5);
    });

    test('.min()', () {
      expect(() => <int>[].min(), throwsStateError);
      expect([5, 3, 2, 4, 1].min(), 1);
      expect([5.0, 3.0, 2.0, 4.0, 1.0].min(), 1.0);
    });

    test('.max()', () {
      expect(() => <int>[].max(), throwsStateError);
      expect([5, 3, 2, 4, 1].max(), 5);
      expect([5.0, 3.0, 2.0, 4.0, 1.0].max(), 5.0);
    });
  });
}
