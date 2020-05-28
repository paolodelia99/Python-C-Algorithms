import set
import nose

Set = set.Set


def test_hash_table_101():
    s = Set()
    nose.tools.assert_is_instance(s, set.Set)


def test_set_num_entries():
    s = Set()
    nose.tools.assert_equal(s.num_entries(), 0)


def test_set_insert():
    s = Set()
    s.insert("apolo")
    s.insert("paolo")
    nose.tools.assert_equal(s.num_entries(), 2)


def test_set_query():
    s = Set()
    s.insert("polo")
    s.insert("wabba")
    nose.tools.assert_true(s.query("polo"))
    nose.tools.assert_true(s.query("wabba"))
    nose.tools.assert_false(s.query("apolo"))


def test_set_remove_101():
    s = Set()
    s.insert("polo")
    s.insert("wabba")
    s.remove("polo")
    nose.tools.assert_equal(s.num_entries(), 1)
    nose.tools.assert_true(s.query("wabba"))


def test_set_remove_102():
    set = Set()
    str_list = ["ciao", "sono", "Paolo", "e", "sono", "bello"]

    for s in str_list:
        set.insert(s)

    nose.tools.assert_equal(set.num_entries(), 5)

    for s in str_list:
        if s != "sono":
            set.remove(s)

    nose.tools.assert_equal(set.num_entries(), 1)

# fixme redo it
# def test_set_iterator():
#     set = Set()
#     str_list = ["ciao", "sono", "Paolo", "e", "sono", "bello"]
#
#     for s in str_list:
#         set.insert(s)
#
#     nose.tools.assert_false(set.hash_next())
