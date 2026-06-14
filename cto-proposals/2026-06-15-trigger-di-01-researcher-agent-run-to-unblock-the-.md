---
id: 2026-06-15-trigger-di-01-researcher-agent-run-to-unblock-the-
kind: weekly
status: proposed
created: 2026-06-15
target: "task-di-researcher (new task)"
goal: "deal-intelligence"
change_type: "step-change"
confidence: 8
cost_line: "Estimated ~$0.75\u20131.50/week incremental (Haiku for scrape/synthesis, Sonnet only for deck drafts). Current DI spend: $0."
---

# Trigger DI-01 researcher agent run to unblock the deal-intelligence workplan

**Goal advanced:** deal-intelligence  ·  **Change type:** step-change

**Problem:** The deal-intelligence goal has a plan-of-record (DI-01..05) and a stated gap of 2–5 decks/week, but the telemetry shows zero orchestrator tasks or scanner fires attributable to DI work this week. The orchestrator fired 27 times at $6.09 (43.5% of total spend) yet the DI workplan is stalled — Michael's own goal file flags 'Michael Phase-0 outstanding: fund-criteria docs, NBR + Capital Brief subs, SDK-credit claim' as blockers, but the system is not surfacing or advancing DI-01 autonomously.

**Evidence:** Orchestrator: 27 fires, $6.09, 43.5% of spend. No spend row for any DI-specific task. Goal file explicitly states DI-01 brief is 'ready to run'. Ops window shows 145 fires with no DI-labelled task in the spend rows.

**Proposed change (PROPOSAL ONLY — not applied):** Propose adding a dedicated 'task-di-researcher' scheduled task (e.g. weekday mornings, Haiku-class model for initial scraping/synthesis, escalating to Sonnet for deck drafts) that: (1) reads the DI workplan milestone state from the vault, (2) executes the next open DI-0x step autonomously, (3) writes a progress note back to the vault and flags any Michael-decision blockers to the morning briefing. This is a new task config entry — reversible by disabling the task.

**Target:** `task-di-researcher (new task)`

**Expected benefit:** Closes the largest goal gap in the system: moves deal-intelligence from 'plan exists, stalled' to 'self-running research cadence'. Even one researcher run per weekday at ~$0.15/fire = ~$0.75/week marginal cost against a target of 2–5 paying-client decks/week.

**Cost line:** Estimated ~$0.75–1.50/week incremental (Haiku for scrape/synthesis, Sonnet only for deck drafts). Current DI spend: $0.

**Risk / reversibility:** DI-01 may have Michael-decision prerequisites (fund-criteria docs) that block autonomous progress — mitigated by having the task surface blockers rather than stall silently. Reversible: disable task.

**Confidence:** 8/10

---
_Approve via Telegram: "approve cto proposal 2026-06-15-trigger-di-01-researcher-agent-run-to-unblock-the-". Promotion (applying the change) is a separate, deliberate step — the CTO never applies it._
