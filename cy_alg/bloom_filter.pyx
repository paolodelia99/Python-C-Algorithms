# cython: c_string_type=unicode, c_string_encoding=utf8

cimport cbloom_filter
cimport chash_string
cimport chash_int
from libc.stdlib cimport malloc, free
from cpython.string cimport PyString_AsString

cdef class BloomFilter:
    """
    A class representin the BloomFilter
    """

    cdef cbloom_filter.BloomFilter* _c_bloom_filter
    cdef unsigned int table_size

    def __cinit__(self, unsigned int table_size, unsigned int num_functions, type="str"):
        """
        Bloom filter constructor

        @param table_size The size of the bloom filter.  The greater
                           the table size, the more elements can be
                           stored, and the lesser the chance of false
                           positives.
        @param num_functions: Number of hash functions to apply to each
                           element on insertion.  This running time for
                           insertion and queries is proportional to this
                           value.  The more functions applied, the lesser
                           the chance of false positives.  The maximum
                           number of functions is 64.

        @param type: the type of values that you wanna to store in the bloomfilter int or str
        """
        if type == "str":
            self._c_bloom_filter = cbloom_filter.bloom_filter_new(table_size, <void*>chash_string.string_hash, num_functions)
        elif type == "int":
            self._c_bloom_filter = cbloom_filter.bloom_filter_new(table_size, <void*>chash_int.int_hash, num_functions)
        else:
            self._c_bloom_filter = cbloom_filter.bloom_filter_new(table_size, <void*>chash_string.string_hash, num_functions) # by default the bloom filter hash strings

        self.table_size = table_size

        if self._c_bloom_filter is NULL:
            raise MemoryError()

    def __dealloc__(self):
        if self._c_bloom_filter is not NULL:
            cbloom_filter.bloom_filter_free(self._c_bloom_filter)

    cpdef insert(self, object value):
        """
        Insert a value into a bloom filter
        
        @param value: The value to insert
        """
        cbloom_filter.bloom_filter_insert(self._c_bloom_filter, <void*>value)

    cpdef query(self, object value):
        """
        Query a bloom filter for a particular value
        
        @param value: The value to look up
        @return False if the value was definitely not inserted into the filter. True
                indicates that it either may or may not have been inserted.
        """
        if not cbloom_filter.bloom_filter_query(self._c_bloom_filter, <void*>value):
            return False
        else:
            return True

    # fixme: make it work
    # cpdef load(self):
    #     cdef unsigned char* array = <unsigned char*>malloc(self.table_size * sizeof(char*))
    #     cbloom_filter.bloom_filter_load(self._c_bloom_filter, array)
    #     list_str = array[:self.table_size].decode('UTF-8')
    #     return array

    cpdef concat(self, BloomFilter bloom_filter):
        # fixme: doesn't work
        self._c_bloom_filter = cbloom_filter.bloom_filter_union(self._c_bloom_filter, bloom_filter._c_bloom_filter)

    cpdef intersection(self, BloomFilter bloom_filter):
        # fixme: doesn't work
        self._c_bloom_filter = cbloom_filter.bloom_filter_intersection(self._c_bloom_filter, bloom_filter._c_bloom_filter)
