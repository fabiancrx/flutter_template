import 'package:dartz/dartz.dart';

abstract class Result<L, R> implements TraversableMonadOps<Result<L, dynamic>, R> {
  const Result();

  B fold<B>(B ifOk(L ok), B ifErr(R err));

  Result<L, R> orElse(Result<L, R> other()) => fold((_) => other(), (_) => this);

  R getOrElse(R dflt()) => fold((_) => dflt(), id);

  R operator |(R dflt) => getOrElse(() => dflt);

  Result<L2, R> okMap<L2>(L2 f(L l)) => fold((L l) => ok(f(l)), err);

  Option<R> get asOption => fold((_) => none(), some);

  bool get isOk => fold((_) => true, (_) => false);

  bool get isErr => fold((_) => false, (_) => true);

  Result<R, L> swap() => fold(err, ok);

  @override
  Result<L, R2> map<R2>(R2 f(R r)) => fold(ok, (R r) => err(f(r)));

  @override
  Result<L, R2> bind<R2>(Function1<R, Result<L, R2>> f) => fold(ok, f);

  @override
  Result<L, R2> flatMap<R2>(Function1<R, Result<L, R2>> f) => fold(ok, f);

  @override
  Result<L, R2> andThen<R2>(Result<L, R2> next) => fold(ok, (_) => next);

  IList<Result<L, R2>> traverseIList<R2>(IList<R2> f(R r)) => fold((l) => cons(ok(l), nil()), (R r) => f(r).map(err));

  IVector<Result<L, R2>> traverseIVector<R2>(IVector<R2> f(R r)) =>
      fold((l) => emptyVector<Result<L, R2>>().appendElement(ok(l)), (R r) => f(r).map(err));

  Future<Result<L, R2>> traverseFuture<R2>(Future<R2> f(R r)) =>
      fold((l) => new Future.microtask(() => ok(l)), (R r) => f(r).then(err));

  State<S, Result<L, R2>> traverseState<S, R2>(State<S, R2> f(R r)) =>
      fold((l) => new State((s) => tuple2(ok(l), s)), (r) => f(r).map(err));

  static IList<Result<L, R>> sequenceIList<L, R>(Result<L, IList<R>> elr) => elr.traverseIList(id);

  static IVector<Result<L, R>> sequenceIVector<L, R>(Result<L, IVector<R>> evr) => evr.traverseIVector(id);

  static Future<Result<L, R>> sequenceFuture<L, R>(Result<L, Future<R>> efr) => efr.traverseFuture(id);

  static State<S, Result<L, R>> sequenceState<S, L, R>(Result<L, State<S, R>> esr) => esr.traverseState(id);

  Result<L, R> filter(bool predicate(R r), L fallback()) =>
      fold((_) => this, (r) => predicate(r) ? this : ok(fallback()));

  Result<L, R> where(bool predicate(R r), L fallback()) => filter(predicate, fallback);

  static Result<L, C> map2<L, A, A2 extends A, B, B2 extends B, C>(
          Result<L, A2> fa, Result<L, B2> fb, C fun(A a, B b)) =>
      fa.fold(ok, (a) => fb.fold(ok, (b) => err(fun(a, b))));

  static Result<L, D> map3<L, A, A2 extends A, B, B2 extends B, C, C2 extends C, D>(
          Result<L, A2> fa, Result<L, B2> fb, Result<L, C2> fc, D fun(A a, B b, C c)) =>
      fa.fold(ok, (a) => fb.fold(ok, (b) => fc.fold(ok, (c) => err(fun(a, b, c)))));

  static Result<L, E> map4<L, A, A2 extends A, B, B2 extends B, C, C2 extends C, D, D2 extends D, E>(
          Result<L, A2> fa, Result<L, B2> fb, Result<L, C2> fc, Result<L, D2> fd, E fun(A a, B b, C c, D d)) =>
      fa.fold(ok, (a) => fb.fold(ok, (b) => fc.fold(ok, (c) => fd.fold(ok, (d) => err(fun(a, b, c, d))))));

  static Result<L, F> map5<L, A, A2 extends A, B, B2 extends B, C, C2 extends C, D, D2 extends D, E, E2 extends E, F>(
          Result<L, A2> fa,
          Result<L, B2> fb,
          Result<L, C2> fc,
          Result<L, D2> fd,
          Result<L, E2> fe,
          F fun(A a, B b, C c, D d, E e)) =>
      fa.fold(
          ok,
          (a) =>
              fb.fold(ok, (b) => fc.fold(ok, (c) => fd.fold(ok, (d) => fe.fold(ok, (e) => err(fun(a, b, c, d, e)))))));

  static Result<L, G>
      map6<L, A, A2 extends A, B, B2 extends B, C, C2 extends C, D, D2 extends D, E, E2 extends E, F, F2 extends F, G>(
              Result<L, A2> fa,
              Result<L, B2> fb,
              Result<L, C2> fc,
              Result<L, D2> fd,
              Result<L, E2> fe,
              Result<L, F2> ff,
              G fun(A a, B b, C c, D d, E e, F f)) =>
          fa.fold(
              ok,
              (a) => fb.fold(
                  ok,
                  (b) => fc.fold(ok,
                      (c) => fd.fold(ok, (d) => fe.fold(ok, (e) => ff.fold(ok, (f) => err(fun(a, b, c, d, e, f))))))));

  static Result<L, C> mapM2<L, A, A2 extends A, B, B2 extends B, C>(
          Result<L, A2> fa, Result<L, B2> fb, Result<L, C> f(A a, B b)) =>
      fa.bind((a) => fb.bind((b) => f(a, b)));

