from benchmark import Bench, Bencher, BenchId
from linear_algebra import add, sub, add_reduce



@parameter
fn bench_add[n: Int](mut b: Bencher) raises:
    var xs = List[Float64](capacity=n)
    var ys = List[Float64](capacity=n)
    for i in range(n):
        xs.append(i)
        ys.append(i)

    var zs = List[Float64]()

    @always_inline
    @parameter
    fn call_fn() raises:
        zs = add(xs, ys)
    
    b.iter[call_fn]()
    _ = zs


@parameter
fn bench_sub[n: Int](mut b: Bencher) raises:
    var xs = List[Float64](capacity=n)
    var ys = List[Float64](capacity=n)
    for i in range(n):
        xs.append(i)
        ys.append(i)

    var zs = List[Float64]()

    @always_inline
    @parameter
    fn call_fn() raises:
        zs = sub(xs, ys)
    
    b.iter[call_fn]()
    _ = zs


@parameter
fn bench_add_multiple[n: Int](mut b: Bencher) raises:
    var xs = List[Float64](capacity=n)
    var ys = List[Float64](capacity=n)
    var zs = List[Float64](capacity=n)
    for i in range(n):
        xs.append(i)
        ys.append(i)
        zs.append(i)
 
    var rs = List[Float64]()
 
    @always_inline
    @parameter
    fn call_fn() raises:
        rs = add(List(xs, ys, zs))
    
    b.iter[call_fn]()
    _ = rs
 

@parameter
fn bench_add_reduce[n: Int](mut b: Bencher) raises:
    var xs = List[Float64](capacity=n)
    var ys = List[Float64](capacity=n)
    var zs = List[Float64](capacity=n)
    for i in range(n):
        xs.append(i)
        ys.append(i)
        zs.append(i)
 
    var rs = List[Float64]()
 
    @always_inline
    @parameter
    fn call_fn() raises:
        rs = add_reduce(List(xs, ys, zs))
    
    b.iter[call_fn]()
    _ = rs


def main():
    var m = Bench()

    m.bench_function[bench_add[10_000_000]](BenchId("bench_add_9M"))
    m.bench_function[bench_sub[10_000_000]](BenchId("bench_add_9M"))

    m.bench_function[bench_add_multiple[10_000_000]](BenchId("bench_add_multiple"))
    m.bench_function[bench_add_reduce[10_000_000]](BenchId("bench_add_reduce"))

    m.dump_report()