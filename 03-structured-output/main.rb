# Lesson 4 — Structured output (via a RubyLLM::Schema)
#
# Covers: getting reliable structured data back from the model instead
# of parsing free text, using RubyLLM's schema DSL
require './setup.rb'
require "json"
# Define the exact shape we want back — RubyLLM turns this into the
# underlying JSON-schema/tool-call machinery for you.
class ContactSchema < Schematist::Schema
  string :name
  string :email
  integer :years_experience
end

text = "Hi, I'm Bob Smith(smith@example.com), I've been a " \
       "software engineer for about 6 years."

chat = RubyLLM.chat(model: ENV.fetch("MODEL", "claude-sonnet-5"))
chat.with_schema(ContactSchema)

response = chat.ask(text)
data = response.parsed # already a parsed Hash matching the schema

# Simple manual validation (swap in dry-struct/dry-schema for anything
# more elaborate than this).
required = %w[name email years_experience]
missing = required.reject { |k| data.key?(k) || data.key?(k.to_sym) }
raise "Missing fields: #{missing}" unless missing.empty?

puts JSON.pretty_generate(data)