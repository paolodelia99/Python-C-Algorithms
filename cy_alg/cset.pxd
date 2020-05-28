cdef extern from "set.h":

    ctypedef struct Set:
        pass

    ctypedef struct SetIterator:
        pass

    ctypedef struct SetEntry:
        pass

    cdef struct _SetIterator:
        Set* set
        SetEntry* next_entry
        int next_chain

    ctypedef void* SetValue
    ctypedef void* SetHashFunc
    ctypedef void* SetEqualFunc

    # ctypedef int (*SetEqualFunc)(SetValue value1, SetValue value2)

    ctypedef void* SetFreeFunc

    Set* set_new(SetHashFunc hash_func, SetEqualFunc equal_func)

    void set_free(Set* set)

    void set_register_free_function(Set* set, SetFreeFunc free_func)

    int set_insert(Set* set, SetValue data)

    int set_remove(Set* set, SetValue data)

    int set_query(Set* set, SetValue data)

    int set_num_entries(Set* set)

    SetValue* set_to_array(Set* set)

    Set* set_union(Set* set1, Set* set2)

    Set* set_intersection(Set* set1, Set* set2)

    void set_iterate(Set* set, SetIterator* iter)

    int set_iter_has_more(SetIterator* iterator)

    SetValue set_iter_next(SetIterator* iterator)
