cimport carraylist
cimport ccompare_int

cdef class ArrayList:
    """
    A class representing an Arraylist
    """
    cdef carraylist.ArrayList* _c_arraylist

    def __cinit__(self, int length):
        """
        Arraylist constructor
        """
        self._c_arraylist = carraylist.arraylist_new(length)

        if self._c_arraylist is NULL:
            raise MemoryError()

    def __dealloc__(self):
        if self._c_arraylist is not NULL:
            carraylist.arraylist_free(self._c_arraylist)

    cpdef append(self, object value):
        """
        Append in the arraylist the given value
        
        @param value: the value to insert in the arraylist
        """
        if not carraylist.arraylist_append(self._c_arraylist, <void*> value):
            raise MemoryError()

    cpdef prepend(self, object value):
        """
        Append a value at the first position
        
        @param value: value to append a the first position
        """
        if not carraylist.arraylist_prepend(self._c_arraylist, <void*> value):
            raise MemoryError()

    cpdef remove(self, unsigned int index):
        """
        Remove a value in the arraylist in the given index
        
        @param index: the index of the value to remove in the arraylist
        """
        carraylist.arraylist_remove(self._c_arraylist, index)

    cpdef remove_range(self, unsigned int index, unsigned length):
        """
        Remove values of the arraylist in the given range
        
        @param index: the starting index of the range
        @param length: the length of the deleting range
        """
        carraylist.arraylist_remove_range(self._c_arraylist, index, length)

    cpdef insert_at(self, unsigned int index, object value):
        """
        Insert the given value the the given index
        
        @param index: the index of the array where insert the new value
        @param value: the value to insert
        """
        if not carraylist.arraylist_insert(self._c_arraylist, index, <void*>value):
            raise IndexError("The index is wrong")

    cpdef unsigned int index_of(self, object value):
        """        
        @param value
        @return the index of the given value
        """
        res = carraylist.arraylist_index_of(self._c_arraylist, <void*>ccompare_int.int_equal, <void*>value)
        return res

    cpdef clear(self):
        """
        Remove all the elements in the array list 
        """
        carraylist.arraylist_clear(self._c_arraylist)

    cpdef sort(self):
        """
        Sort the array list in descending order
        """
        carraylist.arraylist_sort(self._c_arraylist, <void*>ccompare_int.int_compare)

