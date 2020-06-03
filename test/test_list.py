import nose
import linked_list

List = linked_list.List


def test_list_101():
    l = List(12,"int")
    nose.tools.assert_is_instance(l, List)


def test_list_prepend():
    l = List(12, "int")
    l.prepend(1)
    nose.tools.assert_equal(l.length(), 2)
    nose.tools.assert_equal(l.get_head(), 1)


def test_list_append():
    l = List(34,"int")
    int_list = [12, 45, 67, 89, 100]

    for el in int_list:
        l.append(el)

    nose.tools.assert_equal(l.length(), 6)
    nose.tools.assert_equal(l.get_head(), 34)


def test_list_extend():
    l = List(12, "int")
    l.extend([13, 45, 67, 78])

    nose.tools.assert_equal(l.length(), 5)
    nose.tools.assert_equal(l.get_head(), 12)


def test_list_get_nth_data():
    l = List(89, "int")
    int_list = [13, 45, 67, 78]
    l.extend(int_list)

    nose.tools.assert_equal(l.get_nth_data(0), 89)
    for i in range(len(int_list)):
        nose.tools.assert_equal(l.get_nth_data(i+1), int_list[i])

    nose.tools.assert_equal(l.get_nth_data(100), float('-inf'))