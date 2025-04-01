from linear_algebra import add
from testing import assert_equal


def test_add_zero():
    var xs = List(1, 2, 3, 4)
    var ys = List(0, 0, 0, 0)
    
    assert_equal(xs, add(xs, ys))
    

def test_simple_add():
    var xs = List(1, 2, 3)
    var ys = List(4, 5, 6)

    assert_equal(List(5, 7, 9), add(xs, ys))
