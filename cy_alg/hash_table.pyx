cimport chash_table
cimport chash_string
cimport chash_int
cimport ccompare_int
cimport ccompare_string
from libc.stdlib cimport malloc


cdef class HashTable:
    cdef chash_table.HashTable* _c_hash_table
    cdef chash_table.HashTableIterator* it

    def __cinit__(self, type="str"):
        """
        Hash table constructor

        @param type the of the hash table key int or str
        """
        if type == "str":
            self._c_hash_table = chash_table.hash_table_new(<void*>chash_string.string_hash,
                                                        <void*>ccompare_string.string_equal)
        elif type == "int":
            self._c_hash_table = chash_table.hash_table_new(<void*>chash_int.int_hash,
                                                        <void*>ccompare_int.int_equal)
        else:
            self._c_hash_table = chash_table.hash_table_new(<void*>chash_string.string_hash,
                                                        <void*>ccompare_string.string_equal)

        if self._c_hash_table is NULL:
            raise MemoryError()

        self.it = <chash_table.HashTableIterator*> malloc(sizeof(chash_table.HashTableIterator*))
        chash_table.hash_table_iterate(self._c_hash_table, self.it)

    def __dealloc__(self):
        if self._c_hash_table is not NULL:
            chash_table.hash_table_free(self._c_hash_table)

    cpdef add(self, object key, object value):
        if not chash_table.hash_table_insert(self._c_hash_table,
                                             <void*>key,
                                             <void*>value):
            raise MemoryError()

    cpdef unsigned int num_entries(self):
        cdef unsigned int entries = chash_table.hash_table_num_entries(self._c_hash_table)
        return entries

    cpdef object get(self, object key):
        # fixme: better implementation
        value = <object>chash_table.hash_table_lookup(self._c_hash_table, <void*>key)

        if value == 0:
            raise IndexError("Element not found")

        return value

    cpdef remove(self, object key):
        # fixme: remove doesn't work
        if not chash_table.hash_table_remove(self._c_hash_table, <void*> key):
            raise IndexError("Key is not present in the hash_table")

    cpdef object next(self):
        cdef void* value = chash_table.hash_table_iter_next(self.it)
        return <object>value

    cpdef hash_next(self):
        if not chash_table.hash_table_iter_has_more(self.it):
            return False
        else:
            return True
