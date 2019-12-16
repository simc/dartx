import 'package:test/test.dart';
import 'package:dartx/dartx.dart';

class _WrappedInt implements Comparable<_WrappedInt> {
  final int value;

  _WrappedInt(this.value);

  @override
  int compareTo(_WrappedInt other) => value.compareTo(other.value);
}

void main() {
  test('comparable extension operators', () {
    final one = _WrappedInt(1);
    final ten = _WrappedInt(10);
    final hundred = _WrappedInt(100);

    expect(one < ten, isTrue);
    expect(one < one, isFalse);

    expect(one <= ten, isTrue);
    expect(ten <= ten, isTrue);
    expect(hundred <= ten, isFalse);

    expect(ten >= ten, isTrue);
    expect(ten >= one, isTrue);
    expect(ten >= hundred, isFalse);

    expect(ten > one, isTrue);
    expect(ten > ten, isFalse);
  });
}
