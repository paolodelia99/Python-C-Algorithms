import nose
import bloom_filter

BloomFilter = bloom_filter.BloomFilter


def test_bloom_filter_101():
    b = BloomFilter(100, 30)
    nose.tools.assert_is_instance(b, BloomFilter)


def test_bloom_filter_query():
    b = BloomFilter(100, 30)
    b.insert("Paolo")
    b.insert("Bloom")
    b.insert("Filter")
    nose.tools.assert_true(b.query("Paolo"))
    nose.tools.assert_true(b.query("Bloom"))
    nose.tools.assert_true(b.query("Filter"))
    nose.tools.assert_false(b.query("Sos"))
    nose.tools.assert_false(b.query("Sas"))


# fixme: concat doesn't work
# def test_bloom_filter_concat():
#     b1 = BloomFilter(100, 30)
#     b2 = BloomFilter(100, 30)
#
#     l1 = ["Paolo", "Bloom", "Filter", "Sas", "sos", "Paolown"]
#     l2 = ["Sam", "essere", "be", "wonderful", "sos", "asap"]
#
#     for el1, el2 in zip(l1, l2):
#         b1.insert(el1)
#         b2.insert(el2)
#
#     b1.concat(b2)
#
#     nose.tools.assert_true(b1.query("Paolo"))
#     nose.tools.assert_true(b1.query("Bloom"))
#     nose.tools.assert_true(b1.query("Filter"))
#     nose.tools.assert_true("Sam")