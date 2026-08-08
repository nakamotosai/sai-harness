# completion-dod.md — Done-Definition checklist template

> Copy anywhere a "is this actually done?" decision gets made. The single rule:
> **done = all five together, missing any one = not done**. A checklist like this is
> what stops an agent from reporting "done/fixed" while a "next step" still hangs.

---

## The five, in order — all required

| # | Dimension | What "done" looks like | What "not done" looks like |
|---|---|---|---|
| 1 | **Goal runnable & verified** | A command exited non-zero, a path exists, a receipt printed | "I wrote it" with no terminal evidence |
| 2 | **User-perceivable sign-off** | Artifact opened/installed/released + plan & checklist in chat + long jobs pulse 60–90s | Wrote to a file; user has nothing in their hands |
| 3 | **todo open=0** | `todo view` returns all done | "I'll wrap up" leaves a tracker item dangling |
| 4 | **Write-back receipt** | pitfall/card doc_id, wiki doc_id — stated directly, no hedge | "could log later" / "if you want" hedging |
| 5 | **Reviewer passed** (artifacts exist) | blank-context, cross-family, evidence-on-disk PASS | "looks right to me" self-review |

## Per-task-type table (the "next time" the checklist calls for)

| Task type | Literal done | The "next time" DoD rolls in |
|---|---|---|
| Bug fix / artifact change | code correct + self-check passes | install/release/version-bump + "opened, path X" + user-perceivable confirm |
| Research / design | conclusion on disk | conclusion + per-line decision checklist + surfaced in chat + SSOT write-back |
| Long-running (>2 steps or >90s) | command exit 0 | progress pulse every 60–90s; stage results broadcast |
| System / instance build | feature runs | routed to SSOT repos + entry handed to the user |
| Rule / default change | change生效 | pitfall book entry + CHANGELOG line, unprompted |
| Data / config delivery | fields correct | latest facts re-verified (include an evaluator on volatile facts) |

## Red lines on the DoD spine

- No reporting "done" while a "next step" stays un-executed (uninstalled / unreleased
  / unnotified / unwritten-down / not routed to SSOT).
- "Wrote to a file" is NOT "delivered a user experience" — write-to-disk leaves the
  user with nothing.
- If you're unsure whether the "next step" is in-scope → put it in the *acceptance*
  clause of the spec up front; don't guess afterward.

## The "user said I don't understand" rule

If the user signals incomprehension ≥1 time → drop the jargon and re-explain with a
real-world analogy and real numbers. >2 explanations still not landing → stop and ask
them *which part* is stuck; never substitute a third verbatim repetition.

## The "same error ≥3×" rule

Same failure mode thrice → rewrite the rule body itself (AGENTS or equivalent),
strengthen the trigger word, add an escalation path. A pitfall card or advisory note
on its own does NOT count as treating it — the standing rule has to change.
