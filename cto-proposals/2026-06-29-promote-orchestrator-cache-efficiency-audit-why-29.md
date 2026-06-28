---
id: 2026-06-29-promote-orchestrator-cache-efficiency-audit-why-29
kind: weekly
status: proposed
created: 2026-06-29
target: "task-orchestrator context bundle / system prompt"
goal: "north-star"
change_type: "incremental"
confidence: 8
cost_line: "task-orchestrator \u00b7 claude-sonnet-4-6 ($5.79/wk, 72.3% of total)"
---

# Promote orchestrator cache efficiency: audit why 29 fires consume 12M cache-read tokens at 72% of total spend

**Goal advanced:** north-star  ·  **Change type:** incremental

**Problem:** task-orchestrator is consuming $5.79 of the $8.01 weekly spend (72.3%) driven almost entirely by 12,097,171 cache-read tokens across 29 fires. At ~$0.30/MTok cache-read rate this is the dominant cost lever. The context being cached may be oversized, stale, or include data that could be summarised before injection.

**Evidence:** spend_7d row: task-orchestrator · claude-sonnet-4-6 — fires: 29, cache_read_tokens: 12,097,171, cost_usd: $5.7896, pct_of_total: 72.3%. Next largest is task-reflector at $0.63 (7.9%). Orchestrator is 9× the next item.

**Proposed change (PROPOSAL ONLY — not applied):** Audit the orchestrator system prompt and context bundle injected each fire. Specifically: (1) identify any large static knowledge blocks (KB snapshots, full goal files, full workplan docs) that could be replaced with a compressed summary or pointer; (2) measure whether the 12M cache-read tokens are genuinely necessary for output quality or are artefacts of over-broad context inclusion; (3) propose a trimmed context profile that keeps goal-critical content but drops low-signal bulk. Target: reduce cache-read tokens by 30–50% without degrading orchestrator output quality, saving ~$1.70–$2.90/week (~$90–$150/year).

**Target:** `task-orchestrator context bundle / system prompt`

**Expected benefit:** $1.70–$2.90/week cost reduction (~21–36% of total system spend) with no quality loss if trim is done carefully. Frees budget headroom for step-change work.

**Cost line:** task-orchestrator · claude-sonnet-4-6 ($5.79/wk, 72.3% of total)

**Risk / reversibility:** Low — reversible by restoring prior context bundle. Risk is output quality degradation if critical context is trimmed; mitigated by A/B comparison before committing.

**Confidence:** 8/10

---
_Approve via Telegram: "approve cto proposal 2026-06-29-promote-orchestrator-cache-efficiency-audit-why-29". Promotion (applying the change) is a separate, deliberate step — the CTO never applies it._
