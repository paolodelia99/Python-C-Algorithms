from typing import Any
cimport clist

# fixme: object linked list isn't callable

cdef class List:
    """
    A class representing the list
    """

    cdef clist.ListEntry* head
    cpdef str type

    def __cinit__(self, type: Any = int):
        """

        """
        # Check the list type
        if type == int:
            self.type = "int"
        elif type == str:
            self.type = "str"
        elif type == float:
            self.type = "float"
        else:
            self.type = "str"



    def __dealloc__(self):
        if self.head is not NULL:
            clist.list_free(self.head)

    cpdef prepend(self, object data):
        """
        
        """
        cdef clist.ListEntry* new_entry = clist.list_prepend(&self.head, <void*> data)

        if new_entry is NULL:
            raise MemoryError()


    cpdef append(self, object data):
        """
        
        """
        cdef clist.ListEntry* new_entry = clist.list_append(&self.head, <void*> data)

        if new_entry is NULL:
            raise MemoryError()