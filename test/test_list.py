import linked_list
import nose

List = linked_list.List()


def test_list_101():
    l = List(type=str)
    nose.tools.assert_is_instance(l, List)


# def test_list_prepend():
#     l = List(12)