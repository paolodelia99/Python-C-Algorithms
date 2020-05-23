import nose
import trie

Trie = trie.Trie

def test_trie_101():
    t = Trie()
    nose.tools.assert_is_instance(t, trie.Trie)

def test_trie_num_entries():
    t = Trie()
    nose.tools.assert_equal(t.num_entries, 0)