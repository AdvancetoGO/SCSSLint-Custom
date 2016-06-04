require 'spec_helper'

describe SCSSLint::Linter::RedundantNewline do
  context 'when a rule is empty' do
    let(:scss) do
      <<-SCSS
        p{
        }
      SCSS
    end

    it 'does not report' do
      expect(subject).not_to(report_lint)
    end
  end

  context 'when there is one empty line' do
    let(:scss) do
      <<-SCSS
        div{
          background: white;
        }

        p{
          font-size: 14px;
        }
      SCSS
    end

    it 'does not report' do
      expect(subject).not_to(report_lint)
    end
  end

  context 'when there are two blank lines' do
    let(:lint_description) { subject.lints.first.description }

    let(:scss) do
      <<-SCSS
        div{
          background: black;
        }


        p{
          color: white;
        }
      SCSS
    end

    it 'reports the line with redundant whitespace' do
      expect(subject).to(report_lint(line: 5))
    end

    it 'reports with the right message' do
      message = 'Redundant blank line.'
      expect(lint_description).to eq(message)
    end
  end
end
