# Lesson 5 — Mini project: Resume <-> Job Description matcher
#
# Covers: passing a real file (PDF or DOCX resume) straight to the
# model as an attachment, combining it with a job description in one
# prompt, and getting a structured match score back.
#
# Usage:
#   ruby main.rb path/to/resume.pdf path/to/job_description.txt

require './setup.rb'
require "json"

class MatchSchema < Schematist::Schema
  integer :match_score, description: "0-100"
  array :matching_skills, of: :string
  array :missing_skills, of: :string
  string :summary
end

resume_path, jd_path = ARGV
if resume_path.nil? || jd_path.nil?
  warn "Usage: ruby main.rb <resume.pdf|.docx|.txt> <job_description.txt>"
  exit 1
end

job_description = File.read(jd_path)

chat = RubyLLM.chat(model: ENV.fetch("MODEL", "claude-sonnet-5"))
chat.with_schema(MatchSchema)

# RubyLLM can hand a PDF/DOCX file straight to Claude as an attachment
# (`with:`), so there's no need to extract text yourself with
# pdf-reader/docx first -- Claude reads the document natively.
response = chat.ask(
  "Compare the attached resume against this job description and report the match.\n\n" \
  "JOB DESCRIPTION:\n#{job_description}",
  with: resume_path
)

puts JSON.pretty_generate(response.content)
