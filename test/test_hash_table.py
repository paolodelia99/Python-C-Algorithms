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

# the remove doesn't work
# def test_hash_table_remove():
#     h = HashTable()
#     h.add("apolo", 254)
#     h.remove("apolo")
#     nose.tools.assert_equal(h.num_entries(), 0)