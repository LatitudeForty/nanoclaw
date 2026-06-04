---
id: 2026-06-04-schedule-a-structured-eval-of-gemma-4-12b-as-a-loc
kind: weekly
status: proposed
created: 2026-06-04
target: "task-scanner, task-dossier-sync (eval only, no live change)"
confidence: 7
cost_line: "task-scanner + task-dossier-sync \u00b7 claude-haiku-4-5-20251001 \u2014 $10.21/week combined"
---

# Schedule a structured eval of Gemma 4 12B as a local/cheap replacement for Haiku on high-volume low-complexity tasks

**Problem:** tech-watch has flagged Gemma 4 12B (confidence 9.0, 2026-06-04) as an open-weights multimodal candidate. The fleet's three highest-cost lines — scanner ($5.90), dossier-sync ($4.30), heartbeat ($3.45) — all run on claude-haiku-4-5 and together account for 68.3% of weekly spend ($13.65/week). These are high-volume, structured-output tasks that are strong candidates for a cheaper model if quality holds.

**Evidence:** tech_watch.pending_model_releases: Gemma 4 12B, Google, 2026-06-04, confidence 9.0, 'open-weights, candidate for local eval vs. Claude/Llama'. Top three Haiku tasks: scanner $5.90 + dossier-sync $4.30 + heartbeat $3.45 = $13.65/week = 68.3% of $19.98 total. Existing Gemini Flash Lite eval tasks (task-md-flashlite-test, task-ms-flashlite-test, task-qc-flashlite-test) show the eval harness already exists.

**Proposed change (PROPOSAL ONLY — not applied):** Using the existing flashlite-test eval harness as a template, create a task-gemma4-12b-test that runs Gemma 4 12B (via Ollama locally or OpenRouter) against a representative sample of scanner and dossier-sync prompts. Score outputs on: (a) structured JSON validity, (b) recall of key entities vs. Haiku baseline, (c) latency, (d) cost per fire. Run for one week in shadow mode (no live routing). If quality parity is confirmed, propose a phased migration starting with dossier-sync (most repetitive, lowest risk).

**Target:** `task-scanner, task-dossier-sync (eval only, no live change)`

**Expected benefit:** If Gemma 4 12B matches Haiku quality on these tasks, open-weights local inference could reduce the $13.65/week Haiku spend by 60–80%, saving $8–11/week (~$500/year). Even a partial migration of dossier-sync alone saves ~$3–4/week.

**Cost line:** task-scanner + task-dossier-sync · claude-haiku-4-5-20251001 — $10.21/week combined

**Risk / reversibility:** Low — eval is shadow-mode only, no live routing changes. Existing eval harness reduces build effort. Revert is trivially 'do not migrate'.

**Confidence:** 7/10

---
_Approve via Telegram: "approve cto proposal 2026-06-04-schedule-a-structured-eval-of-gemma-4-12b-as-a-loc". Promotion (applying the change) is a separate, deliberate step — the CTO never applies it._
