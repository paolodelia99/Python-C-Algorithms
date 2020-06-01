cimport cbloom_filter
cimport chash_string

cdef class BloomFilter:
    """
    A class representin the BloomFilter
    """

    cdef cbloom_filter.BloomFilter* _c_bloom_filter

    def __cinit__(self, unsigned int table_size, unsigned int num_functions):
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
        """
        self._c_bloom_filter = cbloom_filter.bloom_filter_new(table_size, <void*>chash_string.string_hash, num_functions)

        if self._c_bloom_filter is NULL:
            raise MemoryError()

    def __dealloc__(self):
        if self._c_bloom_filter is not NULL:
            cbloom_filter.bloom_filter_free(self._c_bloom_filter)

    cpdef insert(self, object value):
        cbloom_filter.bloom_filter_insert(self._c_bloom_filter, <void*>value)

    cpdef query(self, object value):
        if not cbloom_filter.bloom_filter_query(self._c_bloom_filter, <void*>value):
            return False
        else:
            return True

    cpdef concat(self, BloomFilter bloom_filter):
        self._c_bloom_filter = cbloom_filter.bloom_filter_union(self._c_bloom_filter, bloom_filter._c_bloom_filter)

    cpdef intersection(self, BloomFilter bloom_filter):
        self._c_bloom_filter = cbloom_filter.bloom_filter_intersection(self._c_bloom_filter, bloom_filter._c_bloom_filter)
