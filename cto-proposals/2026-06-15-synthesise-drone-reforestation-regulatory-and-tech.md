---
id: 2026-06-15-synthesise-drone-reforestation-regulatory-and-tech
kind: weekly
status: proposed
created: 2026-06-15
target: "task-drone-constraint-synthesis (new one-shot task, Sonnet)"
goal: "drone-reforestation"
change_type: "step-change"
confidence: 8
cost_line: "~$0.40\u20130.60 one-time. Ongoing: $0 (task self-disables after one fire)."
---

# Synthesise drone-reforestation regulatory and technology findings into a constraint register to unblock M1 workplan

**Goal advanced:** drone-reforestation  ·  **Change type:** step-change

**Problem:** The drone-reforestation goal has two completed deep-dives (regulatory-nz.md CAA deep-dive; technology-landscape.md with Envico Technologies finding) but the goal file explicitly states the CAA content is 'not yet synthesised into constraint register' and the workplan M1–M6 critical path has not been resolved. The system is watching the space (tech-watch drones-lidar-reforestation thread fired at confidence 7 this week) but not advancing the workplan.

**Evidence:** Goal file: 'drone-reforestation/regulatory-nz.md filed — content not yet synthesised into constraint register.' Technology-landscape.md complete but gap list (revenue mechanics, decision pack) open. Tech-watch thread 'technology/drones-lidar-reforestation' fired 2026-06-15 at confidence 7. task-strategist is active (fires on 1st and 15th, claude-opus-4-8) but no drone-reforestation spend row appears in the 7-day window.

**Proposed change (PROPOSAL ONLY — not applied):** Propose a one-shot 'task-drone-constraint-synthesis' Sonnet task (fires once, then self-disables or is manually disabled) that: (1) reads regulatory-nz.md + technology-landscape.md from the vault, (2) produces a structured constraint register (regulatory ceilings, survival-rate data, capability gaps, open questions), (3) writes it to drone-reforestation/constraint-register.md, and (4) appends a 'next decision required' note to the workplan. This directly advances M1 (workplan critical path) and M2 (technology landscape map). Reversible: the output file can be deleted; the task fires once.

**Target:** `task-drone-constraint-synthesis (new one-shot task, Sonnet)`

**Expected benefit:** Converts two completed research artefacts into an actionable constraint register, unblocking M1–M3 of the workplan. Estimated cost: ~$0.40–0.60 for one Sonnet run over two medium-length vault documents. Closes the explicit gap flagged in the goal file.

**Cost line:** ~$0.40–0.60 one-time. Ongoing: $0 (task self-disables after one fire).

**Risk / reversibility:** Output quality depends on vault document completeness — mitigated by having the task flag any gaps it cannot resolve. One-shot so no runaway cost risk.

**Confidence:** 8/10

---
_Approve via Telegram: "approve cto proposal 2026-06-15-synthesise-drone-reforestation-regulatory-and-tech". Promotion (applying the change) is a separate, deliberate step — the CTO never applies it._
