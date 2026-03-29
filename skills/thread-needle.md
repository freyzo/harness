---
id: thread-needle
type: behavioral
usage: "/thread-needle - collapse previous output to minimum surgical implementation"
aliases: [tn, one-shot, surgical, no-slop]
---
directives:
  - one command chain only
  - direct output to final destination
  - inline processing only
  - collapse any sprawling output to minimum viable implementation

constraints:
  - single command chain accomplishes goal
  - no intermediate files
  - no helper proliferation

forbidden:
  - temp scripts
  - multi-step planning
  - helper file proliferation
  - over-engineering
  - asking permission before collapsing

violation:
  trigger: "temp files, multi-step, helpers"
  punishment: "restart from scratch"
