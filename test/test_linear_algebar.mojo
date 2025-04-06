from linear_algebra import add, sub, add_reduce
from testing import assert_equal


def test_add_zero():
    var v = List(1, 2, 3, 4)
    var w = List(0, 0, 0, 0)
    
    assert_equal(v, add(v, w))
    

def test_simple_add():
    var v = List(1, 2, 3)
    var w = List(4, 5, 6)

    assert_equal(List(5, 7, 9), add(v, w))


def test_sub_zero():
    var v = List(1, 2, 3, 4)
    var w = List(0, 0, 0, 0)

    assert_equal(v, sub(v, w))


def test_simple_sub():
    var v = List(5, 7, 9)
    var w = List(4, 5, 6)

    assert_equal(List(1, 2, 3), sub(v, w))


def test_add_multiple():
    var xs = List(List(1, 2, 3), List(2, 3, 4), List(3, 4, 5), List(4, 5, 6))

    assert_equal(List(10, 14, 18), add(xs))
    assert_equal(List(10, 14, 18), add_reduce(xs))