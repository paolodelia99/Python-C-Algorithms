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


# fixme has_next returns false
# def test_hash_table_has_next():
#     h = HashTable()
#     h.add("apolo", "apoldfg")
#     h.add("paolo", "prova2")
#     nose.tools.assert_true(h.hash_next())


def test_hash_table_get():
    h = HashTable()
    h.add("apolo", "apoldfg")
    h.add("paolo", "prova2")
    nose.tools.assert_equal(h.get("paolo"), "prova2")


# fixme: the remove doesn't work
def test_hash_table_remove():
    h = HashTable()
    h.add("apolo", 254)
    h.add("Paolo", 2)
    h.remove("Paolo")
    nose.tools.assert_equal(h.num_entries(), 1)


# Test hash table with int key
def test_hash_table_int_101():
    h = HashTable("int")
    nose.tools.assert_is_instance(h, hash_table.HashTable)


def test_hash_table_int_num_entries():
    h = HashTable("int")
    nose.tools.assert_equal(h.num_entries(), 0)


def test_hash_table_int_add():
    h = HashTable("int")
    h.add(12, 34)
    h.add(123, 98)
    h.add(90, 23)
    nose.tools.assert_equal(h.num_entries(), 3)


def test_hash_table_int_get():
    h = HashTable("int")
    h.add(12, 34)
    h.add(123, 98)
    h.add(90, 23)
    nose.tools.assert_equal(h.get(12), 34)