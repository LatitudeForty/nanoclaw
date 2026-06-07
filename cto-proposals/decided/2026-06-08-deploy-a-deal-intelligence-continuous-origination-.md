---
id: 2026-06-08-deploy-a-deal-intelligence-continuous-origination-
kind: weekly
status: rejected
created: 2026-06-08
decided: 2026-06-08 (Michael)
target: "New task-di-origination (haiku-4-5, 3\u00d7/day weekdays) + orchestrator queue trigger for deck generation"
goal: "deal-intelligence"
change_type: "step-change"
confidence: 7
cost_line: "~$1.50/week incremental (15 haiku fires at ~$0.10/fire); deck-gen subtasks via existing orchestrator budget"
---

# Deploy a Deal-Intelligence Continuous-Origination Agent (DI-01 execution) as a step-change toward 2–5 decks/week

**Goal advanced:** deal-intelligence  ·  **Change type:** step-change

**Problem:** The deal-intelligence goal has a plan-of-record (DI-01..05 workplan, 2026-06-06) and encoded fund criteria (Cheviot, HIIP, Arcadia placeholder) but zero active origination agents in the live_config scheduled_tasks list. The system currently has no task firing against NZBN registries, broker feeds, or NZ news to populate the Supabase KB. The gap between 'plan exists' and '2–5 decks/week' is entirely unbridged by any running agent. Meanwhile the orchestrator (21 fires, $5.62, 36.7% of spend) and strategist (4 fires, $2.96, 19.3%) are consuming 56% of weekly budget on coordination and strategy without a dedicated origination worker beneath them.

**Evidence:** live_config.scheduled_tasks: no task with id containing 'deal', 'di-', 'origination', or 'nzbn' has status='active'. spend_7d: task-orchestrator $5.6184 (36.7%) + task-strategist $2.9597 (19.3%) = $8.578 (56%) on coordination layers. active_goals deal-intelligence: 'DI-01 brief ready to run' — gap is execution, not planning. tech_watch thread 'technology/agent-platforms' fired at confidence 9.0 on 2026-06-08 and 2026-06-07 — agent platform tooling is maturing fast.

**Proposed change (PROPOSAL ONLY — not applied):** Propose a new scheduled task 'task-di-origination' running 3×/day on weekdays (08:00, 12:00, 17:00 NZST) on claude-haiku-4-5-20251001 (cheapest capable model, already proven in scanner at $1.24/week for 12 fires). The task: (1) pulls fresh NZBN registry changes, broker listing feeds, and NBR headlines; (2) scores each entity against Cheviot + HIIP fund criteria already encoded; (3) writes qualifying entities with evidence to the Supabase deal-intelligence KB; (4) when ≥3 qualifying entities accumulate for a fund, triggers a deck-generation subtask via the orchestrator queue. This directly executes DI-01 from the workplan. Reversible: disable the task in live_config.

**Target:** `New task-di-origination (haiku-4-5, 3×/day weekdays) + orchestrator queue trigger for deck generation`

**Expected benefit:** Closes the largest gap in the deal-intelligence goal: moves from 'plan exists' to 'agents actively originating'. At haiku pricing (~$0.10/fire estimated from scanner baseline), 15 fires/week = ~$1.50/week incremental cost. First deck output possible within days of activation. Directly advances the 2–5 decks/week target that is the goal's finish line.

**Cost line:** ~$1.50/week incremental (15 haiku fires at ~$0.10/fire); deck-gen subtasks via existing orchestrator budget

**Risk / reversibility:** Medium. Requires NZBN API access and feed configuration before first fire. Fund-criteria scoring quality depends on haiku capability — recommend a 2-week shadow run writing to KB without triggering deck generation, then promote. Reversible at any time by disabling the task.

**Confidence:** 7/10

---
_Approve via Telegram: "approve cto proposal 2026-06-08-deploy-a-deal-intelligence-continuous-origination-". Promotion (applying the change) is a separate, deliberate step — the CTO never applies it._
