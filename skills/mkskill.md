---
id: mkskill
type: meta
usage: "/mkskill {name} [intent hint]"
---
directives:
  - infer type from name+hint -> set frontmatter type accordingly
  - behavioral: body=[directives,constraints,forbidden]; no output_spec
  - generative: body=[directives,output_spec]; no constraints/forbidden
  - create skills/{name}.md; verify type-body match before writing

types: [behavioral, generative]

templates:
  behavioral: |
    ---
    id: {name}
    type: behavioral
    usage: "/{name} [context]"
    ---
    directives:
      -
    constraints:
      -
    forbidden:
      -
  generative: |
    ---
    id: {name}
    type: generative
    usage: "/{name} [input]"
    ---
    directives:
      -
    output_spec:
      path:
      format:
      sections:
