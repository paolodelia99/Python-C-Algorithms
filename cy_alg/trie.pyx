cimport ctrie

cdef class Trie:
    """A python class represent the trie data structure"""

    cdef ctrie.Trie* _c_trie
    def __cinit__(self):
        self._c_trie = ctrie.trie_new()
        if self._c_trie is NULL:
            raise MemoryError()

    def __dealloc__(self):
        if self._c_trie is not NULL:
            ctrie.trie_free(self._c_trie)

    cdef char* get_c_string(self, str string):
        """
        Returns the C string of the given python string
        
        @param string the python string to transform in a c string
        @return the C string of the given python string
        """
        byte_string = string.encode('UTF_8')
        cdef char* c_string = byte_string
        return c_string

    cpdef append(self,str key,int value):

        cdef char* c_key = self.get_c_string(key)

        if not ctrie.trie_insert(self._c_trie, c_key, <void*><Py_ssize_t> value):
            raise MemoryError()

    def remove(self,str key):
        cdef char* c_key = self.get_c_string(key)

        if not ctrie.trie_remove(self._c_trie, c_key):
            raise IndexError("Key is not present in the trie")

    cpdef int lookup(self, str key) except? -1:

        cdef char* c_key = self.get_c_string(key)

        cdef int value = <Py_ssize_t> ctrie.trie_lookup(self._c_trie, c_key)

        if value == 0:

            if ctrie.trie_num_entries(self._c_trie) == 0:
                raise IndexError("Trie is empty")
        return value

    cpdef int num_entries(self):
        cdef int num =  ctrie.trie_num_entries(self._c_trie)
        return num
