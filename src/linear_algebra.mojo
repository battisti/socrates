fn add(v: List[Float64], w: List[Float64]) -> List[Float64]:
    var n = len(v)
    debug_assert(n == len(w))

    var result = List[Float64]()
    for i in range(n):
        result.append(v[i] + w[i])
    
    return result
    