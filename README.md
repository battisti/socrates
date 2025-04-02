# Socrates

Project to learn Mojo 🔥.

## TODOs

## TODOs

- Investigate why the `unsafe_get` method does not terminate in the benchmarks.
  - Use binary search to determine the input size limit that causes the issue.
  - Is there an easy way to generate assembly output? Ideally, `__getitem__` should compile to the same assembly as `unsafe_get` in the `sub` and `add` functions.
- Look for a property-based testing library similar to QuickCheck.
- Understand why `reduce` appears to be slower than a standard `for` loop (`add_reduce` vs. `add`).
  - Is there an easy way to inspect the number of memory allocations?
- See if there is a more robust alternative to the Defaultable trait in the override of the add function for multiple vectors
