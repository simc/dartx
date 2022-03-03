import 'package:dartx/dartx.dart';
import 'package:test/test.dart';

void main() {
  group(
    'intX',
    () {
      test(
        '.ordinal()',
        () {
          expect(0.ordinal(), '0th');
          expect(1.ordinal(), '1st');
          expect(2.ordinal(), '2nd');
          expect(3.ordinal(), '3rd');
          expect(4.ordinal(), '4th');
          expect(101.ordinal(), '101st');
          expect(102.ordinal(), '102nd');
          expect(103.ordinal(), '103rd');
          expect(246.ordinal(), '246th');
          expect(999.ordinal(), '999th');
        },
      );
    },
  );
}
