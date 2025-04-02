fn fold[
    T: CollectionElement,
    R: CollectionElement,
](f: fn(R, T) -> R, acc: R, xs: List[T]) -> R:
    var result = acc
    for idx in range(len(xs)):
        result = f(result, xs[idx])

    return result


fn reduce[
    T: CollectionElement
](f: fn(T, T) -> T, xs: List[T]) -> T:
    debug_assert(len(xs) >= 2)

    return fold(f, xs[0], xs[1:])