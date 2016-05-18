module SCSSLint
  # Checks for lines longer than a maximum number of columns.
  class Linter::LineLength < Linter
    include LinterRegistry

    MSG = 'Line is too long. [%d/%d]'.freeze

    def visit_root(_node)
      max_length = config['max'] || 80
      dummy_node = Struct.new(:line)

      engine.lines.each_with_index do |line, index|
        next if line.length <= max_length

        add_lint(
          dummy_node.new(index + 1),
          format(MSG, line.length, max_length)
        )
      end
    end
  end
end
