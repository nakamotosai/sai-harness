# heavy-contract.md — heavy multi-agent contract template

> Drop into `rules/heavy-contract.md`. A heavy task = anything not light: high
> effort / complexity / risk / coupling, or one that produces a **verifiable**
> user-facing artifact. The defining property of heavy is: you dispatch several
> sub-agents through the `task` engine AND pull a blank-context independent reviewer
> at the finish — self-review is forbidden.

---

## Entry — only via the lead, never typed by the user

Judge first. If the user has to pick "orchestration mode" you misjudged. Enter with a
spec already on disk. A pure design / solution-finding phase runs a brainstorm pass
(read-only agents on separate facets, each note a live wiki doc, lead merges, HARD-GATE
waits for the user to confirm the *plan* before any execution) — then switch to this
flow.

## Spec — full template (on disk before any work)

```
context:    why this task exists now, what the last user turn actually asked
goal:       runnable/verifiable one-liner of "done"
scope:      in/out, the must-have dimensions of the omitted motive (not nice-to-haves)
acceptance: the checklist a blank-context reviewer can tick from disk evidence
slices:     the breakdown the work fans out into, each slice independently verifiable
risk:       what could go wrong and the rollback for each (incl. irreversibles)
verify:     what the independent reviewer will check, what evidence they need
write-back: where artifacts route per SSOT (long-form→wiki, pitfalls→pitfall book, etc.)
```

## Dispatch — role routing, all as `task`

- **scout** — read-only recon only: codebase questions, rapid lookups, broad pattern
  searches. Never hand a scout the heavy lifting (deep research, complex edits,
  adversarial review).
- **task** — execution, fan-out slices.
- **reviewer** — blank-context, independent, ideally a different model family than the
  lead (adversarial cross-check). You spawn it; you do NOT brief it with your intent,
  only with spec verification criteria + the claimed file list + ≤10 checkable facts
  + the budget tier (D1 ≤8 calls / D2 ≤15 / D3 ≤25).

Strongly-coupled file groups: no naked parallel double-write — isolate via separate
task instances.

## Watchdog rails (hard caps)

- 90s no-event stall watchdog per sub-agent.
- 240s total wall clock per fan-out.
- ≤3 retry-then-degrade; a single reasoning turn >60k chars =失控, cancel it.

## Finish — Done = five together (all required)

1. Goal runnable & verified (command exit / path / receipt).
2. User-perceivable sign-off: artifact installed/released/opened + plan & checklist in
   chat + long jobs report every 60–90s + items routed to the right SSOT repo.
3. todo at open=0 (`todo view` is the source of truth).
4. Write-back receipt captured (pitfall card doc_id / wiki doc_id / etc).
5. Independent reviewer passed — **blank context, cross-family, evidence on disk**;
   a self-asserted "looks right" does not count, and a boolean `passed` field does
   not count — the reviewer's *findings* must each be backed by a read/grep/path/cmd.

## Escalate / abort

- Same failure ≥3×, or dependency missing, or user said stop → mark blocked with the
  reason, full error output and tried paths. Never delete/skip/downgrade to get around.
- A "done" claim with no matching tool receipt → blocker; you're hand-waving DoD intact.
- Reviewer flagged a T1 → not done; fix, re-verify (or rollback + report) before close.
