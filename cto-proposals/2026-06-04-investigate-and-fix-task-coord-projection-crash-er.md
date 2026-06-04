---
id: 2026-06-04-investigate-and-fix-task-coord-projection-crash-er
kind: weekly
status: proposed
created: 2026-06-04
target: "task-coord-projection"
confidence: 9
cost_line: "task-coord-projection \u00b7 claude-haiku-4-5-20251001 \u2014 $0.8669/week, 68 fires"
---

# Investigate and fix task-coord-projection crash/error pattern

**Problem:** task-coord-projection has 5 recorded failures in the ops log (3x partial on 2026-05-28, 2x error on 2026-06-02 and 2026-06-03), making it the single most failure-prone task this week. The health dashboard is amber, with task_drift flagged.

**Evidence:** ops_7d.recent_failures shows all 5 entries are task-coord-projection: ['2026-05-28 partial', '2026-05-28 partial', '2026-05-28 partial', '2026-06-02 error', '2026-06-03 error']. Overall health is amber. The task also spent $0.8669 (4.3% of total) across 68 fires, meaning a non-trivial fraction of those fires are producing bad output.

**Proposed change (PROPOSAL ONLY — not applied):** Pull the full stderr/stdout logs for the 5 failed runs. Identify whether failures are: (a) upstream data unavailability, (b) prompt/context issues, or (c) a code regression introduced around 2026-05-28. Add a structured error-type field to the task's output so future failures are self-classifying. If root cause is a code regression, revert to the last known-good version. If upstream data, add a graceful no-data exit path that logs 'no_signal' instead of 'error'/'partial'.

**Target:** `task-coord-projection`

**Expected benefit:** Eliminates the amber health signal, stops silent partial outputs that may be feeding bad data downstream, and reduces wasted spend on failed runs.

**Cost line:** task-coord-projection · claude-haiku-4-5-20251001 — $0.8669/week, 68 fires

**Risk / reversibility:** Low. Diagnosis is read-only; any fix is a targeted code change to a single task with no cross-task dependencies implied by the telemetry.

**Confidence:** 9/10

---
_Approve via Telegram: "approve cto proposal 2026-06-04-investigate-and-fix-task-coord-projection-crash-er". Promotion (applying the change) is a separate, deliberate step — the CTO never applies it._
