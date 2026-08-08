# light-contract.md — light task engine template

> Drop into `rules/light-contract.md`. A light task = low effort / low complexity /
> low risk / low coupling. The point of a *light* task is: you can self-verify by a
> single mechanical pass and no independent reviewer is required — so the contract is
> short, not ceremonial.

---

## Entry — only via the lead, never typed by the user

The lead judges "light vs heavy". If the user ever has to type an orchestration
keyword, the judgement failed. Enter this flow with a spec already on disk.

## Spec (stored as `local://spec.md`, three lines)

```
goal:    <one sentence — what "done" looks like, runnable/verifiable>
scope:   <in scope / out of scope, couched as the minimal sufficient work>
accepts: <the mechanical self-check that proves it — command exit / path / receipt>
```

## Disptach — all sub-agents as `task`

Every agent you spawn comes through the `task` tool, never ad-hoc. Read-only scouting
goes to a scout agent; execution goes to a task agent. No parallel double-write of a
strongly-coupled file group without isolation.

## Mechanical self-verification (the whole point of "light")

- The self-check is **computable**, not vibes: a command exits non-zero, a path
  appears, a receipt prints, a test binary prints `OK`.
- The failure mode is **observable**: when it's broken, the check visibly fails.
- No user-facing artifact was produced, OR the artifact is trivially inspectable.
- If the failure is silent (a wrong value nobody notices until production) → you
  misjudged; promote to the heavy contract and pull a reviewer.

## Finish (Done = five together)

The goal ran under the self-check and exited clean + the checklist landed in chat +
openable artifact was opened + todo at open=0 + write-back receipt captured
(pitfall card if anything tripped; wiki doc if the work produced long-form knowledge).

## Stop & escalate (becomes heavy)

- Same failure point hits ≥3× → mark blocked, report with full error + paths tried.
- A user-facing or irreversible artifact appears → pull a blank-context reviewer.
- Scope creeps beyond one cheap pass → re-judge; write a full spec and switch to the
  heavy contract instead of muscling through.

## What light does NOT have (by design)

- No multi-agent workflow fan-out — one pass, one writer.
- No blank-context independent reviewer unless a user-facing artifact showed up.
- No progress pulse cadence — a light task finishes in one pass; if it's long enough
  to need a 60–90s pulse, it's not light.
