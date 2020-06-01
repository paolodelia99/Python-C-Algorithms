# Cython CAlgorithms Wrapper

Make https://github.com/fragglet/c-algorithms available in python using cython. Low level C data structure available in python.

Data Structures already implement:
- Queue
- Trie
- HashTable
- Set 
- ArrayList
- Bloom Filter

Data Strucuture to Implement:
- List
- AVL-Tree
- Binary Heap
- Binomial Heap
- Red Black Trees

## Usage

Install the repo 

    git clone https://github.com/paolodelia99/Python-C-Algorithms.git
    
Build the cython wrapper

    python setup.py build_ext -i


## Examples


Do you need an efficent queue implementation? 
Here's how you can have it!

```python
import queue

Queue = queue.Queue

q = Queue(100, 40)
l = [100, 2, 234, 4, 5, 34, 56, 12, 98, 67, 34]

q.extend(l)

print(q.peek(100)) # True
q.pop()
print(q.peek(2)) # True
q.pop()
print(q.peek(234)) # True

```


Here's an example on how to use the bloom filters

```python
import bloom_filter 

BloomFilter = bloom_filter.BloomFilter

b = BloomFilter(100, 40)

b.insert(102)
b.insert(123)
b.insert(234)

print(b.query(102)) # True
print(b.query(123)) # True
print(b.query(234)) # True

print(b.query(1)) # False
print(b.query(1025)) # False
print(b.query(562)) # False

```

## Contributing

Feel free to report issues and contributing to the code making it better.

## Author

Paolo D'Elia 

## License

MIT