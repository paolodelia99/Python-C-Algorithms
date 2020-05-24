cimport chash_table
cimport chash_string
cimport chash_compare_string

cdef class HashTable:
    cdef chash_table.HashTable* _c_hash_table

    def __cinit__(self):
        self._c_hash_table = chash_table.hash_table_new(<void*>chash_string.string_hash,
                                                        <void*>chash_compare_string.string_equal)
        if self._c_hash_table is NULL:
            raise MemoryError()

    def __dealloc__(self):
        if self._c_hash_table is not NULL:
            chash_table.hash_table_free(self._c_hash_table)

    cpdef add(self, object key, object value):
        if not chash_table.hash_table_insert(self._c_hash_table,
                                             <void*>key,
                                             <void*>value):
            raise MemoryError()

    cpdef num_entries(self):
        cdef entries = chash_table.hash_table_num_entries(self._c_hash_table)
        return entries

    cpdef get(self, object key):
        # fixme: better implementation
        value = chash_table.hash_table_lookup(self._c_hash_table, <void*>key)
        return <str>value

    cpdef remove(self, object key):
        if not chash_table.hash_table_remove(self._c_hash_table, <void*>key):
            raise IndexError("Key is not present in the hash_table")
