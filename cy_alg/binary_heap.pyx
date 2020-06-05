cimport cbinary_heap
cimport ccompare_string
cimport ccompare_int

cdef class BinaryHeap:
    """
    A class representing the binary heap
    """

    cdef cbinary_heap.BinaryHeap* _c_binary_heap
    cdef cbinary_heap.BinaryHeapType _c_heap_type

    def __cinit__(self, heap_type="max", data_type="str"):
        """
        Binary Heap constructor

        @param heap_type
        @param data_type
        """
        if heap_type == "max":
            self._c_heap_type = cbinary_heap.BinaryHeapType.BINARY_HEAP_TYPE_MAX
        elif heap_type == "min":
            self._c_heap_type = cbinary_heap.BinaryHeapType.BINARY_HEAP_TYPE_MIN

        if data_type == "int":
            self._c_binary_heap = cbinary_heap.binary_heap_new(self._c_heap_type, <void*>ccompare_int.int_compare)
        elif data_type == "str":
            self._c_binary_heap = cbinary_heap.binary_heap_new(self._c_heap_type, <void*>ccompare_string.string_compare)
        else:
            self._c_binary_heap = cbinary_heap.binary_heap_new(self._c_heap_type, <void*>ccompare_string.string_compare)

        if self._c_binary_heap is NULL:
            raise MemoryError()

    def __dealloc__(self):
        if self._c_binary_heap is not NULL:
            cbinary_heap.binary_heap_free(self._c_binary_heap)

    cpdef insert(self, object value):
        """
        @param value
        """
        if not cbinary_heap.binary_heap_insert(self._c_binary_heap, <void*>value):
            raise MemoryError()

    cpdef pop(self):
        value = <object>cbinary_heap.binary_heap_pop(self._c_binary_heap)
        return value

    cpdef int num_entries(self):
        """
        @return the number of entries of the heap
        """
        return cbinary_heap.binary_heap_num_entries(self._c_binary_heap)


