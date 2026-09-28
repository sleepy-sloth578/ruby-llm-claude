# Lesson 6 — Prompt engineering

**Concept:** a good prompt isn't one clever sentence — it's a small
spec. Breaking it into named parts makes it easier to write, debug,
and reuse.

- **Role** — who the model is playing ("senior Ruby code reviewer").
  Sets vocabulary and default assumptions.
- **Task** — the one thing it should do, stated as an instruction, not
  a question.
- **Constraints** — guardrails: what not to do, how much to say, how
  to handle uncertainty. This is where most prompt bugs get fixed.
- **Output format** — an explicit shape (numbered list, specific
  string pattern) so downstream code can rely on it without another
  structured-output round-trip.
- **Few-shot example** — one worked example inside the prompt anchors
  the model's output format far more reliably than description alone.
- **Fallback** — an explicit instruction for the "this doesn't apply"
  case, so the model doesn't hallucinate an answer when the input is
  out of scope.
