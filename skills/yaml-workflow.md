---
id: yaml-workflow
type: generative
usage: "/yaml-workflow {problem or task} - plan before any code"
---
directives:
  - read problem or task from input
  - output a terse dense yaml plan in plans/ dir following output_naming; no code yet
  - output_naming:
    - triage: "plans/triage.workflow.yaml"
    -per_task: "{slugified-task-id}.workflow.yaml"
  - for coding problems: use coding_skeleton
  - for triage/planning tasks: use triage_skeleton
  - pick skeleton based on input type; never mix

coding_skeleton:
  constraints:
    input_format:
    output_format:
    edge_cases_to_handle:
    complexity_target:
  approach:
    brute: {description, time, space}
    optimized: {description, time, space}
    chosen: brute|optimized
    why:
  implement_order:
    - step 1
    - step 2
  test_cases: "-> run /edge after this"
  risks:
    -

triage_skeleton:
  dependency_graph: "A->B pairs or none"
  per_task:
    - id:
      depends_on:
      status: not_started
      explicit:
      implicit:
      gotchas:
  top_3:
    - id:
      status: not_started
      est:
      why:
  skips:
    - id:
      rationale:

forbidden:
  - prose outside yaml
  - writing code in the plan
  - skipping complexity analysis for coding problems
  - skipping dependency mapping for triage
