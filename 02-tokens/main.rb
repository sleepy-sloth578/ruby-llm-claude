# Lesson 2 — Tokens
#
# Covers: what tokens are, and reading usage off a response.

require './setup.rb'

chat = RubyLLM.chat(model: ENV.fetch("MODEL", "claude-sonnet-5"))
response = chat.ask("Explain what a token is to a five-year-old, in two sentences.")

puts response.content
puts
puts "input_tokens:  #{response.tokens.input}"
puts "output_tokens: #{response.tokens.output}"
