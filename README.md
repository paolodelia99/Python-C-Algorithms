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

- [Queue](#Queue)
- [Trie](#trie)
- [List](#list)
- [Set](#Set)
- [Bloom Filter](#bloom-filter)

### Queue
Do you need an efficent queue implementation? 
Here's how you can have it!

```python
import queue

Queue = queue.Queue

q = Queue(100, 40)
l = [100, 2, 234, 4, 5, 34, 56, 12, 98, 67, 34]

q.extend(l)

print(q.peek()) # 100
q.pop()
print(q.peek()) # 2
q.pop()
print(q.peek()) # 234

```

### List

```python
import linked_list

List = linked_list.List()

l = List(89,"int")

arr = [38, 39 , 101, 23, 45, 56, 67]

l.entend(arr)

# Print all the elements of the list
for i in range(l.length()): # 89, 38, 39, 101, 23, 45, 56, 67
    print(l.get_nth_data(i)) 

l.prepend(1)

# Print all the elements of the list
for i in range(l.length()): # 1, 89, 38, 39, 101, 23, 45, 56, 67
    print(l.get_nth_data(i)) 

# Using list of strings

l_str = ("Hello")

str_arr = ["world", "dog","space","cake"]

l_str.extend(str_arr)

for i in range(l_str.length()):
    print(l_str.get_nth_data(i)) # Hello, world, dog, space, cake

```

### Trie

```python
import trie
Trie = trie.Trie()

t = Trie()

t.append("a", 23)
t.append("ab", 78)
t.append("abc", 14)
t.append("cb", 12)

print(t.lookup("a")) # 23
print(t.lookup("ab")) # 78
print(t.lookup("abc")) # 14
print(t.lookup("cb")) # 12

```

### Set

```python
import set
Set = set.Set()

s = Set("str")

str_list = ["Hello", "my","name", "is", "Paolo","Paolo","is", "my","name"]

for el in str_list:
    s.insert(el)

print(s.num_entries()) # 5 
print(s.query("Paolo")) # True
print(s.query("Hello")) # True
print(s.query("Dog")) # False

s.remove("is")

print(s.query("is")) # False

```

### Bloom Filter
Need a probabilistic data structure? Here's how you can use the bloom filters.

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