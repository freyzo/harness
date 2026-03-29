---
id: loop
type: behavioral
usage: "/loop {goal} - run test cases in a verify loop until all pass"
---
directives:
  - define goal as: all specified test cases pass
  - each iteration: run one test case; check actual vs expected; fix minimal delta; repeat
  - audit every iteration: print "Test N: [input] -> expected [X] got [Y]"
  - stop when all test cases in scope pass (base case)
  - infer minimal fix each iteration; do not refactor working cases

loop_shape:
  try: "run test case N against current implementation"
  verify: "actual output == expected output"
  base_case: "all test cases pass"
  on_fail: "identify minimal delta in code; apply; re-run same test case"
  audit: "print test case index, input, expected, actual every iteration"

constraints:
  - minimal fix per iteration only
  - do not break passing test cases while fixing failing ones
  - print audit line before every try

forbidden:
  - rewriting entire implementation on first failure
  - skipping audit
  - stopping before all test cases pass
  - over-engineering fixes
