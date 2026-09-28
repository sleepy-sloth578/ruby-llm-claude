# Lesson 1 — Your first LLM call

**Concept:** an LLM API call is just an HTTP request: you send a model
name and a prompt, and get back generated text. RubyLLM wraps that in
a small "chat" object so you don't touch raw HTTP payloads at all.

- **API key** — configured once via `RubyLLM.configure`, reading
  `ANTHROPIC_API_KEY` from a `.env` file (loaded by `dotenv`, never
  committed — see `.gitignore`).
- **Model** — `RubyLLM.chat(model: "claude-sonnet-5")` picks the model
  for that chat. Kept in `.env` under `MODEL` so it's easy to swap.
- **Sending a message** — `chat.ask("...")` sends a user message and
  returns a `RubyLLM::Message`. No need to build a `messages:` array
  by hand for a single turn — RubyLLM tracks conversation history on
  the `chat` object itself, so calling `chat.ask` again continues the
  same conversation.
- **Roles** — `chat.ask` is always the "user" turn; a "system" turn is
  set separately via `with_instructions` (Lesson 2); "assistant" turns
  are simply RubyLLM's own past responses, tracked automatically.
- **Response shape** — `response.content` is the plain text reply.
