import nose
import trie

Trie = trie.Trie


def test_trie_101():
    t = Trie()
    nose.tools.assert_is_instance(t, trie.Trie)


def test_trie_num_entries():
    t = Trie()
    nose.tools.assert_equal(t.num_entries(), 0)


def test_trie_append():
    t = Trie()
    t.append("ci", 2)
    nose.tools.assert_equal(t.num_entries(), 1)


def test_trie_append_102():
    t = Trie()
    t.append("a", 40)
    t.append("ab", 12)
    t.append("abc", 14)
    nose.tools.assert_equal(t.num_entries(), 3)


def test_trie_remove():
    t = Trie()
    t.append("ab", 34)
    t.append("a", 12)
    t.remove("ab")
    nose.tools.assert_equal(t.num_entries(), 1)


def test_trie_lookup():
    t = Trie()
    t.append("a", 40)
    t.append("ab", 12)
    t.append("abc", 14)
    t.append("b", 13)
    nose.tools.assert_equal(t.lookup("a"), 40)
    nose.tools.assert_equal(t.lookup("b"), 13)
    nose.tools.assert_equal(t.lookup("ab"), 12)
    nose.tools.assert_equal(t.lookup("abc"), 14)