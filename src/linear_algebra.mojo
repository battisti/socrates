trait Addable(CollectionElement):
    fn __add__(self, rhs: Self) -> Self:
        ...

trait Subable(CollectionElement):
    fn __sub__(self, rhs: Self) -> Self:
        ...



fn add[T: Addable](v: List[T], w: List[T]) -> List[T]:
    var n = len(v)
    debug_assert(n == len(w))

    var result = List[T]()
    for i in range(n):
        result.append(v[i] + w[i])
    
    return result
    

fn sub[T: Subable](v: List[T], w: List[T]) -> List[T]:
    var n = len(v)
    debug_assert(n == len(w))

    var result = List[T]()
    for i in range(n):
        result.append(v[i] - w[i])

    return result