cdef extern from "compare-int.h":
    cpdef int int_equal(void* location, void* location)
    cpdef int int_compare(void* location, void* location)