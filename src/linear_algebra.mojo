from alogrithms import reduce

trait Addable(CollectionElement):
    fn __add__(self, rhs: Self) -> Self:
        ...

trait Subable(CollectionElement):
    fn __sub__(self, rhs: Self) -> Self:
        ...

trait Mulable(CollectionElement):
    fn __mul__(self, rhs: Self) -> Self:
        ...

trait Numeric(Addable, Subable, Defaultable, Mulable):
    ...


fn add[T: Addable](v: List[T], w: List[T]) -> List[T]:
    var n = len(v)
    debug_assert(n == len(w))

    var result = List[T](capacity=n)
    for i in range(n):
        result.append(v[i] + w[i])
    
    return result


fn add[T: Numeric](vs: List[List[T]]) -> List[T]:
    var n = len(vs[0])
    var v = len(vs)
 
    result = List[T](capacity=v)
    for i in range(n):
        # TODO: remove use of Defaultable
        s = T() 
        for j in range(v):
            s = s + vs[j][i]
        result.append(s)
 
    return result


fn add_reduce[T: Numeric](vs: List[List[T]]) -> List[T]:
   return reduce[List[T]](add[T], vs) 


fn sub[T: Subable](v: List[T], w: List[T]) -> List[T]:
    var n = len(v)
    debug_assert(n == len(w))

    var result = List[T](capacity=n)
    for i in range(n):
        result.append(v[i] - w[i])

    return result


fn mul[T: Numeric](v: List[T], w: List[T]) -> T:
    var n = len(v)
    debug_assert(n == len(w))

    # TODO: remove use of Defaultable 
    var result = T()
    for i in range(n):
        result = result + (v[i] * w[i])

    return result
        

fn sum_of_squares[T: Numeric](v: List[T]) -> T:
    return mul(v, v)