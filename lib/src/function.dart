typedef Function0<R> = R Function();
typedef Function1<A, R> = R Function(A a);
typedef Function2<A, B, R> = R Function(A a, B b);
typedef Function3<A, B, C, R> = R Function(A a, B b, C c);
typedef Function4<A, B, C, D, R> = R Function(A a, B b, C c, D d);

extension Function1InvokeExtensions<A, R> on Function1<A, R> {
  /// Invokes this function and returns it's return value.
  R invoke(A first) => this(first);
}

extension Function1PartialExtensions<A, R> on Function1<A, R> {
  Function0<R> partial(A first) => () => this(first);
}

extension Function2InvokeExtension<A, B, R> on Function2<A, B, R> {
  /// Invokes this function and returns it's return value.
  R invoke(A first, B second) => this(first, second);
}

extension Function2PartialExtension<A, B, R> on Function2<A, B, R> {
  Function1<B, R> partial(A first) => (B second) => this(first, second);
}

extension Function2Partial2Extension<A, B, R> on Function2<A, B, R> {
  Function0<R> partial2(A first, B second) => () => this(first, second);
}

extension Function2FlipExtension<A, B, R> on Function2<A, B, R> {
  Function2<B, A, R> flip() => (B second, A first) => this(first, second);
}

extension Function2CurryExtension<A, B, R> on Function2<A, B, R> {
  Function1<A, Function1<B, R>> curry() =>
      (A first) => (B second) => this(first, second);
}

extension Function2UncurryExtension<A, B, R> on Function1<A, Function1<B, R>> {
  Function2<A, B, R> uncurry() => (A first, B second) => this(first)(second);
}

extension Function3InvokeExtension<R, A, B, C> on Function3<A, B, C, R> {
  /// Invokes this function and returns it's return value.
  R invoke(A first, B second, C third) => this(first, second, third);
}

extension Function3CurryExtension<R, A, B, C> on Function3<A, B, C, R> {
  Function1<A, Function1<B, Function1<C, R>>> curry() =>
      (A first) => (B second) => (C third) => this(first, second, third);
}

extension Function3PartialExtension<R, A, B, C> on Function3<A, B, C, R> {
  Function2<B, C, R> partial(A first) =>
      (B second, C third) => this(first, second, third);
}

extension Function3Partial2Extension<R, A, B, C> on Function3<A, B, C, R> {
  Function1<C, R> partial2(A first, B second) =>
      (C third) => this(first, second, third);
}

extension Function3Partial3Extension<R, A, B, C> on Function3<A, B, C, R> {
  Function0<R> partial3(A first, B second, C third) =>
      () => this(first, second, third);
}

extension Function3UncurryExtension<A, B, C, R>
    on Function1<A, Function1<B, Function1<C, R>>> {
  Function3<A, B, C, R> uncurry() =>
      (A first, B second, C third) => this(first)(second)(third);
}

extension Function4InvokeExtension<R, A, B, C, D> on Function4<A, B, C, D, R> {
  /// Invokes this function and returns it's return value.
  R invoke(A first, B second, C third, D fourth) =>
      this(first, second, third, fourth);
}

extension Function4CurryExtension<R, A, B, C, D> on Function4<A, B, C, D, R> {
  Function1<A, Function1<B, Function1<C, Function1<D, R>>>> curry() =>
      (A first) => (B second) =>
          (C third) => (D fourth) => this(first, second, third, fourth);
}

extension Function4PartialExtension<R, A, B, C, D> on Function4<A, B, C, D, R> {
  Function3<B, C, D, R> partial(A first) =>
      (B second, C third, D fourth) => this(first, second, third, fourth);
}

extension Function4Partial2Extension<R, A, B, C, D>
    on Function4<A, B, C, D, R> {
  Function2<C, D, R> partial2(A first, B second) =>
      (C third, D fourth) => this(first, second, third, fourth);
}

extension Function4Partial3Extension<R, A, B, C, D>
    on Function4<A, B, C, D, R> {
  Function1<D, R> partial3(A first, B second, C third) =>
      (D fourth) => this(first, second, third, fourth);
}

extension Function4Partial4Extension<R, A, B, C, D>
    on Function4<A, B, C, D, R> {
  Function0<R> partial4(A first, B second, C third, D fourth) =>
      () => this(first, second, third, fourth);
}

extension Function4UncurryExtension<A, B, C, D, R>
    on Function1<A, Function1<B, Function1<C, Function1<D, R>>>> {
  Function4<A, B, C, D, R> uncurry() =>
      (A first, B second, C third, D fourth) =>
          this(first)(second)(third)(fourth);
}
