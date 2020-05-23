import hash_table
import nose

HashTable = hash_table.HashTable

def test_hash_table_101():
    h = HashTable()
    nose.tools.assert_is_instance(h, hash_table.HashTable)