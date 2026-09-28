# Lesson 3 — Structured output

**Concept:** free-text model output is unreliable to parse. Forcing
the model to fill in a strict schema makes the response predictable
enough to feed straight into your program.

- **`RubyLLM::Schema`** — a small DSL for declaring the shape you
  want, RubyLLM's closest equivalent to a Pydantic `BaseModel`:
  `string :name`, `integer :years_experience`, `array :x, of: :string`,
  and so on.
- **`chat.with_schema(YourSchema)`** — tells RubyLLM to constrain the
  next response to that shape. Under the hood this still uses
  Anthropic's tool-use mechanism (a forced tool call with a JSON
  schema as its input), but you never see that machinery.
- **Result:** `response.content` comes back as an already-parsed Hash
  matching the schema — no manual JSON parsing, no digging through a
  `tool_use` content block.
- **Validation:** the schema guarantees types and required fields at
  the API level; a quick Ruby-side check (as in `main.rb`) is still
  cheap insurance. For anything more elaborate than presence checks,
  `dry-struct` / `dry-schema` remain a good option for coercion and
  richer validation rules.

