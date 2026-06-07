---
id: 2026-06-08-promote-task-coord-projection-errors-to-auto-retry
kind: weekly
status: rejected
created: 2026-06-08
decided: 2026-06-08 (Michael)
target: "task-orchestrator retry config + task-queue-cleanup prompt"
goal: "hedge-fund"
change_type: "incremental"
confidence: 8
cost_line: "Negligible \u2014 retries only on error; 2 retries \u00d7 ~$0.012/fire = <$0.03 worst-case per error event"
---

# Promote task-coord-projection errors to auto-retry with backoff

**Goal advanced:** hedge-fund  ·  **Change type:** incremental

**Problem:** task-coord-projection fired errors on 2026-06-02 and 2026-06-03 (2 of its 60 fires = ~3.3% error rate) and is currently disabled in live_config — but the spend window shows 60 fires and $0.7446 cost, meaning it was active during the error period. The errors are silent: no alert, no retry, no compensating action. The queue_cleanup partial on 2026-06-05 may be downstream of stale queue state left by these failures.

**Evidence:** ops_7d.recent_failures: ['2026-06-02 task-coord-projection error', '2026-06-03 task-coord-projection error', '2026-06-05 queue_cleanup partial']; spend row task-coord-projection: fires=60, cost_usd=0.7446; task-coord-projection live_config status='disabled' (already off, so no change to the task itself — this proposal targets the error-handling pattern in the orchestrator's retry config for any task that logs 'error' status).

**Proposed change (PROPOSAL ONLY — not applied):** Add an exponential-backoff retry policy (max 2 retries, 5-min and 15-min delays) to the orchestrator's task-runner for any task that returns status='error'. This is a config-level change to the orchestrator retry parameters, not a change to any disabled task. Separately, investigate whether queue_cleanup partial on 2026-06-05 was caused by orphaned queue entries from the coord-projection errors and add a pre-cleanup orphan-sweep step.

**Target:** `task-orchestrator retry config + task-queue-cleanup prompt`

**Expected benefit:** Eliminates silent single-fire errors that currently leave queue state dirty; reduces the partial-cleanup failure rate; no new cost since retries only fire on error (rare). Estimated recovery of ~$0.025/week in wasted partial-run cost.

**Cost line:** Negligible — retries only on error; 2 retries × ~$0.012/fire = <$0.03 worst-case per error event

**Risk / reversibility:** Low. Retry is bounded (max 2). Reversible by removing the retry count from orchestrator config. No protected surface touched.

**Confidence:** 8/10

---
_Approve via Telegram: "approve cto proposal 2026-06-08-promote-task-coord-projection-errors-to-auto-retry". Promotion (applying the change) is a separate, deliberate step — the CTO never applies it._
