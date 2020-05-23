cdef extern from "hash-table.h":
    ctypedef struct HashTable:
        pass
    ctypedef struct HashTableIterator:
        pass
    ctypedef struct HashTableEntry:
        pass
    ctypedef struct HashTablePair:
        pass
    ctypedef void* HashTableKey
    ctypedef void* HashTableValue
    ctypedef void* HashTableHashFunc
    ctypedef void* HashTableEqualFunc
    ctypedef void* HashTableKeyFreeFunc
    ctypedef void* HashTableValueFreeFunc

    HashTable* hash_table_new(HashTableHashFunc hash_func,
                              HashTableEqualFunc equal_func)

    void hash_table_free(HashTable *hash_table)
    void hash_table_register_free_functions(HashTable *hash_table,
                                        HashTableKeyFreeFunc key_free_func,
                                        HashTableValueFreeFunc value_free_func)
    int hash_table_insert(HashTable *hash_table,
                      HashTableKey key,
                      HashTableValue value)
    HashTableValue hash_table_lookup(HashTable *hash_table,
                                 HashTableKey key)
    int hash_table_remove(HashTable *hash_table, HashTableKey key)
    unsigned int hash_table_num_entries(HashTable *hash_table)
    void hash_table_iterate(HashTable *hash_table, HashTableIterator *iter)
    int hash_table_iter_has_more(HashTableIterator *iterator)
    HashTablePair hash_table_iter_next(HashTableIterator *iterator);