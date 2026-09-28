# Lesson 7 — ReAct (Reasoning + Action)
#
# Covers: LLM + tools, the ReAct loop (think -> call a tool -> observe
# -> repeat), and tool chaining.
#
# RubyLLM defines tools as small classes and runs the entire think ->
# call tool -> observe -> repeat loop internally: you never see a
# tool_use block or write a while-loop yourself (contrast with the raw
# Anthropic SDK version, where that loop is hand-rolled).

require './setup.rb'

class GetWeather < RubyLLM::Tool
  description "Get the current weather forecast for a city."
  parameter :city, type: :string, description: "City name, e.g. 'Mesa, AZ'"

  def execute(city:)
    # Stand-in for a real weather API call.
    { city: city, forecast: "sunny", high_f: 88 }
  end
end

class ConvertTemp < RubyLLM::Tool
  description "Convert a Fahrenheit temperature to Celsius."
  parameter :fahrenheit, type: :number, description: "Temperature in Fahrenheit"

  def execute(fahrenheit:)
    celsius = ((fahrenheit.to_f - 32) * 5 / 9).round(1)
    { fahrenheit: fahrenheit, celsius: celsius }
  end
end

chat = RubyLLM.chat(model: ENV.fetch("MODEL", "claude-sonnet-5"))
chat.with_tools(GetWeather).with_tools(ConvertTemp)

# Tool chaining happens automatically inside `ask`: the model can call
# GetWeather, see the result, then decide on its own to call
# ConvertTemp on that result before producing the final answer --
# RubyLLM keeps calling tools and feeding results back until the model
# is done, then returns the final message.
response = chat.ask("What's the weather in Mesa, AZ, and what's that in Celsius?")

puts response.content
