import arraylist
import nose

ArrayList = arraylist.ArrayList


def test_arraylist_101():
    a = ArrayList(2)
    nose.tools.assert_is_instance(a, ArrayList)


def test_arraylist_index_of():
    a = ArrayList(10)
    a.append(25)
    nose.tools.assert_equal(a.index_of(25), 0)


def test_arraylist_prepend():
    a = ArrayList(10)
    a.append(25)
    a.prepend(14)
    a.append(34)
    nose.tools.assert_equal(a.index_of(14), 0)


def test_arraylist_remove():
    a = ArrayList(15)
    l = [12, 45, 67, 23, 42, 21, 90, 78]

    for el in l:
        a.append(el)

    a.remove(0)
    nose.tools.assert_equal(a.index_of(45), 0)

    a.remove(23)
    nose.tools.assert_equal(a.index_of(42), 3)


def test_arraylist_remove_range():
    a = ArrayList(15)
    l = [12, 45, 67, 23, 42, 21 ,56, 100, 23, 90, 78]

    for el in l:
        a.append(el)

    a.remove_range(2, 3)
    nose.tools.assert_equal(a.index_of(21), 2)
    nose.tools.assert_equal(a.index_of(12), 0)
    nose.tools.assert_equal(a.index_of(56), 3)


def test_arraylist_insert_at():
    a = ArrayList(12)
    l = [12, 45, 67, 23, 42, 21, 56, 100, 23, 90, 78]

    for el in l:
        a.append(el)

    a.insert_at(0, 11)
    nose.tools.assert_equal(a.index_of(11), 0)

    a.insert_at(2, 69)
    nose.tools.assert_equal(a.index_of(69), 2)


def test_arraylist_clear():
    a = ArrayList(12)
    l = [12, 45, 67, 23, 42, 21, 56, 100, 23, 90, 78]

    for el in l:
        a.append(el)

    a.clear()
    a.append(1)
    nose.tools.assert_equal(a.index_of(1), 0)


def test_arraylist_sort():
    a = ArrayList(12)
    l = [12, 45, 67, 23, 42, 21, 56, 100, 23, 90, 78]

    for el in l:
        a.append(el)

    a.sort()
    nose.tools.assert_equal(a.index_of(12), 10)
    nose.tools.assert_equal(a.index_of(21), 9)