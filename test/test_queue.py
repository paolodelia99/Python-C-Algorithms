import nose
import queue

Queue = queue.Queue

def test_queue_01():
    q = Queue()
    nose.tools.assert_is_instance(q, queue.Queue)


def test_queue_peek():
    q = Queue()
    q.append(10)
    nose.tools.assert_equal(q.peek(), 10)


def test_queue_pop():
    q = Queue()
    q.append(10)
    q.append(20)
    first = q.pop()
    second = q.pop()
    nose.tools.assert_equal(first, 10)
    nose.tools.assert_equal(second, 20)

def test_queue_extends():
    q = Queue()
    a = [10, 20, 15, 16]
    q.extend(a)
    for i in a:
        nose.tools.assert_equal(i, q.pop())