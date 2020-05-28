cimport cset
cimport chash_string
cimport chash_compare_string
from libc.stdlib cimport malloc, free


cdef class Set:
    """
    A class representing a Set data structure
    """
    cdef cset.Set* _c_set
    cdef cset.SetIterator* it

    def __cinit__(self):
        """
        Set constructor
        """
        self._c_set = cset.set_new(<void*>chash_string.string_hash,
                                                        <void*>chash_compare_string.string_equal)

        if self._c_set is NULL:
            raise MemoryError()

        self.it = <cset.SetIterator*> malloc(sizeof(cset.SetIterator*))
        cset.set_iterate(self._c_set, self.it)


    def __dealloc__(self):
        if self._c_set is not NULL:
            cset.set_free(self._c_set)

    cpdef insert(self, object value):
        """
        Insert the given value in the set
        @param value the value to insert in the set
        """
        if not self.query(value):
            if not cset.set_insert(self._c_set, <void*> value):
                raise MemoryError()

    cpdef remove(self, object value):
        """
        Remove the give value in the set otherwise its throws an error
        @param value the value to remove
        """
        if not cset.set_remove(self._c_set, <void*> value):
            raise IndexError("The value is not present in the set")

    cpdef query(self, object value):
        """
        Check if the value is in the set
        
        @param value the value to check
        @return true if the value is in the set otherwise return false
        """
        if not cset.set_query(self._c_set, <void*> value):
            return False
        else:
            return True

    cpdef num_entries(self):
        """
        @return the number of entries of the set
        """
        cdef entries = cset.set_num_entries(self._c_set)
        return entries

    cpdef next(self):
        # fixme it doesn't work properly
        cdef void* value = cset.set_iter_next(self.it)
        return <object>value

    cpdef hash_next(self):
        # fixme it doesn't work properly
        if not cset.set_iter_has_more(self.it):
            return False
        else:
            return True

