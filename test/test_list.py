import nose
import linked_list

List = linked_list.List
int_list = [13, 45, 67, 78]

def create_sample_list():
    l = List(89,"int")
    l.extend(int_list)

    return l

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
    l = create_sample_list()

    nose.tools.assert_equal(l.get_nth_data(0), 89)
    for i in range(len(int_list)):
        nose.tools.assert_equal(l.get_nth_data(i+1), int_list[i])

    nose.tools.assert_equal(l.get_nth_data(100), float('-inf'))


def test_remove_data():
    l = create_sample_list()
    l.remove_data(13)

    nose.tools.assert_equal(l.length(), 4)

    new_list = [89, 45, 67, 78]

    for i in range(len(new_list)):
        nose.tools.assert_equal(l.get_nth_data(i), new_list[i])


def test_remove_data_exception():
    l = create_sample_list()
    try:
        l.remove_data(100)
    except IndexError as e:
        nose.tools.assert_is_instance(e, IndexError)


# def test_list_sort():
#     l = List(89, "int")
#     int_list = [13, 45, 67, 78]
#     l.extend(int_list)
#     l.sort()
#     l.sort()
#
#     nose.tools.assert_equal(l.get_nth_data(0), 89)
#     nose.tools.assert_equal(l.get_nth_data(1), 78)
#     nose.tools.assert_equal(l.get_nth_data(2), 45)
#     nose.tools.assert_equal(l.get_nth_data(3), 67)
#     nose.tools.assert_equal(l.get_nth_data(4), 13)
#
#     # sort_list = [89, 78, 67, 45, 13]
#     # for i, el in enumerate(sort_list):
#     #     nose.tools.assert_equal(l.get_nth_data(i), el)