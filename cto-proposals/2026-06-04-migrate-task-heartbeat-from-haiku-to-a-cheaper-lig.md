---
id: 2026-06-04-migrate-task-heartbeat-from-haiku-to-a-cheaper-lig
kind: weekly
status: proposed
created: 2026-06-04
target: "task-heartbeat"
confidence: 8
cost_line: "task-heartbeat \u00b7 claude-haiku-4-5-20251001 \u2014 $3.4474/week, 17.3% of total"
---

# Migrate task-heartbeat from Haiku to a cheaper/lighter model or reduce fire frequency

**Problem:** task-heartbeat is the highest-fire task (114 fires, 17.3% of total spend at $3.4474/week) yet its function is purely a liveness/status check. It is generating 253,690 output tokens across those fires — an average of ~2,225 tokens per heartbeat — which is high for a task that should be emitting a short structured status.

**Evidence:** spend_7d row: task-heartbeat · claude-haiku-4-5-20251001 — 114 fires, 253,690 tokens_out, $3.4474, 17.3% of total. At 114 fires over 7 days that is ~16 fires/day. Output token average of 2,225/fire is anomalously high for a heartbeat.

**Proposed change (PROPOSAL ONLY — not applied):** Two-part proposal (implement either or both): (1) Audit the heartbeat prompt — if it is generating verbose narrative output, tighten the system prompt to enforce a short structured JSON response (target <200 tokens out). This alone could cut output tokens by ~90%, saving ~$3/week with zero quality loss on a status-check task. (2) If the heartbeat is firing every ~90 minutes, evaluate whether every-3-hour cadence is sufficient given the orchestrator also runs. Halving fire frequency would halve cost independently of the prompt fix.

**Target:** `task-heartbeat`

**Expected benefit:** Estimated $2.50–$3.00/week saving (up to 87% reduction on this line) with no functional degradation — heartbeat output is consumed by the health monitor, not by Michael directly.

**Cost line:** task-heartbeat · claude-haiku-4-5-20251001 — $3.4474/week, 17.3% of total

**Risk / reversibility:** Low-medium. Prompt tightening is fully reversible. Cadence reduction carries a small risk of slower anomaly detection; mitigated by the orchestrator's independent run schedule.

**Confidence:** 8/10

---
_Approve via Telegram: "approve cto proposal 2026-06-04-migrate-task-heartbeat-from-haiku-to-a-cheaper-lig". Promotion (applying the change) is a separate, deliberate step — the CTO never applies it._
