<div align="center">

**🌐 Made by [Sai](https://saaaai.com) · [saaaai.com](https://saaaai.com)** — AI workflow · one homepage

**[English](README.md) · [简体中文](README.zh-CN.md) · [日本語](README.ja.md)**

</div>

# sai-harness

> Public notes on a Claude / agent delivery system: reporting spine · checklist always last

![sai-harness: public notes on a Claude / agent delivery system](assets/readme/hero.svg)

## One-line value

Official Claude Code is a programmable agent shell. On top of it I've built a personal delivery system: multi-step tasks are forced through search → spec → execute → evidence verification → behavioral evolution; five standing subagents split decision, QA, search, vision, and remote; knowledge lives in four libraries with only one current long-form version; complex work defaults to split-then-merge instead of calling a meeting whenever it gets hard; reports to humans use a fixed five-block spine, no prose outside the table. No client modding. It's all `CLAUDE.md`, skills, agents, hooks, MCP.

This repo is mainly that write-up and a capability map. Private config, keys, and intranet addresses never appear here.

## Capability panorama

![My Claude Harness capability panorama](docs/harness-map.png)

The map is an overview sketch; details are authoritative in this text.

## Why it's different

A stock install already writes code, runs git, speaks MCP, writes hooks, opens subagents.
I didn't invent a second Claude Code. The gap is discipline, division of labor, how memory is partitioned, how complex tasks are split and re-collected, and whether "I think it's fine" counts as done.

### Principles

1. **Short map, deep flow.** Top rules only route; heavy process goes into skills.
2. **Completion is evidenced.** Disk state, command results, verification receipts decide.
3. **Subagents specialize.** The one choosing doesn't QA; the one QA-ing doesn't decide the plan.
4. **Memory is partitioned.** Short pitfalls, projects, visuals, and long-form are not mixed.
5. **Errors must die thoroughly.** Changing words isn't enough; there must be a check that fails if it recurs.
6. **Find existing first, hand-roll second.** If a wheel is searchable, don't reinvent it by default.
7. **Talk like a colleague.** Lead with results and the change you'd feel; self-verification is you clicking, refreshing, listening, watching — not a wall of scripts dumped on you.
8. **Default to splitting, not meeting.** Independent probe/build goes parallel and returns to the main thread; only genuine debate or large homogeneous batches escalate.
9. **Plans are whole packages.** To hit an effect, give the complete plan; saying "do it" means the whole package, not à-la-carte half-pieces.

### Quick reference: default vs mine

| | Default Claude Code | This setup |
|--|------------------|--------|
| Positioning | A strong coding chat assistant | A personal delivery system |
| Memory | This conversation + auto notes | Four libraries + preference rules + long-form versions |
| Multi-step tasks | Strict only when you nag | Search → spec → execute → verify → write-back |
| Complex parallelism | Tends to one-person-everything or chaotic meetings | Defaults to split-and-return-to-main; merge lands on disk; replayable pipeline |
| Completion | Easily self-reports "done" | QA checks disk; bragging is void |
| Research | Casual search | Shallow/deep tiers, deep research has minimums |
| After errors | Mostly fixes the instance | Fixes the artifact and the rules and the sensor |
| Speaking to humans | Structure drifts | Fixed five blocks; no prose outside tables; no à la carte plans |
| Content volume | Stock is near a clean shell | Dozens of domain skills, five standing subagents, hard gates |

| # | Extra capability | Default feel |
|---|--------------|----------|
| 1 | Four-library division + long-form keeps only current version | Memory mushes in chat |
| 2 | Multi-step tasks forced through a pipeline | Can skip steps and deliver |
| 3 | Dedicated QA | Checking is optional |
| 4 | Three-gate plan review, one-vote veto | No fixed judge |
| 5 | External search has shallow/deep contracts | Two searches counts as research |
| 6 | Crash double-fix + recurrence-failing sensor | Apologize-patch-move-on |
| 7 | Dangerous ops hard-blocked | Mostly relies on willpower |
| 8 | Remote log / screenshot load isolated | Context easily flooded |
| 9 | UI, demos, media have fixed entries and acceptance | No full visual contract |
| 10 | Remote feelers + long-project checkpoints | Session closes, thread dies |
| 11 | Run evals before/after harness changes | Rules changed by feel |
| 12 | Reporting spine of five blocks + whole-package plan discipline | Style and structure drift, menu-style sign-off |
| 13 | Orchestration contract: stage dependencies, merge gate, pipeline, no needless graph escalation | Complex means force humans-talking / pipelines |

## Core methodology

### Architecture

```
You
 └─ Main control session (reads the map, dispatches, closes out, writes back)
     ├─ Rules: short map + preference list + memory index
     ├─ Rhythm: multi-step tasks follow the pipeline
     ├─ Orchestration: default split-and-return; only genuine debate / homogeneous batches escalate
     ├─ Subagents: plan / QA / search / vision / remote
     ├─ Domain skills: frontend, media, remote, knowledge, evolution…
     ├─ Hard gates: dangerous-action interception, discipline re-injected after compression, optional notifications
     ├─ External: knowledge-base search, web search, docs, message bridge
     └─ Four libraries: pitfalls / project ledger / themes+demos / long-form wiki
```

### Delivery pipeline: five steps

A job over one step defaults to running the whole line:

1. Search the context (pitfalls first, then long-form / web)
2. Write the goal and acceptance (what counts as done, and explicitly what's out of scope)
3. Only ask a human for high-risk actions (deleting core, money/accounts, changing top rules)
4. Execute (split where it should split, results return to main control)
5. Verify to passing (insufficient evidence → redo)
6. Write back to memory; report with the **five-block spine**

A crash requires a **double fix**: fix this artifact, and fix the root cause (a rule or a check). Patching the file and calling it done doesn't count.

### Wiring: five standing subagents

| Role | Extra capability |
|------|----------------|
| **Plan judge** | Three gates — logic, safety, feasibility; one veto blocks it |
| **Completion QA** | Audits disk against "claimed to change X"; self-attested pass is void |
| **Search / evidence** | Dedicated search and evidence capture; doesn't call life-or-death, doesn't ghostwrite the final draft |
| **Screenshot / vision** | UI acceptance returns only text, main session isn't flooded by big images |
| **Remote probe** | SSH / large logs compressed into short evidence before returning |

Whoever should do it, does it. Main control doesn't play every role solo.

### Orchestration (Graph thinking, no shell swap)

Talk online about agent graphs usually boils down to: don't do it all yourself, split when you should, merge after splitting, and see where it's stuck when it breaks.
I didn't swap in some external graph engine. Still Claude Code's skill / subagent / optional team·workflow, with discipline welded on top:

| Rule | Meaning |
|------|------|
| **Default split-and-return to main** | Independent probe/build uses subagents; results hand back to the main session to merge |
| **Only genuine debate calls a meeting** | Multi-role adversarial reasoning escalates to a squad; simple jobs are forbidden from forcing a meeting |
| **Only large homogeneous batches go pipeline** | Many identical steps use batch orchestration; and must produce a merged artifact |
| **Stages write their dependencies** | Complex plans write who depends on whom, reads what, outputs what, so blockages are visible mid-flight |
| **Multi-path must have a merge** | Several parallel paths finishing must produce a merge file, not just assembled in someone's head |
| **Leave a short replay log** | Who took the stage, how many rejections — line by line, replayable |
| **Only long projects keep checkpoints** | Cross-day long work uses checkpoint files; everyday short work doesn't |
| **Don't escalate when you shouldn't** | Forcing hard topology on simple questions or open research: the sensor blocks it |

Your felt experience: complex tasks are steadier, but it won't turn every conversation into a war room just to "look cutting-edge."

### Memory: four libraries

A default assistant's memory tends to mush into one pot. I split it into four, each tending its own:

| Library | Does what | Practical use |
|----|--------|----------|
| **Pitfall book** | Short lessons, recurrence fingerprints, gotchas | Check old accounts first for similar work |
| **Project ledger** | Cross-project accounts, priorities | At kickoff you know the global state of what to do |
| **Theme library** | UI specs, reusable demos | Frontend doesn't guess style from scratch; experiments can graduate into the library |
| **Wiki knowledge base** | Long-form source of truth; only one current version per topic | Research/manuals have a live copy, old versions go to history, trash goes to recycling |

Preferences have a separate list: how to report, how to decide, what is absolutely never done. Agents write back themselves; they don't ask "should I remember this?"

### Reporting spine (speaking to humans)

Each message is a work order. Conversations default to a real colleague.
When you say "like A, B," it first expands the category. When you want deep research, it gives mechanisms and copyable steps.

When delivering or closing out, **only tables; no summary sentence or end-repetition outside the table**. Five fixed blocks, in this order:

| Block | What to write |
|----|--------|
| **1 One-line result** | Done / the conclusion is / stuck where |
| **2 Human explanation** | What happened, how it was handled, what was explicitly not done |
| **3 Effect & self-verification** | What you'd feel + how you confirm yourself (merged; self-verification is click/refresh/listen/look, not a command wall) |
| **4 Next-step call** | If closable, say so; if not enough, write the full next step; if misaligned with the instruction, fix the plan first |
| **5 Checklist** | The agent's own verification ticks (QA / pitfall write-back / memory / long-form etc.), not "I understood" ticks for you |

Add blocks only when needed: where to open, where the full text is, pick this one, risk, sign-off, etc.
A plan ticket has only three responses: **do this / change the plan / hold for now**. "Do it" = the whole package, not a multi-select supermarket.

The top-level map only pins these five blocks; table-shape details and the add-on list live in the preference file, so the map doesn't bloat into a manual.

### Other capability surfaces

**External search**

| Tier | What it does |
|----|--------|
| **Shallow** | Small questions, few rounds, body text actually read |
| **Deep** | Big research, many rounds and angles, needs counter-evidence, conclusion lands as long-form |
| **Effect judge** | A new doc only replaces the old when it covers more; you can't declare yourself the only truth after writing |

New implementations, new approaches, stuck and need a trick: default to finding existing first (open source and community weighted high), only self-write if nothing fits, and write down what was searched and why it wasn't used.

**Safety**

Dangerous git, destructive deletes, direct key reads: system-level interception.
Credentials go through encrypted management, not fed whole into chat.
After a long conversation is compressed, key rules are re-injected.
At turn end, results can be pushed to a personal notification channel; away from the screen, you still see the summary.

**Remote & cross-session**

Remote messages and scheduled tasks are extended feelers, not a second main brain.
When there's no specific task at open, it reports the project radar instead of idly chatting.
Long projects have kickoff, handoff, and archive scaffolding; cross-session checkpoint resume works.
The local browser's multiple accounts stay in their lanes; if the bridge breaks, fix it before working.

**Design, demos, media**

Landing pages, in-project UI, design specs, and logo each have a dedicated entry; no cluedo mixing.
Engineering diagrams default to one full-screen diagram + one screen of explanation.
No topology → info cards.
Selection panels and tuning experiments only count as "in the library" once they actually enter the theme library.
Visual acceptance relies on screenshot/vision; a one-screen dashboard can't have large empty floor.
Image generation, local upscaling, voice-over, final cut, and video analysis have fixed entries.

**Self-evolution**

| Capability | Meaning |
|------|------|
| Recurring errors evolve | Same dumb mistake again → change the rule, not just apologize |
| Warning escalation | When you clearly warn / get angry, run at top spec, no on-the-spot fobbing |
| Recurrence-failing sensor | A rule with words isn't enough; it must leave a check that fails on recurrence |
| Harness-change comparison | Run a baseline before touching top rules / skills / hooks; check the numbers after |
| Rules have a writing door | Top rules have a writing spec; forbidden to pile into a prose junkyard |
| Skills have an entry | Building or major-editing a skill goes through a meta-flow; no hand-waving delivery |

## This repo

**Has**

- This public capability write-up
- A capability panorama map (`docs/harness-map.png`, 16:9)
- A theme hero (`assets/readme/hero.svg`)
- May later add desensitized templates, copyable checklists

**Doesn't have, and never will**

- API Keys, Cookies, Tokens, account pools
- Intranet addresses, private hostnames, customer info
- Config that directly connects to my production
- A "install this and you're as strong as me" magic script

The discipline is copyable. Your own pitfalls and muscle aren't.

## Quick start

Don't clone someone else's life. Add on top of the official extension points:

| Step | What to do |
|----|--------|
| 1 | Write a short, hard global `CLAUDE.md`: iron rules + routing table; don't stuff heavy flow in |
| 2 | Split repeating flows into skills (one each for delivery, search, evolution is enough to start) |
| 3 | Add one or two read-only subagents: QA, search |
| 4 | Weld shut your most-feared mistakes with hooks |
| 5 | At least split knowledge: short lessons vs long-form |
| 6 | Completion must have checkable evidence; self-reported completion is void |
| 7 | The second time the same error happens, must change a rule and leave a check that fails on recurrence |
| 8 | Fix the reporting spine to humans (result → explanation → self-verify → can-close → self-check list) |
| 9 | Write down when to split, when to debate, when to batch; multi-path parallelism must have a merged artifact |

Official docs:

- [Extend Claude Code](https://code.claude.com/docs/en/features-overview)
- [Memory / CLAUDE.md](https://code.claude.com/docs/en/memory)
- [Skills](https://code.claude.com/docs/en/skills)
- [Subagents](https://code.claude.com/docs/en/sub-agents)
- [Hooks](https://code.claude.com/docs/en/hooks-guide)
- [MCP](https://code.claude.com/docs/en/mcp)

**Who it's for**

People who use Claude Code long-term, want to publish their own workflow, and are interested in agent orchestration — you can take the layering thinking.
For the just-browsing crowd, the Architecture, Principles, and Quick-reference sections are enough.

Not for: those wanting a one-click installer, those wanting my keys and account pools, or anyone treating this as Anthropic's official docs. None of that is here.

## Table of contents

- [One-line value](#one-line-value)
- [Capability panorama](#capability-panorama)
- [Why it's different](#why-its-different)
- [Core methodology](#core-methodology)
  - [Architecture](#architecture)
  - [Delivery pipeline: five steps](#delivery-pipeline-five-steps)
  - [Wiring: five standing subagents](#wiring-five-standing-subagents)
  - [Orchestration (Graph thinking, no shell swap)](#orchestration-graph-thinking-no-shell-swap)
  - [Memory: four libraries](#memory-four-libraries)
  - [Reporting spine (speaking to humans)](#reporting-spine-speaking-to-humans)
  - [Other capability surfaces](#other-capability-surfaces)
- [This repo](#this-repo)
- [Quick start](#quick-start)
- [License & acknowledgements](#license--acknowledgements)

## License & acknowledgements

A public-notes repo, mainly this README and the map. Ideas are reproducible; private libraries aren't published.
This page aligns to two recent capability surfaces: orchestration discipline (split / merge / pipeline / checkpoint) and the reporting spine of five blocks. The map remains an overview sketch; this text is authoritative. I'll occasionally edit this when surfaces stabilize; no daily-update guarantee.

Text is quotable, ideas adaptable; citing the source is nicer.
This is not an Anthropic promise.
Don't paste private config into a public repo.

Built on [Claude Code](https://code.claude.com). Personal harness, public notes.
