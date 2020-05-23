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

    cpdef append(self,char* key,int value):
        if not ctrie.trie_insert(self._c_trie, key, <void*><Py_ssize_t> value):
            raise MemoryError()

    def remove(self,char* key):
        if not ctrie.trie_remove(self._c_trie, key):
            raise IndexError("Key is not present in the trie")

    cpdef int lookup(self, char* key) except? -1:
        cdef int value = <Py_ssize_t> ctrie.trie_lookup(self._c_trie, key)

        if value == 0:

            if ctrie.trie_num_entries(self._c_trie) == 0:
                raise IndexError("Trie is empty")
        return value

    cpdef int num_entries(self):
        cdef int num =  ctrie.trie_num_entries(self._c_trie)
        return num
