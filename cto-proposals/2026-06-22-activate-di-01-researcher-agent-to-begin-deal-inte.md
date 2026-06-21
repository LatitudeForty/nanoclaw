---
id: 2026-06-22-activate-di-01-researcher-agent-to-begin-deal-inte
kind: weekly
status: proposed
created: 2026-06-22
target: "task-di-researcher (new task, claude-sonnet-4-6, 2x/week)"
goal: "deal-intelligence"
change_type: "step-change"
confidence: 8
cost_line: "+~$1.00/week incremental; offset partially by deal-flow value"
---

# Activate DI-01 Researcher Agent to Begin Deal-Intelligence Pipeline

**Goal advanced:** deal-intelligence  ·  **Change type:** step-change

**Problem:** The deal-intelligence goal has a live workplan (DI-01..05) and all infrastructure in place (Supabase, NZBN entity resolution, fund criteria encoded), but zero active agent tasks are running against it. The system is producing no deal flow — the gap between current state and the '2–5 decks/week' target is 100%. Meanwhile the orchestrator is firing 29 times/week at $4.75 and has capacity to drive this work.

**Evidence:** spend_7d shows no task-deal-intelligence or DI-series task in the spend rows. live_config.scheduled_tasks has no active DI task. The goal file states 'DI-01 brief ready to run' and 'Michael Phase-0 outstanding: fund-criteria docs, NBR + Capital Brief subs' — the brief is ready but nothing is executing it. Orchestrator fires 29x/week ($4.75, 44.4% of total spend) with cache-heavy pattern (10.28M cache_read_tokens) indicating it has headroom to drive sub-tasks.

**Proposed change (PROPOSAL ONLY — not applied):** Create and activate a new scheduled task 'task-di-researcher' running on claude-sonnet-4-6 at a cadence of 2x/week (e.g. 0 7 * * 2,4). Task prompt: execute DI-01 workplan step — scan NZ registries (NZBN), broker feeds, and news for companies matching Cheviot + HIIP fund criteria; write structured observations to the Supabase deal-intelligence KB; flag any candidate meeting ≥3 criteria for analyst follow-up. Reversible: disable the task if output quality is poor or cost exceeds $2/week.

**Target:** `task-di-researcher (new task, claude-sonnet-4-6, 2x/week)`

**Expected benefit:** Begins closing the 100% gap on the deal-intelligence goal. First structured deal observations in KB within one week. Estimated cost ~$0.80–1.20/week based on comparable task-wa-mining-universe-review ($0.40/fire on sonnet-4-6 with cache).

**Cost line:** +~$1.00/week incremental; offset partially by deal-flow value

**Risk / reversibility:** Output quality depends on prompt quality for DI-01 brief — low risk since task is reversible and Michael can review first outputs before promoting to higher cadence.

**Confidence:** 8/10

---
_Approve via Telegram: "approve cto proposal 2026-06-22-activate-di-01-researcher-agent-to-begin-deal-inte". Promotion (applying the change) is a separate, deliberate step — the CTO never applies it._
