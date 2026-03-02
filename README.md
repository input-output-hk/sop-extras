# SOP extras

These packages extend the [SOP](https://github.com/well-typed/generics-sop)
ecosystem with other types that follow the same principles. In particular:

- `strict-sop-core` provides strict alternatives to the `NS` and `NP` types
  defined in `sop-core`.
- `sop-extras` define new types that complement the standard SOP definitions:
  - `Index` for indexing into a type-level list and project an NP by index or inject in an NS by index,
  - `InPairs` for functions on contiguous pairs of types in a type-level list,
  - `Tails` for functions from a type to all the later types in a type-level list,
  - `Telescope` for an NS that can be extended or retracted to other summands,
    plus keeping some information for preceding types in the type-level list.

These definitions have had very little variations in a long time, and therefore
the vast majority of the code was an invention of the original authors who we
credit here: Edsko de Vries and Thomas Winant.
