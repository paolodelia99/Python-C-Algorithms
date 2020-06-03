cimport clist
cimport ccompare_int
cimport ccompare_string

cdef class List:
    """
    A class representing the list
    """

    cdef clist.ListEntry* head
    cpdef str type
    cpdef unsigned int list_length
    cdef clist.ListEqualFunc equal_func
    cdef clist.ListCompareFunc compare_func

    def __cinit__(self, object data, type="int"):
        """
        List constructor

        @param data
        @param type
        """
        # Check the list type
        if type == "int":
            self.type = "int"
            self.compare_func = <void*>ccompare_int.int_compare
            self.equal_func = <void*>ccompare_int.int_equal
        elif type == "str":
            self.type = "str"
            self.compare_func = <void*>ccompare_string.string_compare
            self.equal_func = <void*>ccompare_string.string_equal
        elif type == "float":
            self.type = "float"
        else:
            self.type = "str"
            self.compare_func = <void*>ccompare_string.string_compare
            self.equal_func = <void*>ccompare_string.string_equal

        clist.list_prepend(&self.head, <void*> data)

        if self.head is NULL:
            raise MemoryError()

    def __dealloc__(self):
        if self.head is not NULL:
            clist.list_free(self.head)

    cpdef prepend(self, object data):
        """
        @param data: the data to add at the begin of the list
        """
        cdef clist.ListEntry* new_entry = clist.list_prepend(&self.head, <void*> data)

        if new_entry is NULL:
            raise MemoryError()
        else:
            self.list_length += 1


    cpdef append(self, object data):
        """
        @param data: the data to add at the end of the list
        """
        cdef clist.ListEntry* new_entry = clist.list_append(&self.head, <void*> data)

        if new_entry is NULL:
            raise MemoryError()
        else:
            self.list_length += 1

    cpdef extend(self, values):
        """
        Append a list of values in the list
        
        @param values: list of values to append
        """
        for value in values:
            self.append(value)

    cpdef int length(self):
        """
        @return the length of the list
        """
        cpdef unsigned int l_length = clist.list_length(self.head)
        self.list_length = l_length
        return l_length

    cpdef object get_head(self):
        """
        @return the data of the head of the list
        """
        head_data = <object>clist.list_data(self.head)
        return head_data

    cpdef object get_nth_data(self, unsigned int n):
        """
        @param n: nth element of the list
        """
        # Check wheather of not n in bigger than self.length
        if n > self.list_length:
            return float('-inf')

        nth_entry_data = <object>clist.list_nth_data(self.head, n)
        if nth_entry_data == -1:
            return float('-inf')

        return nth_entry_data

    cpdef remove_data(self, object data):
        """
        Remove the given data in the list if is present otherwise it throws an error
        
        @param data: the data to remove in the list
        """
        if not clist.list_remove_data(&self.head, self.equal_func, <void*>data):
            raise IndexError("Could not find the data")

    cpdef sort(self):
        # fixme: there is something wrong with sort
        clist.list_sort(&self.head, <void*>self.compare_func)