cdef extern from "binary-heap.h":

    ctypedef enum BinaryHeapType:
        BINARY_HEAP_TYPE_MIN
        BINARY_HEAP_TYPE_MAX

    ctypedef struct BinaryHeap:
        pass

    ctypedef void* BinaryHeapValue
    ctypedef void* BinaryHeapCompareFunc

    BinaryHeap* binary_heap_new(BinaryHeapType heap_type, BinaryHeapCompareFunc compare_func)

    void binary_heap_free(BinaryHeap* heap)

    int binary_heap_insert(BinaryHeap* heap, BinaryHeapValue value)

    BinaryHeapValue binary_heap_pop(BinaryHeap* heap)

    int binary_heap_num_entries(BinaryHeap* heap)
