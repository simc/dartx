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
      expect(() => <int>[].average(), throwsStateError);
      expect([1, 2, 3, 4, 5].average(), 3.0);
      expect([1, 2, 0, 3, 4, null, 5, 6, null, 9].average(), 3.0);
    });
  });
}
