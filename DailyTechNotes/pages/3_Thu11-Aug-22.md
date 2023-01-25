# Thursday 11/August/22: Binary Heaps and Big O

## Binary Heaps

### Rules
1. Every level is full, last one from left to right
2. _Heap property_: No child is smaller than its parent

### Properties
- `GetMin` $O(1)$: Just lookup the value of the root node, which by
    *rule 2* has also the minimum value.
- `Insert` $O(\log{n})$: By *rule 1* there's only one valid position.
    If it violates *rule 2*, the fix is bubbling up the node until
    its fixed.
- `ExtractMin` $O(\log{n})$: Just removing the `root node` creates a
    gap.
    1. swap its value with right-most value of the last
    level.
    2. remove the `leaf`, with the former value of the `root node`
    3. swap the `root node` value with the lowest of its `children
       nodes` until *rule 2* is satisfied.
- `DecreaseKey` $O(\log{n})$: This is useful to change priorities.
    1. find the desired `node` and change its value
    2. fix *rule 2* by bubbling the value


### Bibliography
- [Fibonacci Heaps by *SithDev*](https://youtu.be/6JxvKfSV9Ns)

---

## Big O Notation

- In $f(n) = O(g(n))$, $f(n)$ grows *as most* as quickly as $g(n)$
- In $f(n) = \Omega(g(n))$, $f(n)$ grows *at least* as quickly as
    $g(n)$
- If $f(n) = O(g(n))$ and $f(n) = \Omega(g(n))$ then $f(n) =
    \Theta(g(n))$


