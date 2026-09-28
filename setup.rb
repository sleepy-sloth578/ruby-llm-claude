require "ruby_llm"
require "dotenv/load"

RubyLLM.configure do |config|
  config.anthropic_api_key = ENV.fetch("ANTHROPIC_API_KEY")
end