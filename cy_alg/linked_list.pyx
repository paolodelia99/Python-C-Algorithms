cimport clist

# fixme: object linked list isn't callable

cdef class List:
    """
    A class representing the list
    """

    cdef clist.ListEntry* head
    cpdef str type
    cpdef unsigned int length

    def __cinit__(self, object data, type="int"):
        """
        List constructor

        @param data
        @param type
        """
        # Check the list type
        if type == "int":
            self.type = "int"
        elif type == "str":
            self.type = "str"
        elif type == "float":
            self.type = "float"
        else:
            self.type = "str"

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
            self.length += 1


    cpdef append(self, object data):
        """
        @param data: the data to add at the end of the list
        """
        cdef clist.ListEntry* new_entry = clist.list_append(&self.head, <void*> data)

        if new_entry is NULL:
            raise MemoryError()
        else:
            self.length += 1

    cpdef extend(self, values):
        for value in values:
            self.append(value)

    cpdef int length(self):
        """
        @return the length of the list
        """
        cpdef unsigned int length = clist.list_length(self.head)
        self.length = length
        return clist.list_length(self.head)

    cpdef object get_head(self):
        head_data = <object>clist.list_data(self.head)
        return head_data

    cpdef object get_nth_data(self, unsigned int n):
        if n > self.length:
            return float('-inf')

        nth_entry_data = <object>clist.list_nth_data(self.head, n)
        if nth_entry_data == -1:
            return float('-inf')

        return nth_entry_data