import 'package:test/test.dart';
import 'package:dartx/dartx.dart';

void main() {
  group('NumX', () {
    test('.microseconds', () {
      expect(123.microseconds, Duration(microseconds: 123));
      expect(1.2345.microseconds, Duration(microseconds: 1));
    });

    test('.milliseconds', () {
      expect(123.milliseconds, Duration(milliseconds: 123));
      expect(1.2345.milliseconds, Duration(microseconds: 1234));
    });

    test('.seconds', () {
      expect(123.seconds, Duration(seconds: 123));
      expect(1.2345678.seconds, Duration(microseconds: 1234567));
    });

    test('.minutes', () {
      expect(123.minutes, Duration(minutes: 123));
      expect(1.1.minutes, Duration(microseconds: 66000000));
    });

    test('.hours', () {
      expect(123.hours, Duration(hours: 123));
      expect(1.1.hours, Duration(microseconds: 3960000000));
    });

    test('.days', () {
      expect(123.days, Duration(days: 123));
      expect(1.1.days, Duration(microseconds: 95040000000));
    });

    test('.coerceIn()', () {
      expect(10.coerceIn(0), 10);
      expect(10.coerceIn(12), 12);
      expect(10.coerceIn(0, 11), 10);
      expect(10.coerceIn(0, 9), 9);
      expect(() => 10.coerceIn(3, 2), throwsArgumentError);
    });

    test('.coerceAtLeast()', () {
      expect(10.coerceAtLeast(0), 10);
      expect(10.coerceAtLeast(12), 12);
    });

    test('.coerceAtMost()', () {
      expect(10.coerceAtMost(12), 10);
      expect(10.coerceAtMost(5), 5);
    });

    test('.toBytes()', () {});
  });
}
