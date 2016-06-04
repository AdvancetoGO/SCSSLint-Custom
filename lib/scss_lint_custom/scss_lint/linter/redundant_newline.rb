module SCSSLint
  # Checks for double line breaks
  class Linter
    class RedundantNewline < Linter
      include LinterRegistry

      MESSAGE = 'Redundant blank line.'.freeze

      def visit_root(_node)
        dummy_node = Struct.new(:line)
        previous, the_one_before = nil

        engine.lines.each_with_index do |line, index|
          if redundant_newlines?(the_one_before, previous, line)
            add_lint(dummy_node.new(index + 1), MESSAGE)
          end
          the_one_before = previous
          previous = line
        end
      end

      private

      def redundant_newlines?(previous, current, nxt)
        return unless previous && current

        previous.end_with?("\n") &&  \
          current.to_s.eql?("\n") && \
          nxt.start_with?("\n")
      end
    end
  end
end
