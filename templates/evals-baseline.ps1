# evals-baseline.ps1 — self-check harness template (PowerShell)

> Copy into `evals/` of your agent repo and replace the `P0x` assertions with your own
> golden assertions over your own rules. The mechanics are the durable part:
>
> 1. each P0x is a pure assertion over files on disk — zero side effects, no network;
> 2. you snapshot a `baseline-<timestamp>.json` **before** a rule change,
>    re-run for a `delta`, and diff the two — `fail>0` or `pass` count dropping = regression;
> 3. size guard: P0x #02 keeps the core rules file under a hard byte/line budget so the
>    thing stays a *map*, not a manual.
>
> Run: `pwsh -NoProfile -File ./evals/run.ps1` (full) or `-Quick` (core subset).

param([switch]$Quick)

$ErrorActionPreference = 'Stop'
$root      = Split-Path $PSScriptRoot -Parent
$rules     = Join-Path $root 'AGENTS.md'
$stamp     = Get-Date -Format 'yyyyMMddHHmmss'
$outDir    = Join-Path $PSScriptRoot 'results'
New-Item -Path $outDir -ItemType Directory -Force | Out-Null
$out       = Join-Path $outDir "baseline-$stamp.json"

# --- assertions: replace these with your own golden checks --------------------
function P01_RulesFileExists { Test-Path $rules }
function P02_CoreFileUnderBudget {
    # the discipline: a core rules file must stay a short *map*, not a manual
    $b = (Get-Content $rules -Raw).Length
    $l = (Get-Content $rules | Measure-Object -Line).Lines
    ($b -lt 20480) -and ($l -le 150)
}
function P03_NoTombstoneDontX {
    # deleting a rule means the sentence vanishes; "don't do X" tombstones are banned
    -not (Select-String -Path $rules -Pattern '不要.{0,6}\b|(?<=）)不要|^-\s不要' -Quiet)
}
function P04_AnchorBySectionNameNotNumber {
    # references to rules use section names, never §N chapter numbers
    -not (Select-String -Path $rules -Pattern '§\d' -Quiet)
}
function P05_DeliverySpineFiveBlocks {
    (Select-String -Path $rules -Pattern '🎯.*🧩.*✅.*👉.*📋' -Quiet) -or `
    (Select-String -Path $rules -Pattern '🎯' -Quiet)
}
# ... add P06..PNN over your own files. Keep each assertion pure and side-effect free.

$checks = if ($Quick) { 1..5 } else { 1..5 }   # extend to your PNN
$results = foreach ($i in $checks) {
    $name = "P{0:D2}" -f $i
    $fn   = Get-ChildItem "function:P${i}_*" -ErrorAction SilentlyContinue
    $ok   = if ($fn) { & $fn.Name } else { $false }
    [pscustomobject]@{ id = $name; pass = [bool]$ok }
}

$summary = [pscustomobject]@{
    ts      = $stamp
    pass    = ($results | Where-Object pass).Count
    fail    = ($results | Where-Object { -not $_.pass }).Count
    total   = $results.Count
    results = $results
}
$summary | ConvertTo-Json -Depth 4 | Set-Content $out

Write-Host "omp evals$($Quick ? ' quick' : ' full'): pass=$($summary.pass) fail=$($summary.fail) total=$($summary.total)"
Write-Host "snapshot: $out"

if ($summary.fail -gt 0) { exit 1 }

# --- delta helper: diff the two latest snapshots -----------------------------
# After a rule change:
#   $pre  = Get-Content results/baseline-<before-stamp>.json | ConvertFrom-Json
#   $post = Get-Content results/baseline-<after-stamp>.json  | ConvertFrom-Json
#   Compare-Object $pre.results ($post.results) -Property id,pass
# A diff (pass flipped, or /pass count dropped) = regression. The change is not done.
