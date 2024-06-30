extension FunctionX<T> on T {
  R let<R>(R Function(T value) fn) {
    return fn(this);
  }

  T also(void Function(T value) fn) {
    fn(this);
    return this;
  }

  T? takeIf(bool Function(T value) fn) {
    return fn(this) ? this : null;
  }
}
