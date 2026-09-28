# Lesson 2 — System role + temperature

**Concept:** two levers that shape *how* the model answers, independent
of what you ask.

- **System prompt** — `chat.with_instructions("...")` sets the
  persona/tone/constraints for that chat. It's chainable and can be
  called before any `ask`.
- **Temperature** — `chat.with_temperature(0.0..1.0)` controls sampling
  randomness. `0` is near-deterministic and best for factual/coding
  tasks; higher values (`0.7`–`1.0`) add variety, useful for
  brainstorming or creative writing.
- Both methods return `self`, so they chain:
  `chat.with_instructions("...").with_temperature(0.7).ask("...")`.

