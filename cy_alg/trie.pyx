cimport ctrie

cdef class Trie:
    """
    A python class represent the trie data structure
    """

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
        """
         Insert a new key-value pair into a trie.  The key is a NUL-terminated string.  For binary strings, use @ref trie_insert_binary.
        
        @param key: The key to access the new value
        @param value: The value
        @throw MemoryError if the the value isn't inserted
        """
        cdef char* c_key = self.get_c_string(key)

        if not ctrie.trie_insert(self._c_trie, c_key, <void*><Py_ssize_t> value):
            raise MemoryError()

    def remove(self,str key):
        """
        Remove the element of the trie that has the key

        @param key the key to remove
        """
        cdef char* c_key = self.get_c_string(key)

        if not ctrie.trie_remove(self._c_trie, c_key):
            raise IndexError("Key is not present in the trie")

    cpdef int lookup(self, str key) except? -1:
        """
        Look up a value from its key in a trie
        
        @param key: The key
        @return The value associated with the key, or @ref TRIE_NULL if not found in the trie.
        """
        cdef char* c_key = self.get_c_string(key)

        cdef int value = <Py_ssize_t> ctrie.trie_lookup(self._c_trie, c_key)

        if value == 0:

            if ctrie.trie_num_entries(self._c_trie) == 0:
                raise IndexError("Trie is empty")
        return value

    cpdef int num_entries(self):
        """
        @return the number of entries of the trie
        """
        cdef int num =  ctrie.trie_num_entries(self._c_trie)
        return num
