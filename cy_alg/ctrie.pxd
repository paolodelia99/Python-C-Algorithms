cdef extern from "trie.h":
    ctypedef struct Trie:
        pass
    ctypedef void* TrieValue

    Trie* trie_new()
    void trie_free(Trie* trie)

    int trie_insert(Trie* trie,char* key, TrieValue value)
    TrieValue trie_lookup(Trie* trie,char* key)
    int trie_remove(Trie* trie,char* key)
    unsigned int trie_num_entries(Trie* trie)