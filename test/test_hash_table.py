import hash_table
import nose

HashTable = hash_table.HashTable


def test_hash_table_101():
    h = HashTable()
    nose.tools.assert_is_instance(h, hash_table.HashTable)


def test_hash_table_num_entries():
    h = HashTable()
    nose.tools.assert_equal(h.num_entries(), 0)


def test_hash_table_add():
    h = HashTable()
    h.add("apolo", "apoldfg")
    h.add("paolo", "prova2")
    nose.tools.assert_equal(h.num_entries(), 2)


def test_hash_table_has_next():
    h = HashTable()
    h.add("apolo", "apoldfg")
    h.add("paolo", "prova2")
    nose.tools.assert_true(h.hash_next())


# fixme: the remove doesn't work
# def test_hash_table_remove():
#     h = HashTable()
#     h.add("apolo", 254)
#     h.add("Paolo", 2)
#     h.remove("Paolo")
#     nose.tools.assert_equal(h.num_entries(), 0)
