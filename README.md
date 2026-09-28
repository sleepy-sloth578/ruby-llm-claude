# ruby-llm-claude

A set of small, self-contained lessons for calling Claude from Ruby using
the [`ruby_llm`](https://rubygems.org/gems/ruby_llm) gem — each one is a
runnable `main.rb` plus `notes.md` explaining the concept it covers.

## Contents

| Lesson | Covers |
| --- | --- |
| [`01-llm-call`](01-llm-call) | Your first LLM call: API key setup, picking a model, sending a message |
| [`02-tokens`](02-tokens) | System prompt (`with_instructions`), temperature, and reading token usage off a response |
| [`03-structured-output`](03-structured-output) | Forcing a structured JSON response with `Schematist::Schema` / `with_schema` |
| [`04-resume-matcher`](04-resume-matcher) | Mini project: attach a resume file (PDF/DOCX) + a job description, get back a structured match score |
| [`05-prompt-engineering`](05-prompt-engineering) | Structuring a prompt with role, task, constraints, output format, few-shot example, and fallback |
| [`06-react`](06-react) | ReAct loop (reasoning + tool calls) using RubyLLM's built-in tool-calling support |

`setup.rb` at the repo root loads `dotenv` and configures `RubyLLM` with
your Anthropic API key; every lesson's `main.rb` starts with `require
'./setup.rb'`.

## Setup

1. Install dependencies:
   ```bash
   bundle install
   ```
2. Copy `.env.example` to `.env` and fill in your key:
   ```bash
   cp .env.example .env
   ```
   ```
   ANTHROPIC_API_KEY=your_key_here
   MODEL=claude-sonnet-5
   ```

## Running a lesson

Run any lesson's `main.rb` from the repo root:

```bash
ruby 01-llm-call/main.rb
ruby 02-tokens/main.rb
ruby 03-structured-output/main.rb
ruby 05-prompt-engineering/main.rb
ruby 06-react/main.rb
```

`04-resume-matcher` takes two file arguments — a resume and a job
description:

```bash
ruby 04-resume-matcher/main.rb path/to/resume.pdf path/to/job_description.txt
```
