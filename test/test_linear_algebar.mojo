from linear_algebra import add
from testing import assert_almost_equal


def test_add_zero():
    var xs = List[Float64](1, 2, 3, 4)
    var ys = List[Float64](0, 0, 0, 0)
    
    var zs = add(xs, ys)

    for i in range(len(zs)):
        assert_almost_equal(xs[i], zs[i])
    

def test_simple_add():
    var xs = List[Float64](1, 2, 3)
    var ys = List[Float64](4, 5, 6)

    var zs = add(xs, ys)

    assert_almost_equal(5, zs[0])
    assert_almost_equal(7, zs[1])
    assert_almost_equal(9, zs[2])