  static Function1<Result<L, A>, Result<L, B>> lift<L, A, B>(B f(A a)) => ((Result<L, A> oa) => oa.map(f));

  static Function2<Result<L, A>, Result<L, B>, Result<L, C>> lift2<L, A, B, C>(C f(A a, B b)) =>
      (Result<L, A> fa, Result<L, B> fb) => map2(fa, fb, f);

  static Function3<Result<L, A>, Result<L, B>, Result<L, C>, Result<L, D>> lift3<L, A, B, C, D>(D f(A a, B b, C c)) =>
      (Result<L, A> fa, Result<L, B> fb, Result<L, C> fc) => map3(fa, fb, fc, f);

  static Function4<Result<L, A>, Result<L, B>, Result<L, C>, Result<L, D>, Result<L, E>> lift4<L, A, B, C, D, E>(
          E f(A a, B b, C c, D d)) =>
      (Result<L, A> fa, Result<L, B> fb, Result<L, C> fc, Result<L, D> fd) => map4(fa, fb, fc, fd, f);

  static Function5<Result<L, A>, Result<L, B>, Result<L, C>, Result<L, D>, Result<L, E>, Result<L, F>>
      lift5<L, A, B, C, D, E, F>(F f(A a, B b, C c, D d, E e)) =>
          (Result<L, A> fa, Result<L, B> fb, Result<L, C> fc, Result<L, D> fd, Result<L, E> fe) =>
              map5(fa, fb, fc, fd, fe, f);

  static Function6<Result<L, A>, Result<L, B>, Result<L, C>, Result<L, D>, Result<L, E>, Result<L, F>, Result<L, G>>
      lift6<L, A, B, C, D, E, F, G>(G f(A a, B b, C c, D d, E e, F f)) =>
          (Result<L, A> fa, Result<L, B> fb, Result<L, C> fc, Result<L, D> fd, Result<L, E> fe, Result<L, F> ff) =>
              map6(fa, fb, fc, fd, fe, ff, f);

  @override
  String toString() => fold((l) => 'Ok($l)', (r) => 'Err($r)');

  @override
  B foldMap<B>(Monoid<B> bMonoid, B f(R r)) => fold((_) => bMonoid.zero(), f);

  @override
  Result<L, B> mapWithIndex<B>(B f(int i, R r)) => map((r) => f(0, r));

  @override
  Result<L, Tuple2<int, R>> zipWithIndex() => map((r) => tuple2(0, r));

  @override
  bool all(bool f(R r)) => map(f) | true;

  @override
  bool every(bool f(R r)) => all(f);

  @override
  bool any(bool f(R r)) => map(f) | false;

  @override
  R concatenate(Monoid<R> mi) => getOrElse(mi.zero);

  @override
  Option<R> concatenateO(Semigroup<R> si) => asOption;

  @override
  B foldLeft<B>(B z, B f(B previous, R r)) => fold((_) => z, (a) => f(z, a));

  @override
  B foldLeftWithIndex<B>(B z, B f(B previous, int i, R r)) => fold((_) => z, (a) => f(z, 0, a));

  @override
  Option<B> foldMapO<B>(Semigroup<B> si, B f(R r)) => map(f).asOption;

  @override
  B foldRight<B>(B z, B f(R r, B previous)) => fold((_) => z, (a) => f(a, z));

  @override
  B foldRightWithIndex<B>(B z, B f(int i, R r, B previous)) => fold((_) => z, (a) => f(0, a, z));

  @override
  R intercalate(Monoid<R> mi, R r) => fold((_) => mi.zero(), id);

  @override
  int length() => fold((_) => 0, (_) => 1);

  @override
  Option<R> maximum(Order<R> or) => asOption;

  @override
  Option<R> minimum(Order<R> or) => asOption;

  @override
  Result<L, B> replace<B>(B replacement) => map((_) => replacement);

  Result<L, R> reverse() => this;

  @override
  Result<L, Tuple2<B, R>> strengthL<B>(B b) => map((a) => tuple2(b, a));

  @override
  Result<L, Tuple2<R, B>> strengthR<B>(B b) => map((a) => tuple2(a, b));

  @override
  Result<L, B> ap<B>(Result<L, Function1<R, B>> ff) => ff.bind((f) => map(f));

  // PURISTS BEWARE: side effecty stuff below -- proceed with caution!

//  Iterable<R> toIterable() => fold((_) => const Iterable.empty(), (r) =>  _SingletonIterable(r));
//  Iterator<R> iterator() => toIterable().iterator;

  void forEach(void sideEffect(R r)) => fold((_) => null, sideEffect);
}

class Ok<L, R> extends Result<L, R> {
  final L _ok;

  const Ok(this._ok);

  L get value => _ok;

  @override
  B fold<B>(B ifOk(L l), B ifErr(R r)) => ifOk(_ok);

  @override
  bool operator ==(other) => other is Ok && other._ok == _ok;

  @override
  int get hashCode => _ok.hashCode;
}

class Err<L, R> extends Result<L, R> {
  final R _err;

  const Err(this._err);

  R get value => _err;

  @override
  B fold<B>(B ifOk(L l), B ifErr(R r)) => ifErr(_err);

  @override
  bool operator ==(other) => other is Err && other._err == _err;

  @override
  int get hashCode => _err.hashCode;
}

Result<L, R> ok<L, R>(L l) => Ok(l);

Result<L, R> err<L, R>(R r) => Err(r);
