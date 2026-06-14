---
id: 2026-06-15-promote-pending-watchlist-dcfs-to-gates-via-an-aut
kind: weekly
status: proposed
created: 2026-06-15
target: "task-orchestrator prompt extension OR new task-gate-promoter (weekly, Haiku)"
goal: "hedge-fund"
change_type: "incremental"
confidence: 9
cost_line: "~$0.05/week incremental. Current blocking cost: orchestrator cycles spent on stale provisional state."
---

# Promote pending watchlist DCFs to gates via an automated gate-promotion proposal task

**Goal advanced:** hedge-fund  ·  **Change type:** incremental

**Problem:** Five new provisional DCFs fired this week (COHR, APH, KLAC, ASML, ETN) plus MRVL and TSLA are all sitting 'awaiting Michael's explicit promotion approval'. The hedge-fund goal milestone 1 is 'all 10 watchlist names DCF-modelled' and milestone 2 is 'proactive idea flow'. The system is generating valuations but they are pooling without a structured promotion workflow, creating a decision backlog for Michael.

**Evidence:** Goal file lists 7 names with provisional DCFs awaiting promotion. Orchestrator fired 27 times ($6.09) this week — no evidence of a gate-promotion summary being surfaced. task-wa-mining-universe-review fired once ($0.42). task-auto-valuation fired 6 times ($0.16) confirming the DCF pipeline is running.

**Proposed change (PROPOSAL ONLY — not applied):** Propose configuring the existing task-orchestrator (or a lightweight new 'task-gate-promoter' Haiku task, weekly) to: (1) read all provisional DCFs from the vault, (2) generate a single consolidated 'Gate Promotion Memo' listing each name, FV, gate price, current price vs gate, and a one-line promote/hold/reject recommendation, (3) deliver it to Michael via Telegram/morning briefing for a single batch decision. Reversible: remove the gate-promoter prompt or disable the task.

**Target:** `task-orchestrator prompt extension OR new task-gate-promoter (weekly, Haiku)`

**Expected benefit:** Clears the 7-name promotion backlog in one Michael decision session. Advances hedge-fund milestone 1 (all names modelled+gated) and milestone 2 (proactive idea flow from system). Marginal cost ~$0.05/week (Haiku, small context).

**Cost line:** ~$0.05/week incremental. Current blocking cost: orchestrator cycles spent on stale provisional state.

**Risk / reversibility:** Michael may prefer to review each DCF individually — mitigated by making the memo opt-in and keeping individual DCF files unchanged. Low risk.

**Confidence:** 9/10

---
_Approve via Telegram: "approve cto proposal 2026-06-15-promote-pending-watchlist-dcfs-to-gates-via-an-aut". Promotion (applying the change) is a separate, deliberate step — the CTO never applies it._
