---
id: 2026-06-22-promote-pending-dcf-gate-decisions-to-unblock-watc
kind: weekly
status: proposed
created: 2026-06-22
target: "task-orchestrator prompt (add weekly DCF gate brief generation)"
goal: "hedge-fund"
change_type: "incremental"
confidence: 9
cost_line: "~$0.02/week incremental (negligible)"
---

# Promote Pending DCF Gate Decisions to Unblock Watchlist Completion

**Goal advanced:** hedge-fund  ·  **Change type:** incremental

**Problem:** Five provisional DCFs (MRVL, TSLA, COHR, APH, KLAC, ASML, ETN) are sitting in 'awaiting Michael's explicit promotion approval' state. The hedge-fund goal milestone #1 is 'all 10 watchlist names DCF-modelled' and milestone #2 is 'proactive idea flow from the system.' Neither milestone can close while gate decisions are queued. The auto-DCF pipeline is running ($0.16/week, 7 fires) but its output is accumulating without being actioned.

**Evidence:** spend_7d shows task-auto-valuation fired 7x at $0.1576 (1.5% of spend) — the pipeline is healthy and producing. The goal file lists MRVL (FV USD 82.34/gate USD 69.99), TSLA (FV USD 84.22/gate USD 71.59), COHR (FV USD 100.94/gate USD 85.80), APH (FV USD 82.04/gate USD 69.73), KLAC (FV USD 672.86/gate USD 571.93), ASML (FV USD 886.85/gate USD 753.82), ETN (FV USD 228.25/gate USD 194.01) — all explicitly flagged 'awaiting Michael's explicit promotion approval.' ops_7d shows 1 amber status, consistent with stalled decision queue.

**Proposed change (PROPOSAL ONLY — not applied):** Configure task-orchestrator to generate a consolidated 'DCF Gate Decision Brief' once per week (Sunday, before task-reflector fires) that presents all pending provisional DCFs in a single structured table: name, FV, gate price, current price vs gate, and a recommended YES/NO/HOLD with one-line rationale. Deliver to morning-briefing channel. This converts a scattered approval queue into a single weekly decision moment for Michael. Reversible: remove the brief template from orchestrator prompt if not useful.

**Target:** `task-orchestrator prompt (add weekly DCF gate brief generation)`

**Expected benefit:** Clears the 7-name approval backlog within one week. Unblocks hedge-fund milestones #1 and #2. No new cost — orchestrator already fires Sunday at existing cadence; this adds ~500 tokens_out per fire (~$0.02 incremental).

**Cost line:** ~$0.02/week incremental (negligible)

**Risk / reversibility:** Low — Michael retains all approval authority; the brief only consolidates existing information. No automated gate promotion.

**Confidence:** 9/10

---
_Approve via Telegram: "approve cto proposal 2026-06-22-promote-pending-dcf-gate-decisions-to-unblock-watc". Promotion (applying the change) is a separate, deliberate step — the CTO never applies it._
