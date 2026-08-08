# reporting-spine.md — delivery-spine checklist template

> Copy this skeleton anywhere the agent owes the user a formal delivery or a
> finish-line report. The spine is fixed and ordered; the checklist is **always last**
> and nothing follows it. This is what stops structure drift between sessions.

---

## The five fixed blocks — in order

1. **🎯 one-line result** — a single sentence: what the agent did, what changed. Plain
   words first, jargon only when it names a real thing and only with a plain-word gloss
   on first use.
2. **🧩 plain-words explanation** — the human-truth version: why you touched what you
   touched, in a reader's vocabulary, not the agent's internal monologue.
3. **✅ evidence & self-verify** — the receipts: command exits, paths, reviewer
   verdicts, doc_ids. Named, not gestured at.
4. **👉 next** — what the user has to decide or say next, or what the agent will do next
   if the user is silent. No open TODO hidden here.
5. **📋 checklist** — locked last, nothing after it. Four rows, in this order:

```
- verifier : <evidence the verdicts above are real — reviewer name+score, cmds, API pings>
- todo     : <N/N done> · MaxKB : <doc_id, copied from the tool reply, never retyped>
- wiki     : <file path of the long-form write-back / "none, this turn had no long-form">
```

## Checklist rules (the hard ones)

- **MaxKB / wiki rows state results directly**: a doc_id or a file path or the literal
  word `none`. NEVER: "could be logged" / "if you want" / "tbd" / "待确认". If the turn
  had deep investigation it is a hard trigger — write the write-back first, *then* close.
- **Receipt strings are copied from tool replies**, never re-typed from memory — a
  doc_id you hand-type is a fabrication waiting to happen.
- The delivery body itself does **not** contain self-correction / retraction trails
  ("wait / actually / re-checking..."). The checklist appears **once**; you don't ship
  two checklists for one delivery.

## Vocabulary gate (no black-box jargon)

English abbreviations and internal terms, on first appearance, get a plain-word
parenthetical. The user-visible body never contains an un-glossed term. If the user
has said "I don't understand / what is that" ≥1 time → re-explain with an analogy and
real numbers; do not pile on more terms.

## Options gate (when you must present a choice)

Ask three questions before popping a dialog: is there an obvious best option? would
every other option fail the user's true intent? is this fork irreversible? If any
answer is yes, don't ask — do it, then report. If you must ask, each option carries
three human-word lines: ① what it is ② what choosing it costs ③ how it serves the user's
goal. An option that cannot meet the user's intent does not earn a slot in the list.
