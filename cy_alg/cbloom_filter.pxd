cdef extern from "bloom-filter.h":

    ctypedef struct BloomFilter:
        pass

    ctypedef void* BloomFilterValue
    ctypedef void* BloomFilterHashFunc

    BloomFilter* bloom_filter_new(unsigned int table_size,
                                  BloomFilterHashFunc hash_func,
                                  unsigned int num_functions)

    void bloom_filter_free(BloomFilter *bloom_filter)

    void bloom_filter_insert(BloomFilter *bloom_filter, BloomFilterValue value)

    int bloom_filter_query(BloomFilter *bloom_filter, BloomFilterValue value)

    void bloom_filter_read(BloomFilter *bloom_filter, unsigned char *array)

    void bloom_filter_load(BloomFilter *bloom_filter, unsigned char *array)

    BloomFilter* bloom_filter_union(BloomFilter *filter1, BloomFilter *filter2)

    BloomFilter* bloom_filter_intersection(BloomFilter *filter1, BloomFilter *filter2)