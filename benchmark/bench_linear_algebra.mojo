from benchmark import Bench, Bencher, BenchId
from linear_algebra import add, sub



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



def main():
    var m = Bench()

    m.bench_function[bench_add[1_000_000]](BenchId("bench_add_1M"))
    m.bench_function[bench_add[9_999_999]](BenchId("bench_add_9M"))

    m.bench_function[bench_sub[1_000_000]](BenchId("bench_sub_1M"))
    m.bench_function[bench_sub[9_999_999]](BenchId("bench_add_9M"))

    m.dump_report()