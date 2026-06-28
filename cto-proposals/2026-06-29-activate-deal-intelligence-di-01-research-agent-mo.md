---
id: 2026-06-29-activate-deal-intelligence-di-01-research-agent-mo
kind: weekly
status: proposed
created: 2026-06-29
target: "new task-di-driver (to be created)"
goal: "deal-intelligence"
change_type: "step-change"
confidence: 9
cost_line: "New spend ~$0.42\u2013$0.70/week on claude-haiku-4-5-20251001"
---

# Activate deal-intelligence DI-01 research agent: move from plan-of-record to first running agent

**Goal advanced:** deal-intelligence  ·  **Change type:** step-change

**Problem:** The deal-intelligence goal has a live workplan (DI-01..05 sequenced, DI-01 brief ready to run) but zero active scheduled tasks driving it. The orchestrator fires 29×/week and the hedge-fund-driver fires 1×/week, but there is no DI-specific driver task in the active task list. The goal file explicitly flags Michael Phase-0 items outstanding (fund-criteria docs, NBR + Capital Brief subs) and notes the driver duty is to keep DI-01..05 moving. The system is not moving them.

**Evidence:** live_config.scheduled_tasks: no active task with 'deal-intelligence', 'di-', or 'origination' in its id. task-hedge-fund-driver fires 1×/week ($0.059). spend_7d shows zero DI-specific agent spend. Goal file: 'DI-01 brief ready to run' and 'Michael Phase-0 outstanding: fund-criteria docs, NBR + Capital Brief subs, SDK-credit claim'. ops_7d: 104 fires total, none attributable to DI pipeline.

**Proposed change (PROPOSAL ONLY — not applied):** Create and activate a new scheduled task 'task-di-driver' running on a weekday cadence (e.g. 0 7 * * 1-5) using claude-haiku-4-5-20251001 (SWITCH-ELIGIBLE per 2026-06-04 eval, verdict: passed 10/11). The task's mandate: (1) read the DI workplan and current milestone state; (2) identify the next concrete action on DI-01 (NZBN registry scan, broker feed ingestion, or entity-resolution run); (3) either execute it directly or queue a sub-task for the orchestrator. This mirrors the pattern already working for hedge-fund-driver and drone-reforestation-driver.

**Target:** `new task-di-driver (to be created)`

**Expected benefit:** Closes the largest active goal gap: deal-intelligence has a ready workplan and zero execution. Even one DI-01 completion per week moves toward the 2–5 decks/week target. Estimated cost: ~$0.06–$0.10/day (haiku rate, similar to hedge-fund-driver at $0.059/fire), ~$0.42–$0.70/week — well within budget given the $1.70+ savings from Proposal 1.

**Cost line:** New spend ~$0.42–$0.70/week on claude-haiku-4-5-20251001

**Risk / reversibility:** Low — reversible by disabling the task. Risk is the agent stalls on Michael's Phase-0 blockers (fund-criteria docs); mitigated by having the driver explicitly surface those blockers in its output rather than silently waiting.

**Confidence:** 9/10

---
_Approve via Telegram: "approve cto proposal 2026-06-29-activate-deal-intelligence-di-01-research-agent-mo". Promotion (applying the change) is a separate, deliberate step — the CTO never applies it._
