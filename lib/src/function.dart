part of dartx;

typedef Function0<R> = R Function();
typedef Function1<A, R> = R Function(A a);
typedef Function2<A, B, R> = R Function(A a, B b);
typedef Function3<A, B, C, R> = R Function(A a, B b, C c);
typedef Function4<A, B, C, D, R> = R Function(A a, B b, C c, D d);

extension Function0X<R> on Function0<R> {
  /// Invokes this function and returns it's return value.
  @Deprecated('Use `call()`')
  R invoke() => this();
}

extension Function1X<A, R> on Function1<A, R> {
  /// Invokes this function and returns it's return value.
  R invoke(A first) => this(first);

  Function0<R> partial(A first) => () => this(first);
}

extension Function2X<A, B, R> on Function2<A, B, R> {
  /// Invokes this function and returns it's return value.
  R invoke(A first, B second) => this(first, second);

  Function1<A, Function1<B, R>> curry() =>
      (A first) => (B second) => this(first, second);

  Function1<B, R> partial(A first) => (B second) => this(first, second);

  Function0<R> partial2(A first, B second) => () => this(first, second);

  Function2<B, A, R> flip() => (B second, A first) => this(first, second);
}

extension Curry2X<A, B, R> on Function1<A, Function1<B, R>> {
  Function2<A, B, R> uncurry() => (A first, B second) => this(first)(second);
}

extension Function3X<R, A, B, C> on Function3<A, B, C, R> {
  /// Invokes this function and returns it's return value.
  R invoke(A first, B second, C third) => this(first, second, third);

  Function1<A, Function1<B, Function1<C, R>>> curry() =>
      (A first) => (B second) => (C third) => this(first, second, third);

  Function2<B, C, R> partial(A first) =>
      (B second, C third) => this(first, second, third);

  Function1<C, R> partial2(A first, B second) =>
      (C third) => this(first, second, third);

  Function0<R> partial3(A first, B second, C third) =>
      () => this(first, second, third);
}

extension Curry3X<A, B, C, R> on Function1<A, Function1<B, Function1<C, R>>> {
  Function3<A, B, C, R> uncurry() =>
      (A first, B second, C third) => this(first)(second)(third);
}

extension Function4X<R, A, B, C, D> on Function4<A, B, C, D, R> {
  /// Invokes this function and returns it's return value.
  R invoke(A first, B second, C third, D fourth) =>
      this(first, second, third, fourth);

  Function1<A, Function1<B, Function1<C, Function1<D, R>>>> curry() =>
      (A first) => (B second) =>
          (C third) => (D fourth) => this(first, second, third, fourth);

  Function3<B, C, D, R> partial(A first) =>
      (B second, C third, D fourth) => this(first, second, third, fourth);

  Function2<C, D, R> partial2(A first, B second) =>
      (C third, D fourth) => this(first, second, third, fourth);

  Function1<D, R> partial3(A first, B second, C third) =>
      (D fourth) => this(first, second, third, fourth);

  Function0<R> partial4(A first, B second, C third, D fourth) =>
      () => this(first, second, third, fourth);
}

extension Curry4X<A, B, C, D, R>
    on Function1<A, Function1<B, Function1<C, Function1<D, R>>>> {
  Function4<A, B, C, D, R> uncurry() =>
      (A first, B second, C third, D fourth) =>
          this(first)(second)(third)(fourth);
}
