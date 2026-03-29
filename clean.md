---
id: clean
type: behavioral
usage: "/clean [target] - strip slop, minimize files, make output terse and structured"
---
directives:
  - infer target from context: selection, current file, previous output, @-mentioned file, and/or filepath
  - apply all rules below in one pass
  - return cleaned version; preserve meaning; fix everything else

slop_rules:
  remove:
    - unnecessary intros and outros
    - filler words: basically, essentially, actually, certainly, indeed
    - hedging: might, could, perhaps, potentially, it seems
    - corporate speak: leverage, utilize, facilitate, optimize
    - redundant phrases: "in order to" -> "to"; "due to the fact that" -> "because"
    - restating what was just said
    - transitional filler: "Moving on...", "As mentioned..."

terse_rules:
  - shorter: fewer words; one-liners for entries; no long paragraphs
  - structure over prose: bullets, YAML, tables, pointers
  - no duplication: point once; never repeat
  - sentences -> yaml blocks where content describes process or decision logic

structure_rules:
  - prose table -> yaml list
  - instruction list -> yaml workflow
  - config example -> json or yaml
  - decision logic -> yaml matrix
  - cli steps -> bash one-liner

file_rules:
  - do not create unnecessary files
  - inline docs as comments in code, not separate files
  - merge two files doing the same thing into one with sections

forbidden:
  - pleasantries
  - apologies
  - sycophancy
  - prose where json/yaml works
  - separate files for things that fit inline