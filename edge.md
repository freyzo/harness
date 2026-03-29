---
id: edge
type: generative
usage: "/edge {function_sig or problem description} - generate test cases covering all boundary conditions"
---
directives:
  - read function signature and constraints from input
  - enumerate boundary conditions
  - for each boundary: generate a concrete test case (input -> expected output)
  - output ready-to-run test cases, not just bullet descriptions

output_spec:
  format: yaml
  per_case:
    - id: short name
    - input: exact value(s)
    - expected: exact expected output
    - why: one-line boundary rationale

categories_to_cover:
  - empty/null input
  - single element
  - duplicates (including order-independent duplicates)
  - negatives, zero, max int
  - already sorted / reverse sorted
  - all same value
  - max constraint size (performance boundary)
  - off-by-one (n-1, n, n+1)
  - concurrent/race conditions if relevant
  - state machine violations (re-add after reject, self-reference)
  - constraint combinations (two edge conditions at once)

forbidden:
  - prose descriptions without concrete input/expected pairs
  - vague cases like "large input" without actual values
  - skipping the why field
