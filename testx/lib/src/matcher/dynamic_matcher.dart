part of testx;

extension DynamicMatcher on dynamic {
  dynamic shouldBe(dynamic other, {String reason}) {
    expect(this, other, reason: reason);
    return this;
  }

  dynamic shouldNotBe(dynamic other, {String reason}) {
    expect(this, isNot(other), reason: reason);
    return this;
  }

  dynamic shouldBeEqual(dynamic other, {String reason}) {
    expect(this == other, true, reason: reason);
    return this;
  }

  dynamic shouldNotBeEqual(dynamic other, {String reason}) {
    expect(this != other, true, reason: reason);
    return this;
  }

  dynamic shouldBeIdentical(dynamic other, {String reason}) {
    expect(identical(this, other), true, reason: reason);
    return this;
  }

  dynamic shouldNotBeIdentical(dynamic other, {String reason}) {
    expect(!identical(this, other), true, reason: reason);
    return this;
  }
}
