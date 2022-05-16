module ApplicationHelper
  ERB = ::ActionView::Template::Handlers::ERB

  def code(title, format: 'ERB/HTML', &block)
    # raise block.to_s
    formatter = Rouge::Formatters::HTMLLinewise.new(Rouge::Formatters::HTMLInline.new(Rouge::Themes::MonokaiSublime))
    lexer = Rouge::Lexers::ERB.new
    # source = capture(self, &block)
    file, line_number = block.source_location
    lines = File.readlines(file)
    relevant_lines = lines[(line_number - 1)..-1] || []
    txt = extract_first_expression(relevant_lines)
    txt = txt.lines[1..-2].join("\n")
    content = formatter.format(lexer.lex(txt)).html_safe
    render partial: 'samples/code', locals: { title: title, content: content, format: format }
  end

  def extract_first_expression(lines)
    code = ""

    lines.each do |v|
      code << v
      return code if correct_syntax?(compile_erb(code))
    end
    raise SyntaxError, "unexpected $end"
  end

   def correct_syntax?(code)
    stderr = $stderr
    $stderr.reopen(IO::NULL)
    RubyVM::InstructionSequence.compile(code)
    $stderr.reopen(stderr)
    true
  rescue Exception
    $stderr.reopen(stderr)
    false
  end

  def compile_erb(code)
    ERB.erb_implementation.new(
      code,
      :escape => false,
      :trim => (ERB.erb_trim_mode == "-")
    ).src
  end

end
