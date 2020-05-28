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