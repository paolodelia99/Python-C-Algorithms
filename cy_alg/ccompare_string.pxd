cdef extern from "compare-string.h":
    cpdef int string_equal(void* string1, void* string2)
    cpdef int string_compare(void* string1, void* string2)
    cpdef int string_nocase_equal(void* string1, void* string2)
    cpdef int string_nocase_compare(void* string1, void* string2)