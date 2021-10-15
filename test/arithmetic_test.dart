import 'package:test/test.dart';
import 'package:dartx/dartx.dart';

void main() {
  group('num', () {
    test('num?.plus() and num?.minus()', () {
      const num? value = null;
      expect(value?.minus(1), null);
      expect(value?.minus(1) ?? -1, -1);
      expect((value ?? 0) - 1, -1);

      expect(value?.plus(1), null);
      expect(value?.plus(1) ?? 1, 1);
      expect((value ?? 0) + 1, 1);
    });
    test('num?.plusOrNull() and num?.minusOrNull()', () {
      const num? value = null;
      const num one = 1;
      expect(one.plus(value), 1);
      expect(one.plusOrNull(value), null);
      expect(one.plusOrNull(value) ?? 1, 1);

      expect(one.minus(value), 1);
      expect(one.minusOrNull(value), null);
      expect(one.minusOrNull(value) ?? 1, 1);
    });
  });

  group('int', () {
    test('int?.plus() and int?.minus()', () {
      const int? value = null;
      expect(value?.minus(1), null);
      expect(value?.minus(1) ?? -1, -1);
      expect((value ?? 0) - 1, -1);

      expect(value?.plus(1), null);
      expect(value?.plus(1) ?? 1, 1);
      expect((value ?? 0) + 1, 1);
    });
    test('int?.plusOrNull() and int?.minusOrNull()', () {
      const int? value = null;
      expect(1.plus(value), 1);
      expect(1.plusOrNull(value), null);
      expect(1.plusOrNull(value) ?? 1, 1);

      expect(1.minus(value), 1);
      expect(1.minusOrNull(value), null);
      expect(1.minusOrNull(value) ?? 1, 1);
    });
  });

  group('double', () {
    test('double?.plus() and double?.minus()', () {
      const double? value = null;
      expect(value?.minus(1), null);
      expect(value?.minus(1) ?? -1, -1);
      expect((value ?? 0) - 1, -1);

      expect(value?.plus(1), null);
      expect(value?.plus(1) ?? 1, 1);
      expect((value ?? 0) + 1, 1);
    });
    test('double?.plusOrNull() and double?.minusOrNull()', () {
      const double? value = null;
      expect(1.0.plus(value), 1.0);
      expect(1.0.plusOrNull(value), null);
      expect(1.0.plusOrNull(value) ?? 1.0, 1.0);

      expect(1.0.minus(value), 1.0);
      expect(1.0.minusOrNull(value), null);
      expect(1.0.minusOrNull(value) ?? 1.0, 1.0);
    });
  });
}
