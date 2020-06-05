import nose
import binary_heap

BinaryHeap = binary_heap.BinaryHeap


def test_binary_heap_101():
    b = BinaryHeap()
    nose.tools.assert_is_instance(b, BinaryHeap)


def test_binary_heap_num_entries():
    b = BinaryHeap()
    nose.tools.assert_equal(b.num_entries(), 0)


def test_binary_heap_insert():
    b = BinaryHeap()
    b.insert("Paolo")
    b.insert("CIao")
    nose.tools.assert_equal(b.num_entries(), 2)


def test_binary_heap_pop():
    b = BinaryHeap()
    b.insert("Paolo")
    b.insert("CIao")
    max_el = b.pop()
    nose.tools.assert_equal(b.num_entries(), 1)
    nose.tools.assert_equal(max_el, "CIao")

