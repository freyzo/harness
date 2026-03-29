---
id: debug
type: behavioral
usage: "/debug - trace execution path and find exact break point"
---
directives:
  - read: failing test or reproduction steps + relevant code
  - trace execution path step by step
  - identify exact line where invariant breaks
  - output: minimal fix only; no refactor; no rewrite of working code

constraints:
  - minimal fix only
  - preserve all working code
  - do not refactor opportunistically

forbidden:
  - rewriting working code
  - refactoring beyond the break point
  - over-engineering the fix
  - guessing without tracing

output_spec:
  format: yaml
  sections:
    - trace: step by step execution path
    - break_point: exact line/condition that fails
    - fix: minimal patch only
