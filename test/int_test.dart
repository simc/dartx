import 'package:dartx/dartx.dart';
import 'package:test/test.dart';

void main() {
  group(
    'intX',
    () {
      test(
        '.addSuffix()',
        () {
          expect(1.addSuffix(), '1st');
          expect(2.addSuffix(), '2nd');
          expect(3.addSuffix(), '3rd');
          expect(4.addSuffix(), '4th');
          expect(101.addSuffix(), '101st');
          expect(102.addSuffix(), '102nd');
          expect(246.addSuffix(), '246th');
          expect(999.addSuffix(), '999th');
        },
      );
    },
  );
}
