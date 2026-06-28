---
id: 2026-06-29-wire-tech-watch-quant-practice-signals-directly-in
kind: weekly
status: proposed
created: 2026-06-29
target: "task-hedge-fund-driver prompt extension (or new task-hf-kb-sync)"
goal: "hedge-fund"
change_type: "step-change"
confidence: 8
cost_line: "Marginal ~$0.35\u2013$0.70/week if new haiku task; ~$0 if prompt extension to existing task"
---

# Wire tech-watch quant-practice signals directly into hedge-fund KB: close the loop between observation and analyst action

**Goal advanced:** hedge-fund  ·  **Change type:** step-change

**Problem:** tech-watch is firing high-confidence quant-practice observations (confidence 9.0 on 2026-06-28, confidence 8.0 on 2026-06-27) but there is no active task that reads these signals and routes them into the hedge-fund knowledge base or triggers an analyst action. The hedge-fund goal explicitly requires 'Researchers keep the KB current from daily flow' and 'Proactive idea flow — recommendations originating from the system'. Currently the quant-practice thread produces observations that expire unread unless the orchestrator happens to pick them up.

**Evidence:** tech_watch.recent_observations: technology/quant-practice fired 2026-06-28 confidence:9.0 and 2026-06-27 confidence:8.0. spend_7d: task-tech-watch fires 7×/week at $0.147 but task-hedge-fund-driver fires only 1×/week at $0.059 — the ratio implies tech-watch output is not being consumed at the same cadence it is produced. Goal file: '10 watchlist names DCF-modelled' and 'Proactive idea flow' are the open milestones.

**Proposed change (PROPOSAL ONLY — not applied):** Extend task-hedge-fund-driver (or create a lightweight 'task-hf-kb-sync' running daily on haiku) with an explicit instruction to: (1) pull any new tech-watch observations from threads quant-practice, ai-tech-investment, and tesla-ev since last run; (2) assess each for watchlist relevance (new name to screen, thesis update for existing name, or algorithm signal); (3) write a structured note to the hedge-fund KB namespace with a recommended action (add to screen queue, update DCF assumption, or discard with reason). This closes the observation→action loop that the goal file requires.

**Target:** `task-hedge-fund-driver prompt extension (or new task-hf-kb-sync)`

**Expected benefit:** Converts 7 weekly tech-watch fires from passive observation into active KB updates. Directly advances 'Proactive idea flow' milestone. Marginal cost: ~$0.05–$0.10/day on haiku if new task, or near-zero if added to existing hedge-fund-driver prompt. Compounding benefit: KB grows with each market cycle, reducing future research cost.

**Cost line:** Marginal ~$0.35–$0.70/week if new haiku task; ~$0 if prompt extension to existing task

**Risk / reversibility:** Low — reversible. Risk is signal noise if quant-practice observations are low-quality; mitigated by having the agent explicitly score relevance before writing to KB.

**Confidence:** 8/10

---
_Approve via Telegram: "approve cto proposal 2026-06-29-wire-tech-watch-quant-practice-signals-directly-in". Promotion (applying the change) is a separate, deliberate step — the CTO never applies it._
