cimport cset
cimport chash_string
cimport chash_compare_string

cdef class Set:
    """
    A class representing a Set data structure
    """
    cdef cset.Set* _c_set
    def __cinit__(self):
        self._c_set = cset.set_new(<void*>chash_string.string_hash,
                                                        <void*>chash_compare_string.string_equal)

        if self._c_set is NULL:
            raise MemoryError()

    def __dealloc__(self):
        if self._c_set is not NULL:
            cset.set_free(self._c_set)

    cpdef insert(self, object value):
        if not cset.set_insert(self._c_set, <void*> value):
            raise MemoryError()

    cpdef remove(self, object value):
        if not cset.set_remove(self._c_set, <void*> value):
            raise IndexError("The value is not present in the set")

    cpdef query(self, object value):
        if not cset.set_query(self._c_set, <void*> value):
            return False
        else:
            return True

    cpdef num_entries(self):
        cdef entries = cset.set_num_entries(self._c_set)
        return entries