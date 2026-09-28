# Lesson 4 — Resume ↔ Job Description matcher

**Concept:** the first "real" project — combining a file attachment
with a structured-output call (Lesson 3) to build something actually
useful.

- **Attachments instead of manual parsing** — RubyLLM lets you pass a
  file straight into `chat.ask(prompt, with: "resume.pdf")` and Claude
  reads the PDF/DOCX natively. That replaces the `pdf-reader` /
  `docx` gems and the hand-written `read_pdf` / `read_docx` helpers
  from the raw-SDK version entirely — one fewer thing to maintain.
  - If your installed RubyLLM version or plan doesn't support a given
    file type as an attachment, falling back to extracting text
    yourself with `pdf-reader`/`docx` and passing it as a string (as
    the raw-SDK version did) is a safe fallback — just add those gems
    back to the `Gemfile`.
- **The prompt:** the job description still goes in as plain text
  alongside the attached resume, so the model can compare the two
  directly.
- **The output:** reuses `RubyLLM::Schema` from Lesson 4 so you get
  back a score, matched/missing skills, and a summary as a ready-to-use
  Hash instead of prose you'd have to parse.