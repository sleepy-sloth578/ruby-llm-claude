# Lesson 1 — Your first LLM call
#
# Covers: API key setup, picking a model, sending a message

require './setup.rb'

RubyLLM.configure do |config|
  config.anthropic_api_key = ENV.fetch("ANTHROPIC_API_KEY")
end

chat = RubyLLM.chat(model: ENV.fetch("MODEL", "claude-sonnet-5"))
response = chat.ask("In one sentence, what does a Ruby gem do?")

puts response.content
