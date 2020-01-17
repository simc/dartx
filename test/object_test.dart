import 'package:test/test.dart';
import 'package:dartx/dartx.dart';

void main() {
  group('ObjectX', () {
    test('.as<T>()', () async {
      const Object it = "Hello";
      expect(it.as<String>() ?? "", "Hello");
      expect(it.as<int>(), null);
      expect(it.as<int>() ?? 0, 0);
      const nullIt = null;
      expect(nullIt?.as<String>() ?? "", "");
    });
  });
}
