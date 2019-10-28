import 'package:test/test.dart';
import 'package:dartx/dartx.dart';

void main() {
  group('TimeExtension', () {
    group('Integers', () {
      test('can be converted into weeks', () {
        expect(1.weeks, Duration(days: 7));
      });

      test('can be converted into days', () {
        expect(5.days, Duration(days: 5));
      });

      test('can be converted into hours', () {
        expect(22.hours, Duration(hours: 22));
      });

      test('can be converted into minutes', () {
        expect(45.minutes, Duration(minutes: 45));
      });

      test('can be converted into seconds', () {
        expect(30.seconds, Duration(seconds: 30));
      });

      test('can be converted into milliseconds', () {
        expect(15.milliseconds, Duration(milliseconds: 15));
      });

      test('can be converted into microseconds', () {
        expect(10.microseconds, Duration(microseconds: 10));
      });

    });

    group('DateTime', () {
      test('can subtract Durations', () {
        expect(
          DateTime(2019, 1, 1, 0, 0, 30) - 30.seconds,
          DateTime(2019, 1, 1, 0, 0, 0),
          );
      });

      test('can add Durations', () {
        expect(
          DateTime(2019, 1, 1, 0, 0, 30) - 30.seconds,
          DateTime(2019, 1, 1, 0, 0, 0),
          );
      });
    });

    group('Duration', () {
      test('can be converted to weeks', () {
        expect(7.days.inWeeks, 1);
      });

      test('can be converted into a later DateTime', () {
        expect(7.days.later, _isAbout(DateTime.now() + 7.days));
      });

      test('can be converted into a previous DateTime', () {
        expect(7.days.ago, _isAbout(DateTime.now() - 7.days));
      });
    });
  });
}

// Checks if the two times returned a *just* about equal. Since `later` and
// `ago` use DateTime.now(), we can't create an expected condition that is
// exactly equal.
Matcher _isAbout(DateTime expected) => predicate<DateTime>((dateTime) =>
dateTime.millisecondsSinceEpoch - expected.millisecondsSinceEpoch < 1);