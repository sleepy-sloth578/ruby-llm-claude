# Lesson 6 — Prompt engineering
#
# Covers: role, task, constraints, output format, few-shot examples,
# and a fallback instruction, all in one structured prompt.

require './setup.rb'

system_prompt = <<~SYS
  You are a senior Ruby code reviewer.

  Task: given a snippet of Ruby code, point out at most 3 concrete
  issues (bugs, style, performance) and suggest a fix for each.

  Constraints:
  - Be specific: cite line-like context, not vague advice.
  - Never invent issues that aren't in the code.
  - If the code has no real issues, say so plainly instead of padding
    the list.

  Output format: a numbered list, one issue per line, each formatted as
  "Issue: ... -> Fix: ...".

  Few-shot example:
  Code: `def add(a, b); a+b; end`
  Response:
  1. Issue: no space around `+` operator, hurts readability -> Fix: `a + b`

  Fallback: if the input isn't valid Ruby code at all, respond with
  exactly: "This doesn't look like Ruby code."
SYS

snippet = <<~RUBY
  def total(items)
    sum = 0
    for i in 0..items.length
      sum = sum + items[i]
    end
    return sum
  end
RUBY

chat = RubyLLM.chat(model: ENV.fetch("MODEL", "claude-sonnet-5"))
chat.with_instructions(system_prompt)

response = chat.ask(snippet)
puts response.content
